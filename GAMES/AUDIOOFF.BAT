@echo off
rem Desactivar audio e intro automatica
echo 1 > \NOAUDIO.FLG
if exist C:\ echo 1 > C:\NOAUDIO.FLG 2>nul
if exist D:\ echo 1 > D:\NOAUDIO.FLG 2>nul
if exist E:\ echo 1 > E:\NOAUDIO.FLG 2>nul
SET CAPY_AUDIO=0
SET CAPY_AUDIO_WARN=1
echo Audio e intro automatica desactivadas.
echo Para reactivar, ejecuta SOUND o borra NOAUDIO.FLG.
