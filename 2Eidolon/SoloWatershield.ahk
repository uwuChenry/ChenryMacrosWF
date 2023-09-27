ShrineToClLow:
	;SendInput {Ins}
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	;DllCall("mouse_event", uint, 1, int, -760, int, 175, uint, 0, int, 0) ; turn right old
	;DllCall("mouse_event", uint, 1, int, -622, int, 84, uint, 0, int, 0) ; turn right new loc pin
	DllCall("mouse_event", uint, 1, int, -32, int, 7, uint, 0, int, 0) ; turn right new new loc pin
	lSaveCounterAfterSleep(50, LastPerformanceCounter) ;20
	SendInput {Space down}
	lSaveCounterAfterSleep(60, LastPerformanceCounter)
	SendInput {Space up}  
	lSaveCounterAfterSleep(10, LastPerformanceCounter)
	SendInput {t} 
	DllCall("mouse_event", uint, 1, int, 1865, int, 0, uint, 0, int, 0) ; Aim at limb
	lSaveCounterAfterSleep(30, LastPerformanceCounter) ;30
	SendInput {e} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {5} 
	lSaveCounterAfterSleep(130, LastPerformanceCounter)
	SendInput {F7}
	SendInput {Home} ; Uncap fps 
	SendInput {1} 
	lWin32Sleep(935, LastPerformanceCounter)
	SendInput {e} 
	lWin32Sleep(1000, LastPerformanceCounter)
	DllCall("mouse_event", uint, 1, int, 0, int, 335, uint, 0, int, 0) ; Aim at limb
	lWin32Sleep(1610, LastPerformanceCounter) ; 1800m 1770
	SendInput {F5}
Return

ShrineToClOld:
	;old right loc pin DllCall("mouse_event", uint, 1, int, -790, int, 110, uint, 0, int, 0) ; turn right
	;DllCall("mouse_event", uint, 1, int, -622, int, 54, uint, 0, int, 0) ; turn right new loc pin
	DllCall("mouse_event", uint, 1, int, -32, int, 7, uint, 0, int, 0) ; turn right new new loc pin
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	lSaveCounterAfterSleep(60, LastPerformanceCounter) ;20
	SendInput {Space down}
	lSaveCounterAfterSleep(60, LastPerformanceCounter)
	SendInput {Space up}  
	lSaveCounterAfterSleep(10, LastPerformanceCounter)
	SendInput {t} 
	SendInput {Home} ; Uncap fps 
	DllCall("mouse_event", uint, 1, int, 1865, int, 0, uint, 0, int, 0) ; Aim at limb
	lSaveCounterAfterSleep(30, LastPerformanceCounter) ;30
	SendInput {e} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {5} 
	lSaveCounterAfterSleep(130, LastPerformanceCounter)
	SendInput {F7}
	SendInput {1} 
	DllCall("mouse_event", uint, 1, int, 0, int, 635, uint, 0, int, 0) ; Aim at limb
	lWin32Sleep(675, LastPerformanceCounter)
	SendInput {e} 
	lWin32Sleep(715, LastPerformanceCounter)
	SendInput {z} 
	lWin32Sleep(1650, LastPerformanceCounter) ; 1800m 1770
	SendInput {F5}
Return

ResetPPRZFromArchwing:
	DllCall("mouse_event", uint, 1, int, 0, int, -500, uint, 0, int, 0) ; Aim at limb
	lSleep(30)
	SendInput {e}
	lSleep(50)
	SendInput {5}
	lSleep(500)
	SendInput {F5 Down}
	Sendinput {e}
	lSleep(50)
	SendInput {F5 Up}
Return

ResetPPRZFromGround:
	SendInput {5}
	lSleep(300)
	SendInput {F5 Down}
	Sendinput {e}
	lSleep(50)
	SendInput {F5 Up}
Return