#pragma once

#include "stdint.h"   // integer types



//======================================================================================
// NIAPI constants
//======================================================================================

// msgType used in GenMsgHdr

// common
#define PHY_TIMING_IND        0x4001   // 16385
#define PHY_CNF               0x4202   // 16898

// eNB TX
#define PHY_DL_TX_CONFIG_REQ  0x4501   // 17665
#define PHY_DL_TX_PAYLOAD_REQ 0x4502   // 17666

// eNB RX
#define PHY_ULSCH_RX_IND  0x4401   // 17409

// UE RX
#define PHY_DLSCH_RX_IND      0x4801   // 18433

//--------------------------------------------------------------

// subMsgType used in ParSetHdr

#define DLSCH_TX_CONFIG        0x1
#define DCI_TX_CONFIG_DL_GRANT 0x2
#define DLSCH_MAC_PDU          0x0

//--------------------------------------------------------------

// confirmation status codes

#define CNF_SUCCESS                   0x0
#define CNF_UNKNOWN_MESSAGE           0x1
#define CNF_MESSAGE_NOT_SUPPORTED     0x2
#define CNF_UNKNOWN_PARAMETER_SET     0x3
#define CNF_MISSING_PARAMETER_SET     0x4
#define CNF_PARAMETER_SET_REPETITION  0x5
#define CNF_RANGE_VIOLATION           0x6
#define CNF_STATE_VIOLATION           0x7
#define CNF_TIMEOUT                   0x8
#define CNF_CONFIG_PAYLOAD_MISMATCH   0x9
#define CNF_LENGTH_MISMATCH           0xA
#define CNF_INPUT_BUFFER_FULL         0xB
#define CNF_INTERNAL_ERROR            0xC
#define CNF_INSTANCE_ID_MISMATCH      0xD

// magic numbers
#define MAX_MAC_PDU_SIZE              9422    // tbs=9422 for prb=110 and mcs=28

//======================================================================================
// NIAPI message headers
//======================================================================================

#define MAX_ELEMENTS_IN_STRUCT 10

// This struct holds information about how to pack the headers.
typedef struct sElementsSpec {
  uint32_t numEl;
  uint8_t  byteWidth[MAX_ELEMENTS_IN_STRUCT];
} ElementsSpec;



//--------------------------------------------------------------------------------------
// general message header -- 8 bytes
//--------------------------------------------------------------------------------------

typedef struct sGenMsgHdr {
  uint32_t msgType;           // message type ID
  uint32_t refId;             // reference ID,  e.g. Running message sequence number
  uint32_t instId;            // instance ID
  uint32_t bodyLength;        // message body length in bytes
} GenMsgHdr;

static const ElementsSpec genMsgHdrSpec = {
  .numEl    = 4,
  .byteWidth = {2, 2, 1, 3},
};



//--------------------------------------------------------------------------------------
// sub message header -- 8 bytes
//--------------------------------------------------------------------------------------

typedef struct sSubMsgHdr {
  uint32_t sfn;           // system frame number
  uint32_t tti;           // tti or slot index
  uint32_t numSubMsg;     // number of sub messages
  uint32_t cnfMode;       // confirm mode
  uint32_t resField;      // reserved bits
} SubMsgHdr;

static const ElementsSpec subMsgHdrSpec = {
  .numEl    = 5,
  .byteWidth = {2, 1, 1, 1, 3},
};



//--------------------------------------------------------------------------------------
// parameter set header -- 5 bytes
//--------------------------------------------------------------------------------------

typedef struct sParSetHdr {
  uint32_t subMsgType;
  uint32_t parSetId;
  uint32_t parSetBodyLength;
} ParSetHdr;

static const ElementsSpec parSetHdrSpec = {
  .numEl    = 3,
  .byteWidth = { 1, 1, 3},
};



//======================================================================================
// NIAPI message bodies (= parameter sets)
//======================================================================================

//--------------------------------------------------------------------------------------
// PHY_CNF --> CNF -- 3 bytes
//--------------------------------------------------------------------------------------

typedef struct sCnfBody {
  uint32_t cnfStatus;
  uint32_t srcMsgType;

} CnfBody;

