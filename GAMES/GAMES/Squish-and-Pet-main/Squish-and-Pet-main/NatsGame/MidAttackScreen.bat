:start
Call HealthCalc.bat
cls
echo.
type CatFiles\ChunkyCat.txt
echo.
echo.
::echo v%InitialHeartPos%, X=%HeartX%, Y=%HeartY%, "%OldSymbol%", Score:%FinalScore%, AVL: %AttackVariantLong%, CATHP: %CatHP%, TIME:%AttackTime%
echo ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                           ▄▄▄▄▄▄▄▄▄▄▄         ▄▄▄▄▄▄▄▄▄▄▄                         █
echo █                           █ 1)Pet   █         █ 2)Item  █                         █
echo █                           ▀▀▀▀▀▀▀▀▀▀▀         ▀▀▀▀▀▀▀▀▀▀▀                         █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                 HP:%va280%%va281%%va282%%va283%%va284%%va285%%va286%%va287%%va288%%va289%%va290%%va291%%va292%                                  █
echo █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█
CHOICE /C 12 /N
IF ERRORLEVEL 2 GOTO ItemScreen
IF ERRORLEVEL 1 GOTO PetMessage




:ItemScreen
cls
echo.
type CatFiles\ChunkyCat.txt
echo.
echo.
echo ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                   ---- Boons ----                                 █
if %BandAidNum% GTR 0 (echo █                                    1] BandAids: %BandAidNum%                                 █)
if %SausageNum% GTR 0 (echo █                                    2] Sausages: %SausageNum%                                 █)
if %BandAidNum% LEQ 0 (echo █                                                                                   █)
if %SausageNum% LEQ 0 (echo █                                                                                   █)
echo █                                                                                   █
echo █                                                                                   █
echo █                                       0] Back                                     █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                 HP:%va280%%va281%%va282%%va283%%va284%%va285%%va286%%va287%%va288%%va289%%va290%%va291%%va292%                                  █
echo █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█

CHOICE /C 120 /N
IF ERRORLEVEL 3 goto end
IF ERRORLEVEL 2 goto SausageUse
IF ERRORLEVEL 1 goto BandAidUse

:BandAidUse
if %BandAidNum% LEQ 0 goto ItemScreen
set /a BandAidNum=%BandAidNum%-1
set /a CurrentGameHP=%CurrentGameHP%+5
If %CurrentGameHP% GTR %MaxHealthCalculated% set /a CurrentGameHP=%CurrentGameHP%-(%CurrentGameHP%-%MaxHealthCalculated%)
set AttackPhase=True
goto ItemUsed

:SausageUse
if %SausageNum% LEQ 0 goto ItemScreen
set /a CatHP=%CatHP%-5
set /a SausageNum=%SausageNum%-1
set AttackPhase=True
set PetItemDrawn=True
goto InteractionNotif


:PetMessage
set AttackPhase=True
set /a CatHP=%CatHP%-1
goto InteractionNotif










:InteractionNotif
setlocal disabledelayedexpansion

set Message2=                                                                █

if %CatHP% LEQ 0 goto HasPet
if %PetItemDrawn%==True goto ItemUsed
if %CatHP% GTR 0 goto NotPet

:ItemUsed
	set Variants=1
	set /a RandValue=(1 + %random% %% %Variants%)
	if %RandValue%==1 set Message=               You Used an Item^^!                                █
	::---------------------------------------------------M
	goto Message
	
:NotPet
	set Variants=8
	set /a "RandValue"="(1 + %random% %% %Variants%)"
	if %RandValue%==1 set Message=            Gacek avoids your pet^^!                              █
	if %RandValue%==2 set Message=              Gacek dislikes you                                █
	if %RandValue%==3 set Message=           Gacek Stares at your hand                            █
	if %RandValue%==4 set Message=                  Gacek Meows^^!                                  █
	if %RandValue%==5 set Message=               Gacek Purrs Gently                               █
	if %RandValue%==6 set Message=        Gacek has an urge to scratch You                        █
	if %RandValue%==7 set Message=             Gacek lies on his back                             █
	if %RandValue%==8 (set Message=             Gacek Hops in his box                              █
	set /a CatHP=%CatHP%+1
	)
	if %AttackVariantLong%==666 set Message=           Gacek has a Demonic smile                            █
	::---------------------------------------------------M
	goto Message
:HasPet
	set Variants=4
	set /a "RandValue"="(1 + %random% %% %Variants%)"
	if %RandValue%==1 (set Message=                 You Pet Gacek^^!                                 █
					  set Message2=              He Meows in content.                              █
	)
	if %RandValue%==2 (set Message=                 You Pet Gacek^^!                                 █
					  set Message2=         His Furr is as soft as clouds.                         █
	)
	if %RandValue%==3 (set Message=                 You Pet Gacek^^!                                 █
					  set Message2=     He also nibbles on your hand slightly                      █
	)
	if %RandValue%==4 (set Message=               You Squish Gacek^^!                                █
					  set Message2=                 Squiiiiishhhh                                  █
	)
	::---------------------------------------------------M
	goto Message

:Message
cls
echo.
type CatFiles\ChunkyCat.txt
echo.
echo.
echo ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                   %Message%
echo █                   %Message2%
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                                                                   █
echo █                                 HP:%va280%%va281%%va282%%va283%%va284%%va285%%va286%%va287%%va288%%va289%%va290%%va291%%va292%                                  █
echo █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█
setlocal enabledelayedexpansion
set AttackPhase=True
pause

:end