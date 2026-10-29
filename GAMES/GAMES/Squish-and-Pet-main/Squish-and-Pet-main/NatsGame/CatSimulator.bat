@echo off
/LARGEADDRESSAWARE
mode con: cols=85 lines=30
Title Nats Game
setlocal enabledelayedexpansion
FOR /F %%A in ('"PROMPT $H&FOR %%B in (1) DO REM"') DO SET "BS=%%A"
chcp 65001
cls
type CatFiles\Loading\0.txt
set vi=1
:loop
if %vi% gtr 279 goto end
set v%vi%= 
set /a vi+=1
if %vi%==35 (cls
type CatFiles\Loading\1.txt
)
if %vi%==70 (cls
type CatFiles\Loading\2.txt
)
if %vi%==105 (cls
type CatFiles\Loading\3.txt
)
if %vi%==140 (cls
type CatFiles\Loading\4.txt
)
if %vi%==175 (cls
type CatFiles\Loading\5.txt
)
if %vi%==210 (cls
type CatFiles\Loading\6.txt
)
if %vi%==245 (cls
type CatFiles\Loading\7.txt
)
goto loop


:end
::----------------------------------------------------------------------------------------------------------------------------------------------
::                                Modify Variables
set Color=F
set Introskip=False
set CheatMode=Disabled
set CheatI=   
set box1= Pet  
set box2=Items 
set box3=Items 
::CurrentGameHP should be 13 by Default
set CurrentGameHP=13
set MaxGameHP=292
set TrueMaxGameHP=292
::----------------------------------------------------------------------------------------------------------------------------------------------
set /p Color=<SaveFiles\Settings\Color.txt
color %Color%
set /p IntroSkip=<SaveFiles\Settings\Logo.txt
if %Introskip%==False goto LogoIntro
goto MainMenu

(echo %IntroSkip%)>SaveFiles\Settings\Logo.txt



:Exit
exit



:MainMenu
cls
echo.
type CatFiles\NightCat.txt
echo.
echo -------------------------------------------------------------------------------------
echo  %CheatI%                                 Squish ^& Pet
echo -------------------------------------------------------------------------------------
echo                                                                                 v1.1
CALL :TYPE " 1) Play" 
echo.
CALL :TYPE " 2) Settings" 
echo.
CALL :TYPE " 0) Exit" 
echo.
CHOICE /C 120 /M "Enter your choice:"
IF ERRORLEVEL 3 GOTO Exit
IF ERRORLEVEL 2 GOTO Setting
IF ERRORLEVEL 1 GOTO Play
pause
exit

::----------------------------------------------------------------------------------------------------------------------------------------------
::                                       Settings
:Setting
cls
echo -------------------------------------------------------------------------------------
echo  %CheatI%                                     Settings
echo -------------------------------------------------------------------------------------
echo.
echo  1) Color
echo  2) Intro Skip
echo  3) Enable Cheats
echo  4) Screen Size Tips
echo.
echo  0) Back
echo.
echo.
echo.
CHOICE /C 12340 /M "Enter your choice:"
IF ERRORLEVEL 5 GOTO MainMenu
IF ERRORLEVEL 4 GOTO ScreenSizeTips
IF ERRORLEVEL 3 GOTO CheatPanel
IF ERRORLEVEL 2 GOTO SettingLogo
IF ERRORLEVEL 1 GOTO SettingColor


:SettingColor1
(echo %Color%)>SaveFiles\Settings\Color.txt
goto SettingColor

