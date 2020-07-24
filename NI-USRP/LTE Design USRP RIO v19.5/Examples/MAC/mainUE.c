#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <errno.h>
#include <string.h>

// NIAPI definitions
#include "LTE_API.h"
#include "lte.h"
#include "pipe.h"
#include "handler.h"
#include "lte_handler.h"
#include "message.h"
#include "time.h"

uint64_t currentTime() {
  struct timespec ts;
  clock_gettime(CLOCK_MONOTONIC, &ts);
  return 1E3*ts.tv_sec + ts.tv_nsec / 1E6;
}

bool lastIndicationReceived(uint64_t lastIndication) {
  bool result = lastIndication > 0; 
  if (result) { // only check if there was at least one indication received
    result = (currentTime() - lastIndication) > 10;
  }
  return result;
}

int32_t main( int32_t argc, char* argv[] ) {

  //---------------------------------------------------------
  // check for command line parameters
  //---------------------------------------------------------


  if (argc != 1) {
    // if not enough parameters, abort
    printf( "ERROR: not command line parameter expected\n" );
    return -1;
  }

  //---------------------------------------------------------
  // initialize named pipes
  //---------------------------------------------------------

  printf( "Preparing named pipes\n" );

  char* pipe_name_1 = (char*)"/tmp/api_transport_0-0_pipe";
  char* pipe_name_2 = (char*)"/tmp/api_transport_0-1_pipe";
  char* pipe_name_3 = (char*)"/tmp/api_transport_0-2_pipe";

  int32_t fd1 = -1;
  int32_t fd2 = -1;
  int32_t fd3 = -1;

  fd_set readFds1;
  int32_t fdMax1 = 0;
  fd_set readFds3;
  int32_t fdMax3 = 0;

  // Assumption: The LV counterpart has created the FIFOs and will also clean them up at the end
  OpenPipeForTx(pipe_name_2, &fd2);
  OpenPipeForRx(pipe_name_1, &fd1, &readFds1, &fdMax1);
  OpenPipeForRx(pipe_name_3, &fd3, &readFds3, &fdMax3);

  //---------------------------------------------------------
  // prepare variables
  //---------------------------------------------------------

  printf( "Preparing variables\n" );

  struct timespec ts;  // main loop wait time
  ts.tv_sec = 0;
  ts.tv_nsec = 10000L;

  uint64_t lastIndication = 0L;

  // buffer for NIAPI messages
  #define MAX_BUF_U8 10240
  uint8_t*  pBufU8  = (uint8_t*)malloc(MAX_BUF_U8*sizeof(uint8_t));
  memset(pBufU8, 0, MAX_BUF_U8);
  uint32_t bufOffsetU8 = 0;

  int32_t  nread  = 0;
  int32_t  nwrite = 0;

  // NIAPI related parameters
  uint32_t msgType    = 0;
  uint32_t bodyLength = 0;
  uint64_t refId      = 0;
  uint32_t rnti       = 10;

  // NIAPI messages

  PhyDlschRxInd phyDlschRxInd;

  // counters for debugging

  uint64_t num_PhyTimingInd      = 0;
  uint64_t num_PhyDlschRxInd     = 0;

  //---------------------------------------------------------
  // main loop
  //---------------------------------------------------------

  printf( "Start main loop\n" );
  fflush( stdout );
  while ( not lastIndicationReceived(lastIndication) ) {
    
    //----------------------------------------------------------------
    // read timing indication
    //----------------------------------------------------------------

    nread = PipeRead(&fd1, &readFds1, &fdMax1, pBufU8, 16); // TTI indication = 16 bytes

    if (nread > 0) {

      bufOffsetU8 = 0;
      GetMsgType( &msgType, pBufU8, &bufOffsetU8 );

      switch (msgType) {
        // Read out the timing trigger
        case (PHY_TIMING_IND):
          num_PhyTimingInd++;

          break;

        default:
          printf( "Received UNKNOWN message. pipe=%s msgType=0x%04x\n", pipe_name_1, msgType );
      }
    }
    //
    //----------------------------------------------------------------
    // read DL RX payload
    //----------------------------------------------------------------

    // read general message header
    nread = PipeRead( &fd3, &readFds3, &fdMax3, pBufU8, 8 ); // genMsgHdr = 8 bytes

    if (nread > 0) {

      // Extract message type and body length (variable)
      bufOffsetU8 = 0;
      GetMsgType( &msgType, pBufU8, &bufOffsetU8 );
      GetBodyLength( &bodyLength, pBufU8, &bufOffsetU8 );

      // Read rest of the message
      if ( bodyLength > PipeRead(&fd3, &readFds3, &fdMax3, pBufU8+8, bodyLength ) ) {
        printf( "ERROR: Could not read requested amount of bytes. pipe=%s, num_requested=%i, num_received=%i\n", pipe_name_3, bodyLength, nread );
      }

      switch (msgType) {
        case (PHY_DLSCH_RX_IND):
          num_PhyDlschRxInd++;
          DeserializePhyDlschRxInd( &phyDlschRxInd, pBufU8, &bufOffsetU8 );
          lastIndication = currentTime();
          break;

        default:
          printf( "Received UNKNOWN message. pipe=%s msgType=0x%04x\n", pipe_name_3, msgType );
          break;
      }
    }

    nanosleep( &ts, NULL );   // wait a little bit and then start over again

  }

  free( pBufU8 );

  //---------------------------------------------------------

  printf( "All done\n" );
  printf( "num_PhyDlschRxInd     = %i\n", num_PhyDlschRxInd );

  return 0;
}
