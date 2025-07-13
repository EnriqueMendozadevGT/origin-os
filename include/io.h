#ifndef IO_H
#define IO_H

#include <stdint.h>

// Funciones de entrada/salida de puertos
static inline uint8_t inb(uint16_t port) {
    uint8_t result;
    __asm__ volatile ("in %%dx, %%al" : "=a" (result) : "d" (port));
    return result;
}

static inline void outb(uint16_t port, uint8_t data) {
    __asm__ volatile ("out %%al, %%dx" : : "a" (data), "d" (port));
}

static inline uint16_t inw(uint16_t port) {
    uint16_t result;
    __asm__ volatile ("in %%dx, %%ax" : "=a" (result) : "d" (port));
    return result;
}

static inline void outw(uint16_t port, uint16_t data) {
    __asm__ volatile ("out %%ax, %%dx" : : "a" (data), "d" (port));
}

#endif