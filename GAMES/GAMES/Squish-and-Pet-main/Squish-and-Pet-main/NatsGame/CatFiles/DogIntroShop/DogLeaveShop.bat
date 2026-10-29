cls
echo.
echo.
type CatFiles\DogIntroShop\DogRound.txt
echo.
echo.
echo -------------------------------------------------------------------------------------
echo.
echo.
echo.
echo                    ██  ██  █████  ▄█████ 
echo                    ██  ██  ██     ██     
echo                     ▀██▀   ████   ▀████▄ 
echo                      ██    ██         ██ 
echo                      ██    █████  █████▀ 
echo.
echo.
timeout 2 /NOBREAK >NUL
cls
echo.
echo.
type CatFiles\DogIntroShop\DogWink.txt
echo.
echo.
echo -------------------------------------------------------------------------------------
echo.
echo.
echo.
echo                    ██  ██  █████  ▄█████ 
echo                    ██  ██  ██     ██     
echo                     ▀██▀   ████   ▀████▄ 
echo                      ██    ██         ██ 
echo                      ██    █████  █████▀ 
echo.
CALL :TYPE "                                       GoodLuck!"
timeout 4 /NOBREAK >NUL
cls
timeout 2 /NOBREAK >NUL
goto EndHere


:TYPE
SET "d[text]=%~1"
CALL :TYPELOOP
GOTO :EOF

:TYPELOOP
IF "%d[text]:~0,1%" == "#" (
    <NUL SET /P "=^!"
) else (
    <NUL SET /P "=d!BS!%d[text]:~0,1%"
)
SET "d[text]=%d[text]:~1%"
IF "%d[text]%" == "" (
    GOTO :EOF
) else (
    FOR /L %%J in (1, 35, 1000000) DO REM
    GOTO :TYPELOOP
)
:Endhere