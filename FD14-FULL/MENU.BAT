@echo off
rem ============================================================
rem CAPYDOS RETRO GAMES - MENU RUNNER
rem Escribe MENU o llama a este archivo para volver al menu.
rem ============================================================

if exist RUNME.BAT del RUNME.BAT >nul

if exist \CAPYMENU.BAT call \CAPYMENU.BAT
goto Exit

:Exit
echo.
echo ============================================================
echo Saliendo al simbolo de sistema de FreeDOS.
echo Para volver al menu de juegos, escribe: MENU
echo Para recargar el audio:               SOUND
echo Para ver la intro:                    INTRO
echo ============================================================
echo.
