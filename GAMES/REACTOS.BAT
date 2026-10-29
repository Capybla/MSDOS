@echo off
rem ============================================================
rem LANZADOR DE REACTOS 0.4.16 LIVE (ROSLOAD / GRUB4DOS)
rem ============================================================
cls
echo ============================================================
echo           INICIANDO REACTOS 0.4.16 LIVE
echo ============================================================
echo.

rem 1. Probar cargador DOS nativo de FreeLoader (rosload.exe)
if exist \rosload.exe \rosload.exe
if exist C:\rosload.exe C:\rosload.exe
if exist D:\rosload.exe D:\rosload.exe

rem 2. Fallback a GRUB4DOS
echo Cargando cargador de arranque GRUB4DOS...
if exist \grub.exe \grub.exe --config-file=\menu.lst
if exist C:\grub.exe C:\grub.exe --config-file=C:\menu.lst
if exist D:\grub.exe D:\grub.exe --config-file=D:\menu.lst
echo [ERROR] No se pudo encontrar ningun cargador de ReactOS.
pause
