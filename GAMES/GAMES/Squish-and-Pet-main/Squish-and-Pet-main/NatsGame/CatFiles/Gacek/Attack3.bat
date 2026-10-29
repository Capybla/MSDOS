goto End

::Initial, Endpoint, Addition(I to E), Symbol Drawn, TimeOffset, TimeStart, DirectionMultip, EndTime, Starttime

:FuncLineHR-L 
	if not %~5==C (
    Call :DrawLine %~1 %~2 %~3 Χ 0 %~4 1 15 0
    Call :DrawLine %~1 %~2 %~3 Χ 1 %~4 1 15 1
    Call :DrawLine %~1 %~2 %~3 " " 2 %~4 1 16 1
    Call :DrawLine %~1 %~2 %~3 " " 3 %~4 1 16 1
	)Else (
	Call :DrawLine %~1 %~2 %~3 " " 2 %~4 1 16 1
    Call :DrawLine %~1 %~2 %~3 " " 3 %~4 1 16 1
	)
    EXIT /B 0

:FuncLineHL-R 
	if not %~5==C (
    Call :DrawLine %~1 %~2 %~3 X 0 %~4 -1 15 0
    Call :DrawLine %~1 %~2 %~3 X 1 %~4 -1 15 1
    Call :DrawLine %~1 %~2 %~3 " " 2 %~4 -1 16 1 
    Call :DrawLine %~1 %~2 %~3 " " 3 %~4 -1 16 1
	)Else (
	Call :DrawLine %~1 %~2 %~3 " " 2 %~4 -1 16 1
    Call :DrawLine %~1 %~2 %~3 " " 3 %~4 -1 16 1
	)
    EXIT /B 0
	
:FuncLineVT-B
	if not %~5==C (
    Call :DrawLine %~1 %~2 %~3 Ŷ 0 %~4 -31 9 0
    Call :DrawLine %~1 %~2 %~3 Ŷ 1 %~4 -31 9 0
    Call :DrawLine %~1 %~2 %~3 " " 2 %~4 -31 9 0
    Call :DrawLine %~1 %~2 %~3 " " 3 %~4 -31 9 0
	)Else (
	Call :DrawLine %~1 %~2 %~3 " " 2 %~4 -31 9 0
    Call :DrawLine %~1 %~2 %~3 " " 3 %~4 -31 9 0
	)
    EXIT /B 0

:FuncLineVB-T 
	if not %~5==C (
    Call :DrawLine %~1 %~2 %~3 Ý 0 %~4 31 9 0
    Call :DrawLine %~1 %~2 %~3 Ý 1 %~4 31 9 0
    Call :DrawLine %~1 %~2 %~3 " " 2 %~4 31 9 0
    Call :DrawLine %~1 %~2 %~3 " " 3 %~4 31 9 0
	)Else (
	Call :DrawLine %~1 %~2 %~3 " " 2 %~4 31 9 0
    Call :DrawLine %~1 %~2 %~3 " " 3 %~4 31 9 0
	)
    EXIT /B 0
	
:DrawLine
    set /a vi=((%~1-(2*%AttackTime%*%~7))+(%~5*%~7)+(%~6*2*%~7))
    set /a EndPoint=((%~2-(2*%AttackTime%*%~7))+(%~5*%~7)+(%~6*2*%~7))
	set /a StartTime=(%~6+%~9)
	if %AttackTime% LSS %StartTime% goto EndLine
	set /a EndTime=(%~6+%~8)
	if %AttackTime% GTR %EndTime% goto EndLine
    :LoopLine
    if %vi% GTR %EndPoint% goto EndLine
    if %vi% GTR 300 goto EndLine
	if "%~4"==" " if not !v%vi%!==!%~4! goto SkipSet
    set v%vi%=%~4
	:SkipSet
    set /a vi=%vi%+%~3
    goto LoopLine
	:EndLine
    EXIT /B 0

::--------------------------------------------------------

::1      8     16     24     31
::
::63                         93
::94                         124
::
::156                        186
::187                        217
::
::249   256    264    272     279

:End
::INIT VI, FINAL VI, AugmentingValue, Symbol, Time To Appear, C/S
 if %AttackTime% LSS 16 (

Call :FuncLineVT-B 8 24 1 0 S
Call :FuncLineVB-T 249 256 1 2 S
Call :FuncLineVB-T 272 279 1 2 S
Call :FuncLineVT-B 8 24 1 5 S
Call :FuncLineVB-T 249 256 1 7 S
Call :FuncLineVB-T 272 279 1 7 S
Call :FuncLineVT-B 8 24 1 10 S
Call :FuncLineVB-T 249 256 1 12 S
Call :FuncLineVB-T 272 279 1 12 S
)
if %AttackTime% GEQ 16 (

Call :FuncLineVT-B 8 24 1 0 C
Call :FuncLineVB-T 249 256 1 2 C
Call :FuncLineVB-T 272 279 1 2 C
Call :FuncLineVT-B 8 24 1 5 C
Call :FuncLineVB-T 249 256 1 7 C
Call :FuncLineVB-T 272 279 1 7 C
Call :FuncLineVT-B 8 24 1 10 C
Call :FuncLineVB-T 249 256 1 12 C
Call :FuncLineVB-T 272 279 1 12 C
set AttackPhase=False
set AttackTime=0
set /a "AttackVariantLong"="(1 + %random% %% %AttackNum%)"
)