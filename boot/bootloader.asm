; Bootloader para OriginOS
; Este bootloader carga el kernel desde el segundo sector

[BITS 16]
[ORG 0x7C00]

start:
    ; Configurar segmentos
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    ; Guardar el drive de boot
    mov [boot_drive], dl

    ; Mostrar mensaje de bienvenida
    mov si, welcome_msg
    call print_string

    ; Cargar kernel desde el disco
    mov bx, 0x1000      ; Dirección donde cargar el kernel
    mov ah, 0x02        ; Función de lectura de BIOS
    mov al, 32          ; Número de sectores a leer (32 sectores = ~16KB)
    mov ch, 0           ; Cilindro 0
    mov cl, 2           ; Sector 2 (el sector 1 es el bootloader)
    mov dh, 0           ; Cabeza 0
    mov dl, [boot_drive] ; Usar el drive de boot detectado
    int 0x13            ; Llamada a BIOS

    jc disk_error       ; Saltar si hay error
    
    ; Verificar si se leyeron sectores
    cmp al, 32
    jne disk_error      ; Si no se leyeron todos los sectores

    ; Mensaje de kernel cargado
    mov si, kernel_loaded_msg
    call print_string

    ; Saltar al kernel
    jmp 0x1000

disk_error:
    mov si, error_msg
    call print_string
    jmp $

print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 0x10
    jmp print_string
done:
    ret

welcome_msg db 'OriginOS Bootloader v1.0', 0x0D, 0x0A, 'Cargando kernel...', 0x0D, 0x0A, 0
kernel_loaded_msg db 'Kernel cargado exitosamente!', 0x0D, 0x0A, 0
error_msg db 'Error cargando el kernel!', 0x0D, 0x0A, 0
boot_drive db 0

; Padding y firma del boot sector
times 510-($-$$) db 0
dw 0xAA55