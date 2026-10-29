@echo off
rem ============================================================
rem CAPYDOS AUTO INTRO (BIOS & UEFI Compatible)
rem ============================================================
SET CAPY_AUDIO=0
SET CAPY_AUDIO_WARN=0
SET ANIM_DONE=0

if exist \NOAUDIO.FLG goto SkipIntro
if exist C:\NOAUDIO.FLG goto SkipIntro

rem 1. Intentar activar audio de forma no bloqueante
if "%CAPY_AUDIO%"=="1" goto AudioReady
if exist \SOUND.BAT call \SOUND.BAT AUTO
if "%CAPY_AUDIO%"=="1" goto AudioReady
if exist C:\SOUND.BAT call C:\SOUND.BAT AUTO

:AudioReady
rem 2. Reproducir animacion (modo seguro sin sondeo bloqueante)
if not exist \ANIM\PLAYANIM.COM goto SkipIntro
cd \ANIM
PLAYANIM.COM
SET ANIM_DONE=1
cd \
goto End

:SkipIntro
SET CAPY_AUDIO_WARN=1
:End
