@echo off
rem ============================================================
rem CAPYDOS RETRO GAMES LAUNCHER (BIOS & UEFI Compatible)
rem ============================================================

rem 1. Detectar particion con carpeta GAMES (priorizar D: particion dedicada)
set G_DRV=D:
if exist D:\GAMES\UNDERTAL\BSCOTCH.EXE goto GAMES_OK
if exist C:\GAMES\UNDERTAL\BSCOTCH.EXE goto GAMES_C
if exist \GAMES\UNDERTAL\BSCOTCH.EXE goto GAMES_ROOT

echo [ERROR] No se encontro la carpeta GAMES.
pause
goto EXIT

:GAMES_C
set G_DRV=C:
goto GAMES_OK

:GAMES_ROOT
set G_DRV=
goto GAMES_OK

:GAMES_OK

:MENU_MAIN
cls
echo.
echo ============================================================
echo               CAPYDOS RETRO GAMES - MENU PRINCIPAL
echo ============================================================
echo.
echo  Selecciona una categoria alfabetica:
echo.
echo   [A] [B] [C] [D] [E] [F] [G] [H] [I] [J] [K] [L] [M]
echo   [N] [O] [P] [Q] [R] [S] [T] [U] [V] [W] [X] [Y] [Z]
echo   [#] Numeros y simbolos
echo.
echo   [0] Buscar juego por nombre
echo   [U] Undertale (Acceso rapido)
echo   [9] Iniciar ReactOS 0.4.16 Live
echo   [P] Proyecto SST: Sonda de Hardware Intel (DEV_51CA)
echo   [?] Ayuda y atajos para salir de juegos
echo   [S] Probar configuracion de Sonido
echo   [!] Reiniciar equipo al menu
echo   [X] Salir al simbolo de sistema
if "%CAPY_AUDIO%"=="1" echo   ESTADO AUDIO: Sound Blaster 16 activo (%BLASTER%)
if not "%CAPY_AUDIO%"=="1" echo   AVISO: Audio no detectado. Pulsa [S] para activar SBEMU.
echo ============================================================
set CAT=
set /p CAT=Opcion: 
if "%CAT%"=="" goto MENU_MAIN
if /i "%CAT%"=="0" goto SEARCH_GAME
if /i "%CAT%"=="u" goto QUICK_UNDERTALE
if "%CAT%"=="9" goto DO_REACTOS
if /i "%CAT%"=="p" goto DO_SST
if "%CAT%"=="?" goto HELP_KEYS
if /i "%CAT%"=="s" goto DO_SOUND
if "%CAT%"=="!" goto DO_REBOOT
if /i "%CAT%"=="x" goto EXIT
if /i "%CAT%"=="#" set CAT=NUM
goto CAT_LETTER

:DO_REACTOS
cls
if exist \REACTOS.BAT call \REACTOS.BAT
goto MENU_MAIN

:QUICK_UNDERTALE
set S_DIR=UNDERTAL
goto RUN_GAME

:DO_SOUND
cls
call SOUND.BAT
echo Pulsa una tecla para volver al menu...
pause >nul
goto MENU_MAIN

:DO_SST
cls
if exist \SST.BAT call \SST.BAT
if not exist \SST.BAT if exist C:\SST.BAT call C:\SST.BAT
if not exist \SST.BAT if exist D:\SST.BAT call D:\SST.BAT
goto MENU_MAIN

:HELP_KEYS
cls
echo.
echo ============================================================
echo           GUIA DE CONTROLES Y ATAJOS DE JUEGOS DOS
echo ============================================================
echo.
echo  1. COMO SALIR DE UN JUEGO HACIA EL MENU:
echo     * Tecla [ESC]: abre menu de pausa / opciones
echo     * [ALT] + [X]: atajo estandar en muchisimos juegos
echo     * [CTRL] + [Q]: comun en aventuras graficas
echo     * Tecla [F10] o [Q]: muy comun en juegos arcade
echo.
echo  2. SI UN JUEGO SE CONGELA O NO RESPONDE:
echo     * Pulsa [CTRL] + [ALT] + [SUPR]
echo       FreeDOS reinicia de inmediato en 3 segundos
echo.
echo  3. CONTROLES GENERALES:
echo     * Movimiento: Flechas del cursor o teclado numerico
echo     * Acciones: Espacio, Ctrl, Alt, Enter
echo ============================================================
echo Pulsa una tecla para volver al menu...
pause >nul
goto MENU_MAIN

:DO_REBOOT
cls
echo Reiniciando equipo al menu de juegos...
fdapm warmboot
goto EXIT

:CAT_LETTER
set LETTER=
if /i "%CAT%"=="A" set LETTER=A
if /i "%CAT%"=="B" set LETTER=B
if /i "%CAT%"=="C" set LETTER=C
if /i "%CAT%"=="D" set LETTER=D
if /i "%CAT%"=="E" set LETTER=E
if /i "%CAT%"=="F" set LETTER=F
if /i "%CAT%"=="G" set LETTER=G
if /i "%CAT%"=="H" set LETTER=H
if /i "%CAT%"=="I" set LETTER=I
if /i "%CAT%"=="J" set LETTER=J
if /i "%CAT%"=="K" set LETTER=K
if /i "%CAT%"=="L" set LETTER=L
if /i "%CAT%"=="M" set LETTER=M
if /i "%CAT%"=="N" set LETTER=N
if /i "%CAT%"=="O" set LETTER=O
if /i "%CAT%"=="P" set LETTER=P
if /i "%CAT%"=="Q" set LETTER=Q
if /i "%CAT%"=="R" set LETTER=R
if /i "%CAT%"=="S" set LETTER=S
if /i "%CAT%"=="T" set LETTER=T
if /i "%CAT%"=="U" set LETTER=U
if /i "%CAT%"=="V" set LETTER=V
if /i "%CAT%"=="W" set LETTER=W
if /i "%CAT%"=="X" set LETTER=X
if /i "%CAT%"=="Y" set LETTER=Y
if /i "%CAT%"=="Z" set LETTER=Z
if "%CAT%"=="NUM" set LETTER=0

if "%LETTER%"=="" goto MENU_MAIN

:SHOW_CATEGORY
cls
echo.
echo ============================================================
echo  JUEGOS DISPONIBLES: Letra [%LETTER%]
echo ============================================================
echo.
%G_DRV%
cd \GAMES
if "%LETTER%"=="0" goto LIST_NUM
dir /b /ad %LETTER%* 2>nul
goto LIST_DONE
:LIST_NUM
dir /b /ad 0* 1* 2* 3* 4* 5* 6* 7* 8* 9* 2>nul
:LIST_DONE
echo.
echo ============================================================
set S_DIR=
set /p S_DIR=Nombre de la carpeta del juego (o Enter para volver): 
if "%S_DIR%"=="" goto MENU_MAIN
if not exist %G_DRV%\GAMES\%S_DIR%\*.* if not exist \GAMES\%S_DIR%\*.* goto NOT_FOUND_CAT
goto RUN_GAME

:NOT_FOUND_CAT
echo.
echo [ERROR] No se encontro la carpeta "%S_DIR%".
echo Pulsa una tecla para continuar...
pause >nul
goto SHOW_CATEGORY
goto RUN_GAME

:SEARCH_GAME
cls
echo.
echo ============================================================
echo                      BUSCAR JUEGO
echo ============================================================
echo.
set S_TERM=
set /p S_TERM=Texto a buscar (o Enter para menu): 
if "%S_TERM%"=="" goto MENU_MAIN
cls
echo.
echo Resultados para "%S_TERM%":
echo ------------------------------------------------------------
%G_DRV%
cd \GAMES
dir /b /ad *%S_TERM%* 2>nul
echo ------------------------------------------------------------
echo.
set S_DIR=
set /p S_DIR=Nombre de la carpeta a entrar (o Enter para menu): 
if "%S_DIR%"=="" goto MENU_MAIN
if not exist %G_DRV%\GAMES\%S_DIR%\*.* if not exist \GAMES\%S_DIR%\*.* goto NOT_FOUND_SEARCH
goto RUN_GAME

:NOT_FOUND_SEARCH
echo.
echo [ERROR] No se encontro "%S_DIR%".
echo Pulsa una tecla para continuar...
pause >nul
goto SEARCH_GAME
goto RUN_GAME

:RUN_GAME
cls
echo.
echo ============================================================
echo  INICIANDO JUEGO: %S_DIR%
echo ============================================================
echo.
if exist D:\GAMES\%S_DIR%\*.* D:
if exist D:\GAMES\%S_DIR%\*.* cd \GAMES\%S_DIR%
if not exist D:\GAMES\%S_DIR%\*.* if exist C:\GAMES\%S_DIR%\*.* C:
if not exist D:\GAMES\%S_DIR%\*.* if exist C:\GAMES\%S_DIR%\*.* cd \GAMES\%S_DIR%

rem Auto-deteccion del ejecutable preferido
set G_RUN=
if exist RUN.BAT set G_RUN=RUN.BAT
if "%G_RUN%"=="" if exist %S_DIR%.EXE set G_RUN=%S_DIR%.EXE
if "%G_RUN%"=="" if exist DOOM.EXE set G_RUN=DOOM.EXE
if "%G_RUN%"=="" if exist DUKE3D.EXE set G_RUN=DUKE3D.EXE
if "%G_RUN%"=="" if exist QUAKE.EXE set G_RUN=QUAKE.EXE
if "%G_RUN%"=="" if exist WOLF3D.EXE set G_RUN=WOLF3D.EXE
if "%G_RUN%"=="" if exist SC2.EXE set G_RUN=SC2.EXE
if "%G_RUN%"=="" if exist MAIN.EXE set G_RUN=MAIN.EXE
if "%G_RUN%"=="" if exist START.BAT set G_RUN=START.BAT
if "%G_RUN%"=="" if exist PLAY.BAT set G_RUN=PLAY.BAT
if "%G_RUN%"=="" if exist GO.BAT set G_RUN=GO.BAT

echo Archivos ejecutables en %S_DIR%:
echo ------------------------------------------------------------
dir /b /w *.exe *.com *.bat 2>nul
echo ------------------------------------------------------------
echo.
if not "%G_RUN%"=="" echo Ejecutable sugerido: [%G_RUN%]
echo.
set G_CMD=
set /p G_CMD=Comando a ejecutar (o pulsa Enter para %G_RUN%): 
if "%G_CMD%"=="" set G_CMD=%G_RUN%
if "%G_CMD%"=="" goto NO_EXE

echo.
echo [INFO] Ejecutando: %G_CMD% ...
echo ------------------------------------------------------------
call %G_CMD%
echo.
echo ============================================================
echo  Juego finalizado. Pulsa una tecla para volver al menu...
echo ============================================================
pause >nul
goto MENU_MAIN

:NO_EXE
echo.
echo [ERROR] No se especifico ningun ejecutable para iniciar.
echo Pulsa una tecla para volver...
pause >nul
goto MENU_MAIN

:EXIT
cls
echo.
echo ============================================================
echo Has salido de CAPYDOS Retro Games.
echo Para volver al menu en cualquier momento, escribe MENU.
echo ============================================================
echo.
