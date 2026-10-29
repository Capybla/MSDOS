cls
		echo.
		echo.
		type CatFiles\DogIntroShop\Dog.txt
		echo.
		echo.
		echo -------------------------------------------------------------------------------------
		echo.
		echo.
		CALL :TYPE " 'Welcome to the Shelter'"
		echo.
		timeout 1 /NOBREAK >NUL
		echo.
		CALL :TYPE " 'Wondering if you need anything before you go inside'"
		echo.
		timeout 2 /NOBREAK >NUL
		echo.
		CALL :TYPE " 'Last time someone went in there with nothing they flew out the window!'"
		echo.
		CALL :TYPE " 'That cat is crazy if you're not ready.'"
		echo.
		echo.
		CALL :TYPE " 'Once you're in, you're either coming out victorious, or full of scratches.'"
		echo.
		CALL :TYPE " 'No In Betweens, so get ready.'"
		echo.
		echo.
		echo.
		timeout 3 /NOBREAK >NUL
		CALL :TYPE " 'Anyways, want anything?'"
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