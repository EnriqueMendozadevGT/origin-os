# Configuración del compilador
CC = i686-elf-gcc
ASM = nasm
LD = i686-elf-ld

# Flags de compilación
CFLAGS = -std=gnu99 -ffreestanding -O2 -Wall -Wextra -fno-stack-protector -fno-pic -m32
ASMFLAGS = -f elf32
LDFLAGS = -m elf_i386

# Directorios
BOOT_DIR = boot
KERNEL_DIR = kernel
DRIVERS_DIR = drivers
INCLUDE_DIR = include
BUILD_DIR = build
TOOLS_DIR = tools

# Archivos fuente
BOOT_SOURCES = $(BOOT_DIR)/bootloader.asm $(BOOT_DIR)/kernel_entry.asm
KERNEL_SOURCES = $(KERNEL_DIR)/kernel.c
DRIVER_SOURCES = $(DRIVERS_DIR)/vga.c $(DRIVERS_DIR)/keyboard.c

# Archivos objeto
BOOT_OBJECTS = $(BUILD_DIR)/bootloader.bin $(BUILD_DIR)/kernel_entry.o
KERNEL_OBJECTS = $(BUILD_DIR)/kernel.o
DRIVER_OBJECTS = $(BUILD_DIR)/vga.o $(BUILD_DIR)/keyboard.o

# Archivo final
OS_IMAGE = $(BUILD_DIR)/origin.img
ISO_IMAGE = $(BUILD_DIR)/origin.iso

.PHONY: all clean run iso install-deps

all: $(OS_IMAGE)

# Crear directorios de build
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compilar bootloader
$(BUILD_DIR)/bootloader.bin: $(BOOT_DIR)/bootloader.asm | $(BUILD_DIR)
	$(ASM) -f bin $< -o $@

# Compilar kernel entry
$(BUILD_DIR)/kernel_entry.o: $(BOOT_DIR)/kernel_entry.asm | $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# Compilar kernel
$(BUILD_DIR)/kernel.o: $(KERNEL_DIR)/kernel.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# Compilar drivers
$(BUILD_DIR)/vga.o: $(DRIVERS_DIR)/vga.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

$(BUILD_DIR)/keyboard.o: $(DRIVERS_DIR)/keyboard.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# Enlazar kernel
$(BUILD_DIR)/kernel.bin: $(BUILD_DIR)/kernel_entry.o $(KERNEL_OBJECTS) $(DRIVER_OBJECTS) $(TOOLS_DIR)/linker.ld
	$(LD) $(LDFLAGS) -T $(TOOLS_DIR)/linker.ld -o $(BUILD_DIR)/kernel.elf $(BUILD_DIR)/kernel_entry.o $(KERNEL_OBJECTS) $(DRIVER_OBJECTS)
	i686-elf-objcopy -O binary $(BUILD_DIR)/kernel.elf $@

# Crear imagen del OS
$(OS_IMAGE): $(BUILD_DIR)/bootloader.bin $(BUILD_DIR)/kernel.bin
	dd if=/dev/zero of=$@ bs=512 count=2880
	dd if=$(BUILD_DIR)/bootloader.bin of=$@ bs=512 count=1 conv=notrunc
	dd if=$(BUILD_DIR)/kernel.bin of=$@ bs=512 seek=1 conv=notrunc

# Crear ISO booteable
iso: $(ISO_IMAGE)

$(ISO_IMAGE): $(OS_IMAGE)
	mkdir -p $(BUILD_DIR)/iso/boot/grub
	cp $(OS_IMAGE) $(BUILD_DIR)/iso/boot/origin.img
	echo 'menuentry "OriginOS" {' > $(BUILD_DIR)/iso/boot/grub/grub.cfg
	echo '    multiboot /boot/origin.img' >> $(BUILD_DIR)/iso/boot/grub/grub.cfg
	echo '}' >> $(BUILD_DIR)/iso/boot/grub/grub.cfg
	grub-mkrescue -o $@ $(BUILD_DIR)/iso

# Ejecutar en QEMU
run: $(OS_IMAGE)
	qemu-system-i386 -drive format=raw,file=$<,if=ide

# Ejecutar ISO en QEMU
run-iso: $(ISO_IMAGE)
	qemu-system-i386 -cdrom $<

# Instalar dependencias (macOS con Homebrew)
install-deps:
	@echo "Instalando dependencias para macOS..."
	brew install i686-elf-gcc nasm qemu grub
	@echo "Dependencias instaladas. Ahora puedes compilar con 'make all'"

# Limpiar archivos compilados
clean:
	rm -rf $(BUILD_DIR)

# Ayuda
help:
	@echo "OriginOS Build System"
	@echo "====================="
	@echo "Comandos disponibles:"
	@echo "  make all          - Compilar el sistema operativo"
	@echo "  make run          - Ejecutar en QEMU (imagen raw)"
	@echo "  make iso          - Crear imagen ISO booteable"
	@echo "  make run-iso      - Ejecutar ISO en QEMU"
	@echo "  make install-deps - Instalar dependencias (macOS)"
	@echo "  make clean        - Limpiar archivos compilados"
	@echo "  make help         - Mostrar esta ayuda"