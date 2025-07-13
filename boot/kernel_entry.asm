; Entrada del kernel en assembly
; Este archivo configura el modo protegido y llama al kernel en C

[BITS 16]
[EXTERN kernel_main]

global _start

_start:
    ; Deshabilitar interrupciones
    cli

    ; Cargar GDT
    lgdt [gdt_descriptor]

    ; Habilitar modo protegido
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; Salto far para cargar CS
    jmp 0x08:protected_mode

[BITS 32]
protected_mode:
    ; Configurar segmentos de datos
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    ; Configurar stack
    mov esp, 0x90000

    ; Llamar al kernel principal
    call kernel_main

    ; Si el kernel retorna, hacer halt
    cli
    hlt

; Global Descriptor Table
gdt_start:
    ; Entrada nula
    dq 0

gdt_code:
    ; Segmento de código
    dw 0xFFFF       ; Límite 0-15
    dw 0            ; Base 0-15
    db 0            ; Base 16-23
    db 10011010b    ; Flags: present, ring 0, code segment, executable, readable
    db 11001111b    ; Flags: granularity, 32-bit, límite 16-19
    db 0            ; Base 24-31

gdt_data:
    ; Segmento de datos
    dw 0xFFFF       ; Límite 0-15
    dw 0            ; Base 0-15
    db 0            ; Base 16-23
    db 10010010b    ; Flags: present, ring 0, data segment, writable
    db 11001111b    ; Flags: granularity, 32-bit, límite 16-19
    db 0            ; Base 24-31

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1  ; Tamaño
    dd gdt_start                ; Dirección