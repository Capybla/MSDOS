@echo off
rem ============================================================
rem CAPYDOS INTRO - Fuerza carga de audio e intro (BIOS / UEFI)
rem ============================================================
call SOUND.BAT
set ANIM_DRV=
if exist \ANIM\PLAYANIM.COM set ANIM_DRV=
if exist C:\ANIM\PLAYANIM.COM set ANIM_DRV=C:
if exist D:\ANIM\PLAYANIM.COM set ANIM_DRV=D:
if exist E:\ANIM\PLAYANIM.COM set ANIM_DRV=E:
if exist F:\ANIM\PLAYANIM.COM set ANIM_DRV=F:

if "%ANIM_DRV%"=="" if exist \ANIM\PLAYANIM.COM goto RunAnim
if "%ANIM_DRV%"=="" goto NoAnim

%ANIM_DRV%
:RunAnim
cd \ANIM
PLAYANIM.COM
SET ANIM_DONE=1
cd \
goto End

:NoAnim
echo.
echo [ERROR] No se encontro PLAYANIM.COM en ninguna unidad.
echo.

:End
