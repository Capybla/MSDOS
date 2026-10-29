echo.
echo.
echo.
echo.
CALL :TYPE " After a long trip to Poland,"
CALL :TYPE " You're finaly here."
echo.
CALL :TYPE " And it would soon be worth it."
echo.
echo.
CALL :TYPE " Just to glimpse at Gacek would be enough to satisfy you for the rest of your life."
echo.
timeout 2 /NOBREAK >NUL
echo.
CALL :TYPE " But..."
echo.
timeout 1 /NOBREAK >NUL
echo.
CALL :TYPE " You didnt just come here for that."
echo.
timeout 1 /NOBREAK >NUL
echo.
CALL :TYPE " You knew that already..."
echo.
timeout 2 /NOBREAK >NUL
echo.
echo.
CALL :TYPE " Imagine"
timeout 1 /NOBREAK >NUL
CALL :TYPE " being able to pet Him....."
echo.
timeout 2 /NOBREAK >NUL
echo.
CALL :TYPE " Walking on the pavement, you approach the shelter."
echo.
timeout 1 /NOBREAK >NUL
echo.
echo.
CALL :TYPE " 'Ah, another challenger.' says a voice nearby"
echo.
echo.
echo (...)







PAUSE>NUL
EXIT /B

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
