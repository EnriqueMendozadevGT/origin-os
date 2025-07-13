#ifndef VGA_H
#define VGA_H

#include <stdint.h>
#include <stddef.h>

#define VGA_WIDTH 80
#define VGA_HEIGHT 25
#define VGA_MEMORY 0xB8000

// Funciones del driver VGA
void vga_initialize(void);
void vga_clear(void);
void vga_putchar(char c);
void vga_write(const char* data, size_t size);
void vga_writestring(const char* data);
void vga_set_color(uint8_t color);
uint8_t vga_entry_color(uint8_t fg, uint8_t bg);
uint16_t vga_entry(unsigned char uc, uint8_t color);

#endif