#pragma once

#include <stdio.h>    // printf
#include <stdint.h>   // integer types

#include <fcntl.h>      // for named pipe
#include <sys/stat.h>   // for named pipe
#include <sys/select.h> // for reading pipe with select
#include <unistd.h>
#include <errno.h>  // errno
#include <string.h> // strerror
#include <time.h>
//#include <boost/date_time/posix_time/posix_time.hpp>  // nanosleep



//=============================================================================================================================
// https://stackoverflow.com/questions/2784500/how-to-send-a-simple-string-between-two-programs-using-pipes
//=============================================================================================================================

  int32_t OpenFifo(
    char* fifoName
  );

  int32_t CloseFifo(
    char* fifoName
  );

  //-------------------------------------------------

  int32_t OpenPipeForTx(
    char*    fifoName,
    int32_t* pFd
  );

  int32_t OpenPipeForRx(
    char*    fifoName,
    int32_t* pFd,
    fd_set*  pReadFds,
    int32_t* pFdMax
  );

  int32_t ClosePipe(
    int32_t* pFd
  );

  //-------------------------------------------------

  int32_t PipeWrite(
    int32_t* pFd,
    uint8_t* pBufU8,
    uint16_t len
  );

  int32_t PipeRead(
    int32_t*  pFd,
    fd_set*   pReadFds,
    int32_t*  pFdMax,
    uint8_t*  pBufU8,
    uint16_t  max_len
  );

  int32_t PipeReadOnce(
    int32_t* pFd,
    uint8_t* pBufU8,
    uint16_t max_len
  );

//=============================================================================================================================
//=============================================================================================================================

