#pragma once

#include <stdint.h>       // integer types
#include "LTE_API.h"

//--------------------------------------------------------------------------------------

// these low-level functions are not available outside of this module, hence static

static int32_t SerializeMessageHeader(
  GenMsgHdr* p_genMsgHdr,
  SubMsgHdr* p_subMsgHdr,
  uint8_t*   p_buffer,
  uint32_t*  p_bufferOffset
);

static int32_t DeserializeMessageHeader(
  GenMsgHdr* p_genMsgHdr,
  SubMsgHdr* p_subMsgHdr,
  uint8_t*   p_buffer,
  uint32_t*  p_bufferOffset
);

static int32_t SerializeParameterSet(
  uint32_t  msgType,
  uint32_t  subMsgType,
  ParSetHdr* p_parSetHdr,
  uint32_t* p_msgBody,      // Note: Type is uint32_t* in order to support generic parameter sets
  uint8_t*  p_buffer,
  uint32_t* p_bufferOffset
);

static int32_t DeserializeParameterSet(
  uint32_t  msgType,
  uint32_t  subMsgType,
  ParSetHdr* p_parSetHdr,
  uint32_t* p_msgBody,      // Note: Type is uint32_t* in order to support generic parameter sets
  uint8_t*  p_buffer,
  uint32_t* p_bufferOffset
);

static int32_t SerializePayload(
  uint8_t*  p_payloadBuffer,
  uint32_t  num_el,
  uint8_t*  p_buffer,
  uint32_t* p_bufferOffset
);

static int32_t DeserializePayload(
  uint8_t*  p_payloadBuffer,
  uint32_t  num_el,
  uint8_t*  p_buffer,
  uint32_t* p_bufferOffset
);

//--------------------------------------------------------------------------------------

// Add serialization/deserialization fucntions for each NIAPI message as needed

int32_t SerializePhyDlTxConfigReq(
  PhyDlTxConfigReq* p_phyDlTxConfigReq,
  uint8_t*          p_buffer,
  uint32_t*         p_bufferOffset
);

int32_t SerializePhyDlTxPayloadReq(
  PhyDlTxPayloadReq* p_phyDlTxPayloadReq,
  uint8_t*           p_buffer,
  uint32_t*          p_bufferOffset
);

int32_t DeserializePhyTimingInd(
  PhyTimingInd* p_phyTimingInd,
  uint8_t*      p_buffer,
  uint32_t*     p_bufferOffset
);

int32_t DeserializePhyDlschRxInd(
  PhyDlschRxInd* p_phyDlschRxInd,
  uint8_t*       p_buffer,
  uint32_t*      p_bufferOffset
);

int32_t DeserializePhyCnf(
  PhyCnf*   p_phyCnf,
  uint8_t*  p_buffer,
  uint32_t* p_bufferOffset
);

//======================================================================================
//======================================================================================