:SettingColor
cls 
color %Color%
echo -------------------------------------------------------------------------------------
echo  %CheatI%                                     Color
echo -------------------------------------------------------------------------------------
echo.
echo  1) Blue
echo  2) Green 	
echo  3) Aqua
echo  4) Red 	
echo  5) Purple 	
echo  6) Yellow 	
echo  7) White (default)
echo.
echo  0) Back
echo.
echo.
echo.
CHOICE /C 12345670 /M "Enter your choice:"
IF ERRORLEVEL 8 GOTO Setting
IF ERRORLEVEL 7 (
set Color=F
goto SettingColor1
)
IF ERRORLEVEL 6 (
set Color=E
goto SettingColor1
)
IF ERRORLEVEL 5 (
set Color=D
 goto SettingColor1
)
IF ERRORLEVEL 4 (
set Color=C
goto SettingColor1
)
IF ERRORLEVEL 3 (
set Color=B
goto SettingColor1
)
IF ERRORLEVEL 2 (
set Color=A
goto SettingColor1
)
IF ERRORLEVEL 1 (
set Color=9
goto SettingColor1
)

pause

:SettingLogo
cls 
color %Color%
echo -------------------------------------------------------------------------------------
echo  %CheatI%                                   Intro Skip
echo -------------------------------------------------------------------------------------
echo.
CALL :TYPE " Skip the Logo at the Start, and the Starting Cutscene for Quick Entry"
echo.
:SettingLogo2
echo.
echo  Skip is set to %IntroSkip%
echo.
echo  1) True
echo  2) False
echo.
echo  0) Back
echo.
echo.
echo.
CHOICE /C 120 /M "Enter your choice:"
IF ERRORLEVEL 3 GOTO Setting
IF ERRORLEVEL 2 (
set IntroSkip=False
goto SettingLogo1
)
IF ERRORLEVEL 1 (
set IntroSkip=True
goto SettingLogo1
)
:SettingLogo1
(echo %IntroSkip%)>SaveFiles\Settings\Logo.txt
cls 
color %Color%
echo -------------------------------------------------------------------------------------
echo  %CheatI%                                   Intro Skip
echo -------------------------------------------------------------------------------------
echo.
echo Skip the Logo at the Start, and the Starting Cutscene for Quick Entry
goto SettingLogo2


:CheatPanel
cls
echo -------------------------------------------------------------------------------------
echo  %CheatI%                                    Cheats
echo -------------------------------------------------------------------------------------
echo.
CALL :TYPE " Cheats are for explicitly not dying in Story Mode, that is all."
echo.
CALL :TYPE " No Gameplay is skipped, although a small indicator is shown at the end."
echo.
CALL :TYPE " Cheat Mode is Automatically set to Disabled when Restarting the Game"
echo.
:CheatPanel2
echo.
echo Cheat Mode is %CheatMode%
echo.
echo  1) Enable Cheats
echo  2) Disable Cheats
echo.
echo  0) Back
echo.
echo.
echo.
CHOICE /C 120 /M "Enter your choice:"
IF ERRORLEVEL 3 GOTO Setting
IF ERRORLEVEL 2 (
set CheatMode=Disabled
set CheatI=   
goto CheatPanel1
)
IF ERRORLEVEL 1 (
set CheatMode=Enabled
set CheatI=ʘ
goto CheatPanel1
)

:CheatPanel1
cls
echo -------------------------------------------------------------------------------------
echo  %CheatI%                                    Cheats
echo -------------------------------------------------------------------------------------
echo.
echo  Cheats are for explicitly not dying in Story Mode, that is all.
echo  No Gameplay is skipped, although a small indicator is shown at the end.
echo  Cheat Mode is Automatically set to Disabled when Restarting the Game
goto CheatPanel2

:ScreenSizeTips
cls
echo -------------------------------------------------------------------------------------
echo  %CheatI%                                  Screen Help
echo -------------------------------------------------------------------------------------
echo.
CALL :TYPE " The Screen Size can vary from computer to computer"
echo.
CALL :TYPE " To change the Game's Size, simply hold CTRL and Scroll using the Wheel"
echo.
CALL :TYPE " To Make the Game Bigger or Smaller. Sorry about that"
echo.
echo.
echo  0) Back
echo.
echo.
echo.
CHOICE /C 0 /M "Enter your choice:"
IF ERRORLEVEL 1 GOTO Setting
::----------------------------------------------------------------------------------------------------------------------------------------------
::                                                  Logo Stuff
:LogoIntro
set AnimationTime=1
set LogoLoop=0
set LogoSentence=                                    NatsGames'
:LogoIntrocat
cls
set /a LogoLoop=%LogoLoop%+1
echo.
echo.
type Catfiles\Logo\Logo1.txt
echo.
echo.
if NOT %LogoLoop%==1 echo %LogoSentence%
timeout %AnimationTime% /NOBREAK >NUL
if %LogoLoop%==3 goto MainMenu

