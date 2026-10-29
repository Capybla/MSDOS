@echo off
SET DOSDIR=\FREEDOS
SET PATH=%dosdir%\BIN;C:\;C:\FREEDOS\BIN;C:\GAMES\UNDERTAL
SET DIRCMD=/P /OGN /Y

if exist %dosdir%\NLS\NUL set NLSPATH=%dosdir%\NLS
if exist %dosdir%\HELP\NUL set HELPPATH=%dosdir%\HELP
if exist %dosdir%\BIN\DOSLFN.COM %dosdir%\BIN\DOSLFN.COM
if exist %dosdir%\BIN\LBACACHE.COM %dosdir%\BIN\LBACACHE.COM buf 20480

SET OS_NAME=FreeDOS
SET OS_VERSION=1.4
SET AUTOFILE=%0
SET CFGFILE=\FDCONFIG.SYS
alias reboot=fdapm warmboot
alias reset=fdisk /reboot
alias halt=fdapm poweroff
alias shutdown=fdapm poweroff
alias menu=call \MENU.BAT
alias intro=call \INTRO.BAT
alias sound=call \SOUND.BAT
alias reactos=call \REACTOS.BAT
alias sst=call \SST.BAT

SET BLASTER=A220 I7 D1 H5 P330 T6
SET CAPY_AUDIO=0
SET CAPY_AUDIO_WARN=0
SET ANIM_DONE=0

rem 1. Gestion de opciones seleccionadas en el menu de fdconfig.sys
if "%CONFIG%"=="2" goto SkipIntroAndSound
if "%CONFIG%"=="3" goto BootReactOS
if "%CONFIG%"=="4" goto DebugExit

cls
echo.
echo ============================================================
echo           CAPYDOS RETRO GAMES - INICIANDO SISTEMA...
echo ============================================================
echo.

rem Ejecutar intro con audio (Opcion 1)
if exist \AUTOINTRO.BAT call \AUTOINTRO.BAT
goto LaunchMenu

:SkipIntroAndSound
cls
echo [INFO] Iniciando en Modo Directo (Audio y animacion omitidos)...
goto LaunchMenu

:BootReactOS
cls
echo [INFO] Iniciando ReactOS 0.4.16 Live...
if exist \REACTOS.BAT call \REACTOS.BAT
goto LaunchMenu

:LaunchMenu
call \MENU.BAT
goto End

:DebugExit
echo Modo depuracion activo. Escribe MENU para iniciar juegos o REACTOS para ReactOS.

:End
