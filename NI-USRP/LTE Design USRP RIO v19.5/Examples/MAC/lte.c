#include "lte.h"

#include <stdint.h>


//=============================================================================================================================
// get the LTE transport block size based on MCS and number of allocated PRB
int32_t GetTbs(
  uint32_t  mcs,
  uint32_t  prbAllocationU25,  // 1 active bit = 4 PRB
  uint32_t* p_tbs              // return value in bytes
)
//=============================================================================================================================
{

  // use builtin function popcount to count number of active bits in prb mask
  (*p_tbs) = tbsTableBits[ __builtin_popcountll(prbAllocationU25)*4-1 ][ McsToItbs[mcs] ] / 8;

  return 0;
};
//=============================================================================================================================
//=============================================================================================================================
