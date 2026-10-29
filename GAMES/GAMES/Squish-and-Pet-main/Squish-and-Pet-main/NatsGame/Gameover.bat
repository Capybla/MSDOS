set GameoverSpacing=                 
set GameoverSpacing1=                   
::Character Spacing   
set CS=   
::Character Initial Spacing
set CIS=              
set CharacterNumber=1

set C1=_
set C2=_
set C3=_
set C4=_
set C5=_

:Decider
if %CatHP% GTR 0 goto GameOverScreen
if %CatHP% LEQ 0 goto WinScreen

:GameOverScreen
cls
echo. 
echo.
echo.
echo.
echo %GameoverSpacing% ▄█████████  ▄███████▄  ██████████████▄  ▄████████
echo %GameoverSpacing% ████▀▀▀▀▀▀  ███▀▀▀███  ████  ███  ████  ████
echo %GameoverSpacing% ████  ▄▄▄▄  ███▄▄▄███  ████  ███  ████  ██████
echo %GameoverSpacing% ████  ▀███  ███▀▀▀███  ████  ███  ████  ████  
echo %GameoverSpacing% ██████████  ███   ███  ████  ███  ████  ████▄▄▄▄▄
echo %GameoverSpacing%  ▀▀▀▀▀▀▀▀▀  ▀▀▀   ▀▀▀  ▀▀▀▀  ▀▀▀  ▀▀▀▀   ▀▀▀▀▀▀▀▀
echo.
echo %GameoverSpacing1% ▄████████▄  ████  ███  ▄████████  █████████▄
echo %GameoverSpacing1% ████  ████  ████  ███  ████       ████  ████
echo %GameoverSpacing1% ████  ████  ████  ███  ██████     ████▄▄███▀
echo %GameoverSpacing1% ████  ████  ████  ███  ████       ████▀▀███▄
echo %GameoverSpacing1% ████▄▄████  ████▄▄███  ████▄▄▄▄▄  ████  ████
echo %GameoverSpacing1%  ▀▀▀▀▀▀▀▀   ▀▀▀▀▀▀▀▀    ▀▀▀▀▀▀▀▀  ▀▀▀▀  ▀▀▀▀
echo.
goto NameStuff

:WinScreen
cls
echo. 
echo.
echo.
echo.
echo.
echo %GameoverSpacing%              ▄█████████  ▄█████████
echo %GameoverSpacing%              ████▀▀▀▀▀▀  ████▀▀▀▀▀▀
echo %GameoverSpacing%              ████  ▄▄▄▄  ████  ▄▄▄▄
echo %GameoverSpacing%              ████  ▀███  ████  ▀███
echo %GameoverSpacing%              ██████████  ██████████
echo %GameoverSpacing%               ▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀▀▀▀▀
echo.
echo.
echo.
echo.
goto NameStuff
:NameStuff
echo                                         Name ?
echo                                  _%C1%_ _%C2%_ _%C3%_ _%C4%_ _%C5%_
echo     Score: %FinalScore%
echo.
echo %Cis% A %CS% B %CS% C %CS% D %CS% E %CS% F %CS% G %CS% H %CS% I %CS% J
echo.
echo %Cis% K %CS% L %CS% M %CS% N %CS% O %CS% P %CS% Q %CS% R %CS% S %CS% T
echo.
echo %Cis% U %CS% V %CS% W %CS% X %CS% Y %CS% Z %CS% DONE(1) %CS%  DEL(0)

CHOICE /C abcdefghijklmnopqrstuvwxyz01 /N

IF %ERRORLEVEL%==28 goto GameOverEnd
IF %ERRORLEVEL%==27 goto RemoveCharacter
IF %ERRORLEVEL%==26 set C%CharacterNumber%=Z
IF %ERRORLEVEL%==25 set C%CharacterNumber%=Y
IF %ERRORLEVEL%==24 set C%CharacterNumber%=X
IF %ERRORLEVEL%==23 set C%CharacterNumber%=W
IF %ERRORLEVEL%==22 set C%CharacterNumber%=V
IF %ERRORLEVEL%==21 set C%CharacterNumber%=U
IF %ERRORLEVEL%==20 set C%CharacterNumber%=T
IF %ERRORLEVEL%==19 set C%CharacterNumber%=S
IF %ERRORLEVEL%==18 set C%CharacterNumber%=R
IF %ERRORLEVEL%==17 set C%CharacterNumber%=Q
IF %ERRORLEVEL%==16 set C%CharacterNumber%=P
IF %ERRORLEVEL%==15 set C%CharacterNumber%=O
IF %ERRORLEVEL%==14 set C%CharacterNumber%=N
IF %ERRORLEVEL%==13 set C%CharacterNumber%=M
IF %ERRORLEVEL%==12 set C%CharacterNumber%=L
IF %ERRORLEVEL%==11 set C%CharacterNumber%=K
IF %ERRORLEVEL%==10 set C%CharacterNumber%=J
IF %ERRORLEVEL%==9 set C%CharacterNumber%=I
IF %ERRORLEVEL%==8 set C%CharacterNumber%=H
IF %ERRORLEVEL%==7 set C%CharacterNumber%=G
IF %ERRORLEVEL%==6 set C%CharacterNumber%=F
IF %ERRORLEVEL%==5 set C%CharacterNumber%=E
IF %ERRORLEVEL%==4 set C%CharacterNumber%=D
IF %ERRORLEVEL%==3 set C%CharacterNumber%=C
IF %ERRORLEVEL%==2 set C%CharacterNumber%=B
IF %ERRORLEVEL%==1 set C%CharacterNumber%=A

:GameOverCalc
set /a CharacterNumber=%CharacterNumber%+1
if %CharacterNumber%==7 set CharacterNumber=6

goto Decider


:RemoveCharacter

set /a CharacterNumber=%CharacterNumber%-1
if %CharacterNumber%==0 set CharacterNumber=1
set C%CharacterNumber%=_

goto Decider



:GameOverEnd
::Finds the amount of Saves in the High Score Directory
for /f %%i in ('dir SaveFiles\HighScore\*.txt /s /b 2^> nul ^| find "" /v /c') do set VAR=%%i
set /a %VAR%+1
(echo %C1%%C2%%C3%%C4%%C5% - %FinalScore%)>SaveFiles\HighScore\%VAR%.txt