#pragma once

#include <stdint.h>       // integer types
#include "LTE_API.h"
//#include "NiapiTypes.h"   // NIAPI message definitions

int32_t SerializeStruct(uint32_t* p_struct, uint32_t  num_el, uint8_t*  p_byte_width, uint8_t*  p_buffer, uint32_t* p_buffer_offset);
int32_t DeserializeStruct( uint32_t* p_struct, uint32_t  num_el, uint8_t*  p_byte_width, uint8_t*  p_buffer, uint32_t* p_buffer_offset);

