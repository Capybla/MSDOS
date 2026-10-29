if %CheatMode%==Enabled set CurrentGameHP=%MaxHealthCalculated%
set /a FinalGameHP=280+%CurrentGameHP%
set vi=280
::Remove Hp Bar
:loopHealth
if %vi% gtr %TrueMaxGameHP% (
set vi=280
goto MidHealth
)
set va%vi%= 
set /a vi+=1
goto loopHealth
::Draw Hp Bar
:MidHealth
if %vi% gtr %FinalGameHP% (
set /a vi=%FinalGameHP%
goto Mid2Health
)
set va%vi%=█
set /a vi+=1
goto MidHealth
::Remove Unwanted Pieces
:Mid2Health
if %vi% gtr %MaxGameHP% goto EndHealth
set va%vi%=—
set /a vi+=1
goto Mid2Health
:EndHealth