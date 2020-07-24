#pragma once

#include <stdint.h>
//#include <boost/date_time/posix_time/posix_time.hpp>  // timestamps

#include "LTE_API.h"


//=============================================================================================================================
//=============================================================================================================================

  // manipulate buffer
  int32_t InsertU64( uint8_t* p_buffer, uint32_t offset, uint64_t value );
  int32_t InsertU32( uint8_t* p_buffer, uint32_t offset, uint32_t value );
  int32_t ExtractU64( uint8_t* p_buffer, uint32_t offset, uint64_t* p_value );
  int32_t ExtractU32( uint8_t* p_buffer, uint32_t offset, uint32_t* p_value );
  int32_t GetMsgType( uint32_t* p_msgType, uint8_t* p_buffer, uint32_t* p_bufferOffset );
  int32_t GetBodyLength( uint32_t* p_bodyLength, uint8_t* p_buffer, uint32_t* p_bufferOffset );

  // print 
  int32_t PrintBuffer( uint8_t* p_buffer, uint32_t bufferOffset, uint32_t length );
  int32_t PrintMsgType( uint32_t msgType );
  int32_t PrintCnfStatus( uint32_t cnfStatus );
  int32_t PrintHeader( GenMsgHdr* p_genMsgHdr, SubMsgHdr* p_subMsgHdr );
  int32_t PrintPhyTimingInd( PhyTimingInd* p_phyTimingInd );
  int32_t PrintPhyCnf( PhyCnf* p_phyCnf );
  int32_t PrintPhyDlTxConfigReq( PhyDlTxConfigReq* p_phyDlTxConfigReq );
  int32_t PrintPhyDlTxPayloadReq( PhyDlTxPayloadReq* p_phyDlTxPayloadReq );
  int32_t PrintPhyDlschRxInd( PhyDlschRxInd* p_phyDlschRxInd );

  // initialize
  int32_t InitializePhyDlTxConfigReq( PhyDlTxConfigReq* p_phyDlTxConfigReq );
  int32_t InitializePhyDlTxPayloadReq( PhyDlTxPayloadReq* p_phyDlTxPayloadReq );

//=============================================================================================================================
//=============================================================================================================================