cls
echo.
echo.
type Catfiles\Logo\Logo2.txt
echo.
echo.
if %LogoLoop%==1 (CALL :TYPE "%LogoSentence%"
goto LogoIntrocat)
if NOT %LogoLoop%==1 echo %LogoSentence%
timeout %AnimationTime% /NOBREAK >NUL
goto LogoIntroCat


::----------------------------------------------------------------------------------------------------------------------------------------------
::                                                 Loading Display Text Stuff
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
    FOR /L %%J in (1, 50, 1000000) DO REM
    GOTO :TYPELOOP
)

::----------------------------------------------------------------------------------------------------------------------------------------------


:Play
cls
color %Color%
echo -------------------------------------------------------------------------------------
echo  %CheatI%                                    Play
echo -------------------------------------------------------------------------------------
echo.
echo  1) Regular mode
echo.
::echo  2) Question Mode
echo.
::echo  3) ScoreBoard - RM
::echo  4) ScoreBoard - QM
echo. 
echo  0) Back
echo.
echo.
echo.
CHOICE /C 10 /M "Enter your choice:"
IF ERRORLEVEL 2 GOTO MainMenu
IF ERRORLEVEL 1 (set WhichCat=1
GOTO StoryModeAttack)

:ShopEnviroment
if %Introskip%==False (call CatFiles\DogIntroShop\IntroText.bat
	call CatFiles\DogIntroShop\DogIntroText.bat
)
goto ShopMain
:ShopMain

set VisitedShop=True
cls
echo.
echo.
type CatFiles\DogIntroShop\Dog.txt
echo.
echo.
echo -------------------------------------------------------------------------------------
echo                                       Score: %FinalScore%
echo.
echo                    ▄▄▄▄▄▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄▄▄
echo                    █ 1 Boons  █      █ 2 Curses █      █ 3 Leave  █
echo                    ▀▀▀▀▀▀▀▀▀▀▀▀      ▀▀▀▀▀▀▀▀▀▀▀▀      ▀▀▀▀▀▀▀▀▀▀▀▀
echo.
echo                                  'Anything You Like?'
echo.
if %HasBoons%==True (echo                                     ---- Boons ----
if %BandAidNum% GTR 0 (echo                                       BandAids: %BandAidNum%)
if %SausageNum% GTR 0 (echo                                       Sausages: %SausageNum%)
)

CHOICE /C 123 /N
IF ERRORLEVEL 3 goto ShopLeave
IF ERRORLEVEL 2 goto ShopCurses
IF ERRORLEVEL 1 goto ShopBoons

:ShopBoons
cls
echo.
echo.
type CatFiles\DogIntroShop\Dog.txt
echo.
echo.
echo -------------------------------------------------------------------------------------
echo                                       Score: %FinalScore%
echo.
echo 1) Band-Aid -20S (%BandAidNum%)
echo.
echo 2) Old Sausage -60S (%SausageNum%)
echo.
echo.
echo 0) Back
echo.
echo.
echo.
CHOICE /C 120 /M "Enter your choice:"
IF ERRORLEVEL 3 goto ShopMain
IF ERRORLEVEL 2 goto ShopBuySausage
IF ERRORLEVEL 1 goto ShopBuyBandAid
goto ShopBoons

:ShopBuyBandAid
if %FinalScore% LSS 20 (goto ShopBoons
)Else (set /a FinalScore=%FinalScore%-20
set /a BandAidNum=%BandAidNum%+1
set HasBoons=True
goto ShopBoons
)

