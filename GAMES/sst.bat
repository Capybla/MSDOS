@echo off
rem ============================================================
rem  SST.BAT - Lanzador de Diagnostico Intel Smart Sound (DOS)
rem ============================================================
cls
echo ============================================================
echo   PROYECTO SST_DOS - Driver Intel Smart Sound para FreeDOS
echo   Fase 1: Sonda de Hardware y Registros PCI (DEV_51CA)
echo ============================================================
echo.

if exist SSTPROBE.EXE SSTPROBE.EXE
if not exist SSTPROBE.EXE if exist \SST\SSTPROBE.EXE \SST\SSTPROBE.EXE
if not exist SSTPROBE.EXE if exist C:\SST\SSTPROBE.EXE C:\SST\SSTPROBE.EXE
if not exist SSTPROBE.EXE if exist D:\SST\SSTPROBE.EXE D:\SST\SSTPROBE.EXE
if not exist SSTPROBE.EXE if exist C:\SSTPROBE.EXE C:\SSTPROBE.EXE
if not exist SSTPROBE.EXE if exist D:\SSTPROBE.EXE D:\SSTPROBE.EXE

echo.
echo Presiona una tecla para continuar...
pause >nul
