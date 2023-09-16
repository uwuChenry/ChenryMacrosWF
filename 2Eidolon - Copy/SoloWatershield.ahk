
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
	;lWin32Sleep(735, LastPerformanceCounter)
	;SendInput {Del} 
	lWin32Sleep(750, LastPerformanceCounter)
	SendInput {LButton}
	lWin32Sleep(1610, LastPerformanceCounter) ; 1800m 1770
	SendInput {LButton}
	; lWin32Sleep(1610, LastPerformanceCounter)
	SendInput {RButton Up}
Return

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
	SendInput {Home} ; Uncap fps 
	SendInput {1} 
	DllCall("mouse_event", uint, 1, int, 0, int, 635, uint, 0, int, 0) ; Aim at limb
	lWin32Sleep(675, LastPerformanceCounter)
	SendInput {e} 
	lWin32Sleep(715, LastPerformanceCounter)
	SendInput {z} 
	lWin32Sleep(1650, LastPerformanceCounter) ; 1800m 1770
	SendInput {F5}
	;go down reset pprz glitch thing
	lSleep(100)
	DllCall("mouse_event", uint, 1, int, 0, int, 1000, uint, 0, int, 0)
	lSleep(100)
	sendInput {e}
	lSleep(800)
	SendInput {5}
	lSleep(100)
	DllCall("mouse_event", uint, 1, int, -1400, int, -1500, uint, 0, int, 0)
	lSleep(300)
	SendInput {c}
	lSleep(50)
	SendInput {2}
	lSleep(300)
	SendInput {F5 Down}
	Sendinput {e}
	lSleep(50)
	SendInput {F5 Up}
	Loop, 3{
		SendInput {e}
		lSleep(250)
	}
Return