static const ElementsSpec cnfBodySpec = {
  .numEl    = 2,
  .byteWidth = {1, 2},
};



//--------------------------------------------------------------------------------------
// PHY_DL_TX_CONFIG_REQ --> DLSCH_TX_CONFIG -- 8 bytes
//--------------------------------------------------------------------------------------

typedef struct sDlschTxConfigBody {
  uint32_t macPduIndex;
  uint32_t rnti;
  uint32_t prbAllocation;
  uint32_t mcs;
} DlschTxConfigBody;

static const ElementsSpec dlschTxConfigBodySpec = {
  .numEl    = 4,
  .byteWidth = {1, 2, 4, 1},
};



//--------------------------------------------------------------------------------------
// PHY_DL_TX_CONFIG_REQ --> DCI_TX_CONFIG_DL_GRANT -- 9 bytes
//--------------------------------------------------------------------------------------

typedef struct sDciTxConfigDlGrantBody {
  uint32_t rnti;
  uint32_t cceOffset;
  uint32_t prbAllocation;
  uint32_t mcs;
  uint32_t tpc;
} DciTxConfigDlGrantBody;

static const ElementsSpec dciTxConfigDlGrantBodySpec = {
  .numEl    = 5,
  .byteWidth = {2, 1, 4, 1, 1},
};



//--------------------------------------------------------------------------------------
// PHY_DL_TX_PAYLOAD_REQ --> DLSCH_MAC_PDU_TX -- (4+tbs) bytes
//--------------------------------------------------------------------------------------

typedef struct sDlschMacPduTxBody {
  uint32_t macPduIndex;
  uint32_t macPduSize;
  uint8_t  macPdu[MAX_MAC_PDU_SIZE];
} DlschMacPduTxBody;

static const ElementsSpec dlschMacPduTxBodySpec = {
  .numEl    = 2,            // macPdu is not considered here, handle the uint8_t array separately
  .byteWidth = {1, 3},
};



//--------------------------------------------------------------------------------------
// PHY_DLSCH_RX_IND --> DLSCH_MAC_PDU_RX -- (4+tbs) bytes
//--------------------------------------------------------------------------------------

typedef struct sDlschMacPduRxBody {
  uint32_t rnti;
  uint32_t crcResult;
  uint32_t macPduSize;
  uint8_t macPdu[MAX_MAC_PDU_SIZE];
} DlschMacPduRxBody;

static const ElementsSpec dlschMacPduRxBodySpec = {
  .numEl    = 3,            // macPdu is not considered here, handle the uint8_t array separately
  .byteWidth = {2, 1, 3},
};



//======================================================================================
// Definition of complete NIAPI messages
//======================================================================================

typedef struct sPhyTimingInd {
  GenMsgHdr       genMsgHdr;
  SubMsgHdr       subMsgHdr;
} PhyTimingInd;

typedef struct sPhyCnf {
  GenMsgHdr genMsgHdr;
  SubMsgHdr subMsgHdr;
  ParSetHdr cnfHdr;
  CnfBody   cnfBody;
} PhyCnf;

typedef struct sPhyDlTxConfigReq {
  GenMsgHdr              genMsgHdr;
  SubMsgHdr              subMsgHdr;
  ParSetHdr              dlschTxConfigHdr;
  DlschTxConfigBody      dlschTxConfigBody;
  ParSetHdr              dciTxConfigDlGrantHdr;
  DciTxConfigDlGrantBody dciTxConfigDlGrantBody;
} PhyDlTxConfigReq;

typedef struct sPhyDlTxPayloadReq {
  GenMsgHdr         genMsgHdr;
  SubMsgHdr         subMsgHdr;
  ParSetHdr         dlschMacPduTxHdr;
  DlschMacPduTxBody dlschMacPduTxBody;
} PhyDlTxPayloadReq;

typedef struct sPhyDlschRxInd {
  GenMsgHdr         genMsgHdr;
  SubMsgHdr         subMsgHdr;
  ParSetHdr         dlschMacPduRxHdr;
  DlschMacPduRxBody dlschMacPduRxBody;
} PhyDlschRxInd;

//======================================================================================
//======================================================================================

