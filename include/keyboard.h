#ifndef KEYBOARD_H
#define KEYBOARD_H

#include <stdint.h>

#define KEYBOARD_DATA_PORT 0x60
#define KEYBOARD_STATUS_PORT 0x64

// Funciones del driver de teclado
void keyboard_initialize(void);
char keyboard_getchar(void);
uint8_t keyboard_read_scan_code(void);

#endif