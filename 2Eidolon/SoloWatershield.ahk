
ShrineToCl:
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	DllCall("mouse_event", uint, 1, int, -790, int, 175, uint, 0, int, 0) ; turn right
	lSaveCounterAfterSleep(20, LastPerformanceCounter) ;20
	SendInput {Space down}
	lSaveCounterAfterSleep(40, LastPerformanceCounter)
	SendInput {Space up}  
	lSaveCounterAfterSleep(5, LastPerformanceCounter)
	SendInput {t} 
	DllCall("mouse_event", uint, 1, int, 1880, int, 0, uint, 0, int, 0) ; Aim at limb
	lSaveCounterAfterSleep(30, LastPerformanceCounter) ;30
	SendInput {e} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {5} 
	lSaveCounterAfterSleep(130, LastPerformanceCounter)
	SendInput {MButton}
	SendInput {Home} ; Uncap fps 
	SendInput {1} 
	DllCall("mouse_event", uint, 1, int, 0, int, 360, uint, 0, int, 0) ; Aim at limb
	lWin32Sleep(675, LastPerformanceCounter)
	SendInput {e} 
	lWin32Sleep(715, LastPerformanceCounter)
	SendInput {z} 
	lWin32Sleep(1650, LastPerformanceCounter) ; 1800m 1770
	SendInput {LButton}
Return

ShrineToClLow:
	;SendInput {Ins}
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	DllCall("mouse_event", uint, 1, int, -760, int, 175, uint, 0, int, 0) ; turn right
	lSaveCounterAfterSleep(30, LastPerformanceCounter) ;20
	SendInput {Space down}
	lSaveCounterAfterSleep(40, LastPerformanceCounter)
	SendInput {Space up}  
	lSaveCounterAfterSleep(5, LastPerformanceCounter)
	SendInput {t} 
	DllCall("mouse_event", uint, 1, int, 1900, int, 0, uint, 0, int, 0) ; Aim at limb
	lSaveCounterAfterSleep(30, LastPerformanceCounter) ;30
	SendInput {e} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {5} 
	lSaveCounterAfterSleep(130, LastPerformanceCounter)
	SendInput {MButton}
	;SendInput {Home} ; Uncap fps 
	SendInput {1} 
	DllCall("mouse_event", uint, 1, int, 0, int, 340, uint, 0, int, 0) ; Aim at limb
	lWin32Sleep(675, LastPerformanceCounter)
	SendInput {e} 
	lWin32Sleep(715, LastPerformanceCounter)
	SendInput {Del} 
	lWin32Sleep(755, LastPerformanceCounter)
	SendInput {Del} 
	lWin32Sleep(1500, LastPerformanceCounter)
	SendInput {RButton Down}
	lWin32Sleep(1610, LastPerformanceCounter) ; 1800m 1770
	SendInput {LButton}
	; lWin32Sleep(1610, LastPerformanceCounter)
	SendInput {RButton Up}
Return

; 	SendInput {Del}
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {RButton down} 
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {LButton}

ShrineToClHigh:
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	DllCall("mouse_event", uint, 1, int, -800, int, 85, uint, 0, int, 0) ; turn right
	lSaveCounterAfterSleep(20, LastPerformanceCounter) ;20
	SendInput {Space down}
	lSaveCounterAfterSleep(40, LastPerformanceCounter)
	SendInput {Space up}  
	lSaveCounterAfterSleep(5, LastPerformanceCounter)
	SendInput {t} 
	DllCall("mouse_event", uint, 1, int, 1850, int, 0, uint, 0, int, 0) ; Aim at limb
	lSaveCounterAfterSleep(30, LastPerformanceCounter) ;30
	SendInput {e} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {5} 
	lSaveCounterAfterSleep(130, LastPerformanceCounter)
	SendInput {MButton}
	SendInput {Home} ; Uncap fps 
	SendInput {1} 
	DllCall("mouse_event", uint, 1, int, 0, int, 690, uint, 0, int, 0) ; Aim at limb
	lWin32Sleep(675, LastPerformanceCounter)
	SendInput {e} 
	lWin32Sleep(715, LastPerformanceCounter)
	SendInput {z} 
	lWin32Sleep(1650, LastPerformanceCounter) ; 1800m 1770
	SendInput {LButton}
Return


ShrineToClOld:
	DllCall("mouse_event", uint, 1, int, -790, int, 110, uint, 0, int, 0) ; turn right
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	lSaveCounterAfterSleep(40, LastPerformanceCounter) ;20
	SendInput {Space down}
	lSaveCounterAfterSleep(50, LastPerformanceCounter)
	SendInput {Space up}  
	lSaveCounterAfterSleep(10, LastPerformanceCounter)
	SendInput {t} 
	DllCall("mouse_event", uint, 1, int, 1865, int, 0, uint, 0, int, 0) ; Aim at limb
	lSaveCounterAfterSleep(30, LastPerformanceCounter) ;30
	SendInput {e} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {5} 
	lSaveCounterAfterSleep(130, LastPerformanceCounter)
	SendInput {MButton}
	;SendInput {Home} ; Uncap fps 
	SendInput {1} 
	DllCall("mouse_event", uint, 1, int, 0, int, 625, uint, 0, int, 0) ; Aim at limb
	lWin32Sleep(675, LastPerformanceCounter)
	SendInput {e} 
	lWin32Sleep(715, LastPerformanceCounter)
	SendInput {z} 
	lWin32Sleep(1650, LastPerformanceCounter) ; 1800m 1770
	SendInput {LButton}
Return