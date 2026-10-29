echo.
echo.
echo.
echo.
CALL :TYPE " After leaving the Dog at the front of the Animal Shelter,"
echo.
if %HasBoons%==True (CALL :TYPE " You gather your things,"
timeout 1 /NOBREAK >NUL
CALL :TYPE " and head inside."
)Else (CALL :TYPE " You head inside,"
timeout 1 /NOBREAK >NUL
CALL :TYPE " questioning your decision of not buying anything.")
echo.
echo.
timeout 2 /NOBREAK >NUL
echo.
CALL :TYPE " You look up, in the old building, with a scent of old wood oil and dust."
echo.
CALL :TYPE " A few dim lights cast a sombre shadow on the tables, chairs,"
echo.
CALL :TYPE " furniture, on the shelves filled with miscelanious objects."
echo.
echo.
timeout 2 /NOBREAK >NUL
echo.
CALL :TYPE " At the center of the room..."
echo.
echo.
timeout 3 /NOBREAK >NUL
CALL :TYPE " A small figure gazes at you."
echo.
timeout 1 /NOBREAK >NUL
CALL :TYPE " Its eyes, a fiery white, pierce your face with an eery chill."
echo.
timeout 3 /NOBREAK >NUL
echo.
echo.
CALL :TYPE " Gacek Awaits your move"
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
