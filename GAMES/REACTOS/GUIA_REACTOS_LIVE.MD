# Guía de Instalación y Arranque de ReactOS Live (Undertale x86)

Este documento explica cómo configurar y arrancar **ReactOS Live** en un PC x86 físico (Intel Core i5) con arranque UEFI, y cómo ejecutar Undertale aprovechando la compatibilidad Win32 nativa sin dependencias de emuladores DOS.

---

## 1. ¿Por qué ReactOS Live?

| Característica | FreeDOS + ButterDOS | ReactOS Live |
| :--- | :--- | :--- |
| **Arquitectura** | 16-bit real con extensor DPMI 32-bit | 32-bit protegido nativo (Windows NT clone) |
| **Límite de memoria** | Restringido por DPMI / VDPMI (64MB-1024MB) | Acceso directo a toda la RAM física (sin swap) |
| **Gráficos** | VESA BIOS 640x480x8 (256 colores dithereados) | GDI / VESA LFB 32-bit True Color (16.7 millones de colores) |
| **Rendimiento de pantalla** | 5 trampas INT 10h/frame en CSMWrap (o LFB) | Acceso directo a framebuffer sin trampas de interrupción |
| **Subsistema de Audio** | Sound Blaster 16 emulado por SBEMU (requiere VDPMI) | DirectSound / WinMM nativo (Intel HDA / AC97) |
| **Música** | Resampleada a 8000 Hz mono (por DMA DOS) | Estéreo original 44.1 kHz con calidad de estudio |
| **Compatibilidad** | Requiere reimplementación inversa de GameMaker | Binarios Win32 PE nativos (`UNDERTALE.EXE`) |

---

## 2. Preparación del USB para arranque UEFI

Tu equipo arranca de forma nativa en **UEFI (Intel Core i5)**. Hay dos formas recomendadas de arrancar ReactOS Live:

### Método A: Multiboot con Ventoy (El más rápido y recomendado)

Ventoy permite arrancar imágenes ISO directamente sin necesidad de extraer archivos ni modificar particiones del sistema.

1. **Descarga Ventoy** si aún no lo tienes: [ventoy.net](https://www.ventoy.net).
2. Si tu pendrive ya usa Ventoy, simplemente mantén la imagen ISO en:
   `F:\REACTOS\ISO\ReactOS-0.4.14-live.iso`
3. Reinicia el ordenador y pulsa la tecla del menú de arranque UEFI (habitualmente **F12**, **F11**, **F8** o **Esc**).
4. Selecciona tu unidad USB en el menú de arranque UEFI.
5. En el menú de Ventoy, selecciona `ReactOS-0.4.14-live.iso`.
6. Selecciona el modo **"LiveCD" (Run from RAM)**.
7. En unos 15 segundos aparecerá el escritorio de ReactOS con barra de tareas y ratón funcional.

---

### Método B: Integración en el cargador EFI existente (Dual Boot con FreeDOS)

Tu pendrive actual contiene `E:\EFI\BOOT` con CSMWrap para arrancar FreeDOS.
Para añadir ReactOS Live a la misma memoria sin Ventoy:

1. **FreeLoader EFI**:
   ReactOS utiliza el cargador de arranque FreeLoader (`BOOTX64.EFI`), que puede convivir en la partición EFI con un menú de selección (como **rEFInd** o **GRUB2 for EFI**).
2. Al arrancar rEFInd / GRUB2, puedes configurar dos entradas:
   - **Opción 1: FreeDOS Live** (arranca `CSMWRAP64.EFI` -> FreeDOS).
   - **Opción 2: ReactOS Live** (arranca `FREELDR.EFI` -> ReactOS LiveCD).

---

## 3. Cómo ejecutar Undertale dentro de ReactOS Live

Una vez en el escritorio de ReactOS:

1. Haz doble clic en el icono **Mi PC** (*My Computer*).
2. Abre la unidad de disco correspondiente a tu partición de juegos (habitualmente `D:` o `E:`).
3. Entra en `REACTOS\UNDERTALE\` o directamente en `GAMES\UNDERTAL\`.
4. Ejecuta:
   - **Opción 1 (Máxima fidelidad)**: Copia el archivo original `UNDERTALE.EXE` (v1.08) en `GAMES\UNDERTAL\` y haz doble clic sobre él. Funcionará con los archivos originales `data.win` y los `.ogg` con música estéreo completa.
   - **Opción 2 (Launcher automático)**: Ejecuta `INICIAR_UNDERTALE.BAT`.

---

## 4. Estado de los archivos en la unidad

- `F:\REACTOS\ISO\`: Contiene la imagen ISO de ReactOS Live.
- `F:\REACTOS\UNDERTALE\`: Contiene el launcher preparado para ReactOS.
- `F:\GAMES\UNDERTAL\`: Mantiene `BSCOTCH.EXE` optimizado para FreeDOS, además de `data.win` y la música resampleada a 8000 Hz.
