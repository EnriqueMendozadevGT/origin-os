# 🌟 OriginOS v2.0

**Un sistema operativo completo desarrollado desde cero para arquitectura x86**

![OriginOS](https://img.shields.io/badge/OS-OriginOS%20v2.0-blue?style=for-the-badge)
![Architecture](https://img.shields.io/badge/Arch-x86%2032bit-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Funcionando-brightgreen?style=for-the-badge)

## 🎯 Estado del Proyecto

✅ **COMPLETADO Y FUNCIONANDO PERFECTAMENTE**

OriginOS v2.0 es un sistema operativo completamente funcional con:

- ✅ **Bootloader robusto** con detección automática de drive
- ✅ **Kernel en modo protegido** de 32 bits
- ✅ **Shell avanzado v2.0** con control de terminal mejorado
- ✅ **15+ comandos interactivos** con funcionalidades completas
- ✅ **Drivers optimizados** (VGA con colores, Teclado PS/2)
- ✅ **Sistema de compilación** robusto y completo

## 🚀 Inicio Rápido

### 1. Instalar Dependencias (macOS)
```bash
brew install nasm qemu i686-elf-gcc
```

### 2. Clonar y Compilar
```bash
git clone https://github.com/EnriqueMendozadevGT/origin-os.git
cd origin-os
make all
```

### 3. Ejecutar OriginOS
```bash
make run
# Para salir: Ctrl+A, luego X
```

## 🖥️ Interfaz del Sistema

### Pantalla de Bienvenida
```
==============================================
          Bienvenido a OriginOS v2.0         
==============================================

Sistema operativo desarrollado desde cero
Autor: Enrique Mendoza
Version: 2.0.0 - Shell Avanzado

Kernel inicializado correctamente!
Componentes cargados:
  ✓ VGA Text Mode Driver
  ✓ Keyboard Driver Optimizado
  ✓ Shell v2.0 con Control Avanzado
  ✓ Sistema de Comandos Expandido
```

### Shell Avanzado v2.0
```
OriginOS@localhost:~$ help
=== AYUDA COMPLETA DE ORIGINOS ===
Comandos del Sistema:
  help      - Mostrar esta ayuda
  clear     - Limpiar pantalla
  info      - Informacion del sistema
  ver       - Version del OS
  reboot    - Reiniciar sistema

Informacion:
  mem       - Estado de memoria
  time      - Fecha y hora
  ps        - Lista de procesos
  ls        - Lista de archivos

Herramientas:
  calc 5+3  - Calculadora
  echo hola - Repetir texto
  banner    - Banner del sistema
  test      - Prueba del sistema
```

## 🎮 Comandos Disponibles

### 📋 Comandos Básicos
- `help` - Ayuda completa del sistema
- `clear` - Limpiar pantalla
- `ver` - Información de versión
- `reboot` - Reiniciar sistema
- `test` - Pruebas del sistema

### 📊 Información del Sistema
- `info` - Información detallada completa
- `mem` - Gestión y estado de memoria
- `time` - Fecha y hora del sistema
- `ps` - Lista de procesos activos
- `ls` - Sistema de archivos simulado

### 🛠️ Herramientas
- `calc <expresión>` - Calculadora matemática
  - Ejemplo: `calc 15+25`, `calc 100/4`
- `echo <texto>` - Repetir texto
  - Ejemplo: `echo Hola OriginOS`
- `banner` - Banner ASCII del sistema

## 📁 Estructura del Proyecto

```
origin-os/
├── 🚀 boot/                    # Sistema de arranque
│   ├── bootloader.asm          # Bootloader (512 bytes)
│   └── kernel_entry.asm        # Entrada del kernel
├── 🧠 kernel/                  # Núcleo del sistema
│   └── kernel.c               # Kernel principal + Shell v2.0
├── 🔧 drivers/                 # Controladores
│   ├── vga.c                  # Driver VGA con colores
│   └── keyboard.c             # Driver teclado optimizado
├── 📄 include/                 # Headers del sistema
│   ├── kernel.h               # Definiciones del kernel
│   ├── vga.h                  # Driver VGA
│   ├── keyboard.h             # Driver teclado
│   ├── io.h                   # Funciones E/S
│   ├── stdint.h               # Tipos estándar
│   └── stddef.h               # Definiciones estándar
├── ⚙️ tools/                   # Herramientas de build
│   └── linker.ld              # Script del linker
└── 📦 build/                   # Archivos compilados
    └── origin.img             # Imagen booteable
```

## 🛠️ Comandos de Desarrollo

```bash
# Compilación
make all          # Compilar todo el sistema
make clean        # Limpiar archivos compilados

# Ejecución y testing
make run          # Ejecutar en QEMU

# Utilidades
make help         # Ayuda del sistema de build
```

## 🎯 Características Técnicas

### 🚀 Bootloader Avanzado
- **Tamaño**: 512 bytes exactos
- **Detección automática** de tipo de drive (disquete/disco duro)
- **Carga robusta** del kernel (32 sectores, ~16KB)
- **Manejo de errores** completo

### 🧠 Kernel Moderno
- **Arquitectura**: x86 (32-bit protegido)
- **Gestión de memoria**: Básica implementada
- **Shell avanzado**: v2.0 con prompt colorido
- **Control de terminal**: Historial, validación, filtrado
- **Comandos**: 13+ funciones del sistema

### 🎨 Shell v2.0 - Características Avanzadas
- **Prompt colorido**: `OriginOS@localhost:~$`
- **Historial de comandos**: Últimos 10 comandos
- **Validación robusta**: Filtrado de entrada
- **Soporte de operadores**: Para calculadora (+, -, *, /)
- **Retroalimentación visual**: Colores y formato

### 🔧 Drivers Optimizados
- **VGA Driver**: Soporte completo de colores, scroll automático
- **Keyboard Driver**: Tabla de scan codes expandida, filtrado
- **I/O Functions**: Assembly inline optimizado

## 📊 Estadísticas del Proyecto

- **Total de código**: ~600+ líneas
- **Bootloader**: ~70 líneas de assembly
- **Kernel**: ~400+ líneas de C
- **Drivers**: ~150 líneas de C
- **Headers**: ~100 líneas
- **Comandos del shell**: 13+ funciones
- **Tiempo de desarrollo**: Proyecto completo

## 🎯 Logros Técnicos

### ✅ Sistema Completamente Funcional
- **Boot desde cero**: Bootloader personalizado
- **Modo protegido**: Transición exitosa 16→32 bit
- **Gestión de memoria**: Información y monitoreo
- **Interfaz de usuario**: Shell interactivo avanzado

### ✅ Funcionalidades Avanzadas
- **Calculadora matemática**: Operaciones básicas
- **Monitor del sistema**: CPU, memoria, procesos
- **Sistema de archivos**: Simulado con navegación
- **Gestión de procesos**: Lista y monitoreo
- **Información completa**: Sistema detallado

### ✅ Calidad de Código
- **Arquitectura modular**: Separación clara de responsabilidades
- **Código limpio**: Comentarios y documentación
- **Error handling**: Manejo robusto de errores
- **Cross-platform**: Compatible con QEMU/hardware real

## 🚀 Próximas Funcionalidades (Roadmap)

- [ ] **Interrupciones por hardware**
- [ ] **Scheduler básico de procesos**
- [ ] **Sistema de archivos simple**
- [ ] **Soporte de red básico**
- [ ] **GUI en modo texto avanzado**
- [ ] **Soporte para múltiples terminales**

## 🆘 Solución de Problemas

### Error de dependencias
```bash
# macOS
brew install nasm qemu i686-elf-gcc

# Verificar instalación
nasm --version
qemu-system-i386 --version
i686-elf-gcc --version
```

### QEMU no responde
- **Salir**: `Ctrl+A`, luego `X`
- **Reset**: `Ctrl+A`, luego `R`
- **Monitor**: `Ctrl+A`, luego `C`

### Error de compilación
```bash
make clean
make all
```

## 👨‍💻 Desarrollo

**OriginOS v2.0** es un proyecto educativo que demuestra:

- 📚 **Desarrollo de OS desde cero**
- 🔧 **Programación en assembly y C**
- 🏗️ **Arquitectura de sistemas**
- 🎯 **Cross-compilation**
- 🧪 **Testing en emuladores**

### Tecnologías Utilizadas
- **Assembly (NASM)**: Bootloader y kernel entry
- **C (i686-elf-gcc)**: Kernel y drivers
- **Linker Scripts**: Organización de memoria
- **QEMU**: Testing y desarrollo
- **Make**: Sistema de compilación

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver `LICENSE` para más detalles.

## 🙏 Agradecimientos

- **OSDev Community** por los recursos educativos
- **QEMU Project** por el excelente emulador
- **GNU Toolchain** por las herramientas de desarrollo

---

**¡OriginOS v2.0 - Desarrollado con ❤️ por Enrique Mendoza!**

*Un proyecto que demuestra que es posible crear un sistema operativo funcional desde cero.*