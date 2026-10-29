======================================================================
  ButterDOS: Undertale Runner para FreeDOS
======================================================================

1. REQUISITOS DE HARDWARE
-------------------------
- Procesador: x86 compatible (Pentium o superior; probado en Intel Core i5).
- Memoria RAM: Minimo 128 MB (recomendado 256 MB+ para musica completa).
- Graficos: Tarjeta VGA/SVGA con BIOS compatible VBE 2.0+ (modo 640x480x8).
- Audio: Compatible Sound Blaster 16 (puerto 220h, IRQ 5/7, DMA 1).
- Sistema: FreeDOS 1.2 o superior, arrancado directamente (USB/HDD).

2. ARCHIVOS DEL JUEGO
---------------------
Coloca en esta misma carpeta:
- data.win (proveniente de Undertale v1.08, GameMaker: Studio 1.4.1804).
- Opcionalmente los archivos de musica .ogg de Undertale.
  * NOTA DE RENDIMIENTO EN AUDIO:
    Si la CPU no mantiene 30 FPS decodificando OGG Vorbis en tiempo real,
    usa el script tools\resample_music.py en Windows para convertir los
    .ogg a WAV de 8000 Hz mono in-place. La Sound Blaster los reproducira
    por DMA directo con 0% de uso de CPU.

3. COMO EJECUTAR
----------------
1. Arranca tu PC con tu memoria USB en FreeDOS.
2. Navega al directorio donde copiaste estos archivos:
     cd BUTTER
3. Ejecuta:
     RUN.BAT
   O manualmente:
     HDPMI32I.EXE -r
     BSCOTCH.EXE --lazy-rooms --lazy-textures data.win

4. CONTROLES DEL JUEGO
----------------------
- Flechas o WASD : Movimiento de Frisk / Navegacion de menus
- Z / Enter      : Confirmar / Interactuar
- X / Shift      : Cancelar / Correr / Saltar texto
- C / Control    : Menu de inventario
- ESC            : Salir del juego (si la ventana se cierra)
- F12            : Mostrar / Ocultar contador de FPS en pantalla

5. HERRAMIENTAS DE DIAGNOSTICO
------------------------------
- VESATEST.EXE : Prueba de compatibilidad de modos de video VESA VBE.
                 Ejecuta 'VESATEST.EXE' para ver si tu BIOS soporta 640x480x8.
- BOXTEST.EXE  : Prueba rapida de VESA 640x480 y teclado INT 9 con una caja
                 en movimiento (sin requerir data.win).
======================================================================