:ShopBuySausage
if %FinalScore% LSS 60 (goto ShopBoons
)Else (set /a FinalScore=%FinalScore%-60
set /a SausageNum=%SausageNum%+1
set HasBoons=True
goto ShopBoons
)


:ShopCurses
::Dont mind this Yandere Dev, 
::Batch cant do Exponant Functions for some reason...
if %MaxGameHP%==292 set ScoreMaxGameHpCurse=4
if %MaxGameHP%==291 set ScoreMaxGameHpCurse=6
if %MaxGameHP%==290 set ScoreMaxGameHpCurse=9
if %MaxGameHP%==289 set ScoreMaxGameHpCurse=10
if %MaxGameHP%==288 set ScoreMaxGameHpCurse=13
if %MaxGameHP%==287 set ScoreMaxGameHpCurse=22
if %MaxGameHP%==286 set ScoreMaxGameHpCurse=28
if %MaxGameHP%==285 set ScoreMaxGameHpCurse=39
if %MaxGameHP%==284 (set ScoreMaxGameHpCurse=55
set AttackVariantLong=666
)
if %MaxGameHP%==283 (set ScoreMaxGameHpCurse=80
set AttackVariantLong=666
)
if %MaxGameHP%==282 (set ScoreMaxGameHpCurse=120
set AttackVariantLong=666
)
if %MaxGameHP%==281 (set ScoreMaxGameHpCurse=180
set AttackVariantLong=666
)
if %MaxGameHP%==280 (set ScoreMaxGameHpCurse=XXX
set AttackVariantLong=666
)
set /a MaxHealthCalculated=%MaxGameHP%-279
cls
echo.
echo.
type CatFiles\DogIntroShop\Dog.txt
echo.
echo.
echo -------------------------------------------------------------------------------------
echo                                       Score: %FinalScore%
echo                                       Health: %CurrentGameHP%
echo                                     Max Health: %MaxHealthCalculated%
echo.
echo 1) -1 HP +5S
echo.
echo 2) -1 MAX HP +%ScoreMaxGameHpCurse%S (Price Is Exponential)
echo.
echo.
echo 0) Back
echo.
echo.
echo.
CHOICE /C 120 /M "Enter your choice:"
IF ERRORLEVEL 3 goto ShopMain
IF ERRORLEVEL 2 goto ShopSellMaxHealth
IF ERRORLEVEL 1 goto ShopSellHealth
goto ShopBoons

:ShopSellHealth
if %CurrentGameHP% LSS 2 (goto ShopCurses
)Else (set /a FinalScore=%FinalScore%+5
set /a CurrentGameHP=%CurrentGameHP%-1
goto ShopCurses
)

:ShopSellMaxHealth
if %MaxGameHP% LSS 281 (goto ShopCurses
)Else (if %CurrentGameHP% LSS 2 (goto ShopCurses
)Else (set /a MaxGameHP=%MaxGameHP%-1
set /a FinalScore=%FinalScore%+%ScoreMaxGameHpCurse%
set /a CurrentGameHP=%CurrentGameHP%-1
goto ShopCurses
)
)



:ShopLeave
cls
echo.
echo.
type CatFiles\DogIntroShop\Dog.txt
echo.
echo.
echo -------------------------------------------------------------------------------------
echo                             'Are you sure you want to leave?'
echo                                 'There is no going back.'
echo.
echo                    ██  ██  █████  ▄█████         ███▄   ██  ▄████▄
echo                    ██  ██  ██     ██             ██▀█▄  ██  ██  ██
echo                     ▀██▀   ████   ▀████▄         ██ ▀█▄ ██  ██  ██
echo                      ██    ██         ██         ██  ▀█▄██  ██  ██
echo                      ██    █████  █████▀         ██   ▀███  ▀████▀
echo.
echo                              1                           0

