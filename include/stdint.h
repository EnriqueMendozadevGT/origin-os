#ifndef STDINT_H
#define STDINT_H

// Tipos básicos de entero
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;

// Definiciones de tamaño
#define INT8_MAX 127
#define INT8_MIN (-128)
#define UINT8_MAX 255

#define INT16_MAX 32767
#define INT16_MIN (-32768)
#define UINT16_MAX 65535

#define INT32_MAX 2147483647
#define INT32_MIN (-2147483648)
#define UINT32_MAX 4294967295U

#endif