@echo off
rem ========================================================
rem  ButterDOS - Runner de Undertale para FreeDOS
rem ========================================================

echo ========================================================
echo   ButterDOS: Undertale Runner para FreeDOS
echo ========================================================
echo.

rem Asegurar unidad y directorio correcto
if exist C:\GAMES\UNDERTAL\data.win C:
if exist C:\GAMES\UNDERTAL\data.win cd \GAMES\UNDERTAL
if exist D:\GAMES\UNDERTAL\data.win D:
if exist D:\GAMES\UNDERTAL\data.win cd \GAMES\UNDERTAL

set DATA_FILE=data.win
if not exist %DATA_FILE% if exist C:\GAMES\UNDERTAL\data.win set DATA_FILE=C:\GAMES\UNDERTAL\data.win
if not exist %DATA_FILE% if exist D:\GAMES\UNDERTAL\data.win set DATA_FILE=D:\GAMES\UNDERTAL\data.win
if not exist %DATA_FILE% if exist \GAMES\UNDERTAL\data.win set DATA_FILE=\GAMES\UNDERTAL\data.win

if not exist %DATA_FILE% goto NoData

echo [INFO] data.win localizado en: %DATA_FILE%
echo.

rem 2. Configuracion del extensor DPMI
if exist CWSDPMI.SWP del CWSDPMI.SWP >nul
if exist C:\CWSDPMI.SWP del C:\CWSDPMI.SWP >nul

if exist HDPMI32I.EXE goto UseHDPMI
if exist C:\GAMES\UNDERTAL\HDPMI32I.EXE goto UseHDPMIC
goto UseSystemDPMI

:UseHDPMI
echo [INFO] Cargando extensor DPMI HDPMI32i...
HDPMI32I.EXE -r
goto LaunchGame

:UseHDPMIC
echo [INFO] Cargando extensor DPMI HDPMI32i...
C:\GAMES\UNDERTAL\HDPMI32I.EXE -r
goto LaunchGame

:UseSystemDPMI
if exist CWSDPMI.EXE CWSDPMI.EXE -p

:LaunchGame
echo.
echo [INFO] Iniciando Undertale con: %DATA_FILE% ...
BSCOTCH.EXE --lazy-rooms --lazy-textures --disable-log-colors %DATA_FILE% %1 %2 %3
goto End

:NoData
echo [ERROR] No se encuentra data.win.
echo Buscado en: data.win, C:\GAMES\UNDERTAL\data.win, D:\GAMES\UNDERTAL\data.win
pause

:End