CHOICE /C 10 /N
IF ERRORLEVEL 2 goto ShopMain
IF ERRORLEVEL 1 (if %IntroSkip%==True (goto GameActualStart
)Else (Call CatFiles\DogIntroShop\DogLeaveShop.bat
cls
Call CatFiles\DogIntroShop\DogLeaveShop2.bat
goto GameActualStart)
)
goto MainMenu


::----------------------------------------------------------------------------------------------------------------------------------------------
::                                         Actually Playing the Game





::------------------------------------------------Game Variables-------------------------------------------------------------------
::------------------------------------------------Game Variables-------------------------------------------------------------------
::------------------------------------------------Game Variables-------------------------------------------------------------------
::------------------------------------------------Game Variables-------------------------------------------------------------------
::------------------------------------------------Game Variables-------------------------------------------------------------------
::------------------------------------------------Game Variables-------------------------------------------------------------------
:StoryModeAttack
set BasicHeartPos=
set InitialHeartPos=140
set Cat1Intro=True
set FinalScore=100
set HasBoons=False
set BandAidNum=0
set SausageNum=0
set VisitedShop=False
set PetItemDrawn=False
set AttackVariantLong=
::SelectStartingAttack (DEFAULT=0)
if NOT !%AttackVariantLong%!==666 set AttackVariantLong=0
set AttackTime=0
set AttackPhase=False
set AttackNum=4
::IMPORTANT
set CatHP=10
::----------------------------------------------------------------------------------------------------------------------Cat Set
cls
goto Movement
::-----------------------------------------------------------------------------------------------Player Controls Start
:HeartMovement

CHOICE /T 1 /C qweasdzxc0 /N /D x

::C
IF ERRORLEVEL 10 (set AttackTime=0
goto HeartCalculations
)
IF ERRORLEVEL 9 (set /a BasicHeartPos=%InitialHeartPos%+33
goto HeartCalculations
)
::X
IF ERRORLEVEL 8 GOTO Movement
::Z
IF ERRORLEVEL 7 (set /a BasicHeartPos=%InitialHeartPos%+29
goto HeartCalculations
)
::D
IF ERRORLEVEL 6 (set /a BasicHeartPos=%InitialHeartPos%+2
goto HeartCalculations
)
::S
IF ERRORLEVEL 5 (set /a BasicHeartPos=%InitialHeartPos%+31
goto HeartCalculations
)
::A
IF ERRORLEVEL 4 (set /a BasicHeartPos=%InitialHeartPos%-2
goto HeartCalculations
)
::E
IF ERRORLEVEL 3 (set /a BasicHeartPos=%InitialHeartPos%-29
goto HeartCalculations
)
::W
IF ERRORLEVEL 2 (set /a BasicHeartPos=%InitialHeartPos%-31
goto HeartCalculations
)
::Q
IF ERRORLEVEL 1 (set /a BasicHeartPos=%InitialHeartPos%-33
goto HeartCalculations
)


::------------------------------------------------------------------------------------Movement
:HeartCalculations
set v%InitialHeartPos%= 
set /a HeartX=%BasicHeartPos% %% 31
set /a HeartY=((%BasicHeartPos%-%HeartX%)/31)
set HXmax=31
set HXmin=1
If %HeartX% GTR %HXmax% set /a BasicHeartPos=%HeartX%-(%HeartX%-%HXmax%)+%HeartY%*31
If %HeartX% LSS %HXmin% set /a BasicHeartPos=%HeartX%-(%HeartX%-%HXmin%)+%HeartY%*31
set HYmax=8
set HYmin=0
If %HeartY% GTR %HYmax% set /a BasicHeartPos=(%HeartY%-(%HeartY%-%HYmax%))*31+%HeartX%
If %HeartY% LSS %HYmin% set /a BasicHeartPos=(%HeartY%-(%HeartY%-%HYmin%))*31+%HeartX%
set /a InitialHeartPos=%BasicHeartPos%
:Movement





