#include "handler.h"

//======================================================================================
// Serialize any NIAPI structure defined in NiapiTypes.h to uint8_t buffer.
int32_t SerializeStruct(
  uint32_t* p_struct,
  uint32_t  num_el,
  uint8_t*  p_byte_width,
  uint8_t*  p_buffer,
  uint32_t* p_buffer_offset
)
//======================================================================================
{

  uint8_t  tmp_buffer = 0; // temporary buffer variable
  uint32_t truncSeq   = 0; // sequence to be truncated into bytes which will be sent to buffer

  // for each parameter in the header
  for ( uint32_t i=0; i<num_el; i++ )
  {
    // if current parameter is already 1 byte large, write it directly into the buffer and increase the buffer offset
    if (*(p_byte_width+i) == 1)
    {
      p_buffer[(*p_buffer_offset)] = p_struct[i];
      (*p_buffer_offset)++;
    }
    else
    {
      // start with most significant byte
      truncSeq = p_struct[i];                       //write current parameter into temporary variable truncSeq
      for (uint32_t j = *(p_byte_width+i); j > 0; j--)
      {
        tmp_buffer = truncSeq >> 8*(j-1);           // truncate variable to 1 byte by shifting, starting with MSB
        p_buffer[(*p_buffer_offset)] = tmp_buffer;  // write this byte into the buffer

        (*p_buffer_offset)++;                       // continue with next U8 buffer line
      }
    }
  }

  return 0;
}
//======================================================================================
//======================================================================================



//======================================================================================
// Deserialize any NIAPI structure defined in NiapiTypes.h from uint8_t buffer.
int32_t DeserializeStruct(
  uint32_t* p_struct,
  uint32_t  num_el,
  uint8_t*  p_byte_width,
  uint8_t*  p_buffer,
  uint32_t* p_buffer_offset
)
//======================================================================================
{

  uint32_t concatSeq = 0; // temporary variable for concatenation of buffer contents

  // for each parameter in the header
  for (uint32_t i=0; i<num_el; i++)
  {
    // if current parameter is already 1 byte large, write buffer directly into the structure and increase the buffer offset
    if (*(p_byte_width+i) == 1)
    {
      p_struct[i] = p_buffer[(*p_buffer_offset)];
      (*p_buffer_offset)++;
    }
    else
    {
      // start with most significant byte
      concatSeq = p_buffer[(*p_buffer_offset)];       // write current buffer content into temporary variable
      for (uint32_t j=1; j < *(p_byte_width+i); j++)
      {
        (*p_buffer_offset)++;                                         // increase buffer offset
        concatSeq = (concatSeq << 8) | p_buffer[(*p_buffer_offset)];  // concatenate buffer contents
      }
      p_struct[i] = concatSeq;        // write concatenated value to corresponding structure
      (*p_buffer_offset)++;           // continue with next line in buffer
    }
  }

  return 0;
}
