@echo off
rem ============================================================
rem CAPYDOS SOUND SYSTEM - SBEMU / VSBHDA (Intel HDA / SST)
rem ============================================================
SET BLASTER=A220 I7 D1 H5 P330 T6
SET CAPY_AUDIO=0

rem Si ya se detecto anteriormente que no hay tarjeta compatible, omitir
if exist \NOAUDIO.FLG goto NoSBEMU
if exist C:\NOAUDIO.FLG goto NoSBEMU

SET SBEMU_DRV=
if exist \SBEMU\SBEMU.EXE SET SBEMU_DRV=
if exist C:\SBEMU\SBEMU.EXE SET SBEMU_DRV=C:
if "%SBEMU_DRV%"=="" if exist D:\SBEMU\SBEMU.EXE SET SBEMU_DRV=D:
if "%SBEMU_DRV%"=="" if exist E:\SBEMU\SBEMU.EXE SET SBEMU_DRV=E:

if not "%SBEMU_DRV%"=="" %SBEMU_DRV%
if not exist \SBEMU\SBEMU.EXE goto NoSBEMU

cd \SBEMU

rem 1. Cargar QPIEMU con JLOAD si aun no esta cargado
if not exist JLOAD.EXE goto TryDirect
if not exist QPIEMU.DLL goto TryDirect

JLOAD.EXE -q QPIEMU.DLL >nul 2>nul

:TryDirect
rem 2. Cargar HDPMI32i si aun no esta residente
if exist HDPMI32i.EXE HDPMI32i.EXE -r -x >nul 2>nul

rem 3. Intentar SBEMU
echo [AUDIO] Comprobando soporte de hardware con SBEMU...
SBEMU.EXE /A220 /I7 /D1 /H5 /T6 /VOL100 >nul 2>nul
if not errorlevel 1 goto AudioSuccess

rem 4. Intentar VSBHDA
if not exist \VSBHDA\VSBHDA.EXE goto DetectionFailed
echo [AUDIO] Comprobando controlador VSBHDA (Intel HDA)...
cd \VSBHDA
VSBHDA.EXE >nul 2>nul
if not errorlevel 1 goto AudioSuccess

:DetectionFailed
rem Hardware moderno con Intel Smart Sound Technology (SST/SoundWire)
cd \
SET CAPY_AUDIO=0
SET CAPY_AUDIO_WARN=1
echo.
echo [AVISO AUDIO] El audio integrado de este portatil utiliza Intel Smart Sound (DSP).
echo [AVISO AUDIO] Los altavoces internos requieren firmware propietario de Windows/Linux.
echo [AVISO AUDIO] Opciones para tener musica:
echo               1. Conectar una tarjeta/adaptador de audio USB.
echo               2. Iniciar ReactOS desde el menu principal.
echo.
goto End

:AudioSuccess
cd \
SET CAPY_AUDIO=1
SET CAPY_AUDIO_WARN=0
echo OK > \AUDIO.OK
if "%1"=="AUTO" goto End
echo [AUDIO] Sistema de sonido Sound Blaster activo correctamente.
goto End

:NoSBEMU
cd \
SET CAPY_AUDIO=0
SET CAPY_AUDIO_WARN=1
if exist \AUDIO.OK del \AUDIO.OK >nul
if "%1"=="AUTO" goto End
echo [AVISO] Audio en modo silencioso (Intel SST activo).
:End