::------------------------------------------------------------------------------------ScoreCalculations
:ScoreCalculations
set /a ScoreHeartPos=%InitialHeartPos%-31
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange1
set /a ScoreHeartPos=%InitialHeartPos%+31
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange1
set /a ScoreHeartPos=%InitialHeartPos%+2
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange1
set /a ScoreHeartPos=%InitialHeartPos%-2
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange1
set /a ScoreHeartPos=%InitialHeartPos%+1
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange1
set /a ScoreHeartPos=%InitialHeartPos%-1
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange1
goto ScoreCalculations2
:ScoreRange1
set /a FinalScore=%FinalScore%+3
goto AfterScoreCalc
:ScoreCalculations2
set /a ScoreHeartPos=%InitialHeartPos%-62
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange2
set /a ScoreHeartPos=%InitialHeartPos%+62
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange2
set /a ScoreHeartPos=%InitialHeartPos%+4
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange2
set /a ScoreHeartPos=%InitialHeartPos%-4
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange2
set /a ScoreHeartPos=%InitialHeartPos%+3
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange2
set /a ScoreHeartPos=%InitialHeartPos%-3
if not "!v%ScoreHeartPos%!"==" "  goto ScoreRange2
goto AfterScoreCalc
:ScoreRange2
set /a FinalScore=%FinalScore%+1
goto AfterScoreCalc
:AfterScoreCalc



::-------------------------------------------------------------------------------------------Place Smth here for other Modes,
::                                                                                           Or Cat Order for Future Cats
if %WhichCat%==1 (if %VisitedShop%==True (goto ThiccCatCharacter
	)Else goto ShopEnviroment
)
if %WhichCat%==2 goto QuestionMode 

::----------------------------------------------------------------------------------------------------------------------CAT ONE


:GameActualStart

:ThiccCatCharacter

:PetItemScreen
if %AttackPhase%==False (Call MidAttackScreen.bat
	goto ThiccCatCharacter
	)

:AttackScreen
if %AttackPhase%==True (set PetItemDrawn=False
	cls
	
	if %CatHP% LEQ 0 goto :GameOver
	if %AttackVariantLong% GTR %AttackNum% if not %AttackVariantLong%==666 set /a "AttackVariantLong"="(1 + %random% %% %AttackNum%)"
	if %AttackVariantLong%==0 (Call Catfiles\Gacek\Attack0.bat)
	if %AttackVariantLong%==1 (Call Catfiles\Gacek\Attack1.bat)
	if %AttackVariantLong%==2 (Call Catfiles\Gacek\Attack2.bat)
	if %AttackVariantLong%==3 (Call Catfiles\Gacek\Attack3.bat)
	if %AttackVariantLong%==4 (Call Catfiles\Gacek\Attack4.bat)
	
	
	
	if %AttackVariantLong%==666 (Call Catfiles\Gacek\AttackAlpha.bat)
	if %CurrentGameHP%==0 (timeout 1 /NOBREAK >NUL
		goto GameOver)
		
		
	::HealthDetect
	if "!v%InitialHeartPos%!"==" "  goto afterInitialHeartPosHitboxCheck
	if !v%InitialHeartPos%!==♥ goto afterInitialHeartPosHitboxCheck
	set /a CurrentGameHP=%CurrentGameHp%-1
	set /a FinalScore=%FinalScore%-10
	Call HealthCalc.bat
	:afterInitialHeartPosHitboxCheck
	set OldSymbol=!v%InitialHeartPos%!
	set v%InitialHeartPos%=♥
	
	
	if %AttackPhase%==False goto ThiccCatCharacter
	Call AttackScreen.bat
	set /a AttackTime=%AttackTime%+1
	)












set AttackValueTime=%AttackValueTime%+1
goto HeartMovement
::---------------------------------------------------------------------------------------------------Player Control End

:GameOver
if %AttackVariantLong%==666 set FinalScore=0
cls
timeout 1 /NOBREAK >NUL
cls
Call Gameover.bat
cls
timeout 1 /NOBREAK >NUL

exit
