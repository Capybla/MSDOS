@echo off
rem ============================================================
rem CAPYDOS RETRO GAMES - MENU RUNNER
rem ============================================================

if exist RUNME.BAT del RUNME.BAT >nul

if exist CAPYMENU.BAT goto LocalMenu
if exist \CAPYMENU.BAT goto RootMenu
if exist C:\CAPYMENU.BAT goto CMenu
if exist D:\CAPYMENU.BAT goto DMenu
if exist E:\CAPYMENU.BAT goto EMenu
if exist F:\CAPYMENU.BAT goto FMenu

echo No se encontro CAPYMENU.BAT.
goto Exit

:LocalMenu
call CAPYMENU.BAT
goto Exit

:RootMenu
call \CAPYMENU.BAT
goto Exit

:CMenu
call C:\CAPYMENU.BAT
goto Exit

:DMenu
call D:\CAPYMENU.BAT
goto Exit

:EMenu
call E:\CAPYMENU.BAT
goto Exit

:FMenu
call F:\CAPYMENU.BAT
goto Exit

:Exit
echo.
echo ============================================================
echo Saliendo al simbolo de sistema de FreeDOS.
echo Para volver al menu de juegos, escribe MENU y pulsa Enter.
echo Para probar intro con audio sincronizado, escribe INTRO.
echo ============================================================
echo.
