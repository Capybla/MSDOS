@echo off
rem ===========================================================================
rem   Launcher de Undertale para ReactOS Live
rem ===========================================================================
title Undertale - ReactOS Live Launcher
echo ===========================================================================
echo                 UNDERTALE EN REACTOS LIVE
echo ===========================================================================
echo.

rem Detectar unidad donde esta la carpeta GAMES\UNDERTAL
set UT_DIR=
if exist "%~dp0..\..\GAMES\UNDERTAL\data.win" set UT_DIR=%~dp0..\..\GAMES\UNDERTAL
if exist "D:\GAMES\UNDERTAL\data.win" set UT_DIR=D:\GAMES\UNDERTAL
if exist "E:\GAMES\UNDERTAL\data.win" set UT_DIR=E:\GAMES\UNDERTAL
if exist "F:\GAMES\UNDERTAL\data.win" set UT_DIR=F:\GAMES\UNDERTAL

if "%UT_DIR%"=="" (
    echo [AVISO] No se encontro la carpeta GAMES\UNDERTAL automaticamente.
    echo Buscando en el directorio actual...
    if exist data.win (
        set UT_DIR=%CD%
    ) else (
        echo [ERROR] No se encuentra data.win.
        echo Asegurate de que la particion de juegos esta montada.
        pause
        exit /b 1
    )
)

echo [OK] Directorio de juego localizado en: %UT_DIR%
cd /d "%UT_DIR%"

rem Comprobar si existe el ejecutable nativo de Windows (UNDERTALE.EXE)
if exist "UNDERTALE.EXE" (
    echo [INFO] Iniciando UNDERTALE.EXE original (Win32)...
    start "" "UNDERTALE.EXE"
    goto fin
)

rem Si solo esta el runner Butterscotch / bscotch.exe
if exist "BSCOTCH_WIN.EXE" (
    echo [INFO] Iniciando Butterscotch Win32...
    start "" "BSCOTCH_WIN.EXE" data.win
    goto fin
)

echo [INFO] Para jugar con la maxima compatibilidad en ReactOS:
echo Copia el archivo 'UNDERTALE.EXE' de la version oficial de PC (v1.08)
echo en la carpeta %UT_DIR%.
echo.
pause

:fin
