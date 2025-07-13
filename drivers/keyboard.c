#include "../include/keyboard.h"
#include "../include/io.h"

// Mapa de scan codes a caracteres ASCII más completo
static char scancode_to_ascii[] = {
    0,   0,   '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', '\b',
    '\t','q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',
    0,   'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'','`',
    0,   '\\','z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', 0,
    '*', 0,   ' ', 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
};

void keyboard_initialize(void) {
    // Por ahora, inicialización básica
    // En un sistema más complejo, aquí se configurarían las interrupciones
}

uint8_t keyboard_read_scan_code(void) {
    // Esperar hasta que haya datos disponibles
    while (!(inb(KEYBOARD_STATUS_PORT) & 1)) {
        // Esperar
    }
    
    return inb(KEYBOARD_DATA_PORT);
}

char keyboard_getchar(void) {
    uint8_t scan_code;
    
    while (1) {
        // Esperar hasta que haya datos disponibles
        while (!(inb(KEYBOARD_STATUS_PORT) & 1)) {
            // Espera activa
        }
        
        scan_code = inb(KEYBOARD_DATA_PORT);
        
        // Solo procesar key press (scan codes < 0x80)
        if (scan_code < 0x80) {
            // Verificar que el scan code esté en el rango válido
            if (scan_code < sizeof(scancode_to_ascii)) {
                char ascii_char = scancode_to_ascii[scan_code];
                if (ascii_char != 0) {
                    return ascii_char;
                }
            }
        }
    }
}