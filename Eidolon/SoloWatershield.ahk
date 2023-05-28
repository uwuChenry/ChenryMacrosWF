

#include ShinsImageScanClass.ahk
scan := new ShinsImageScanClass()
global CurrentDetector := ""

;-------------------------- SOLO WATERSHIELD MACROS --------------------------

;---SHRINE TO CL---

asdfds:
Return




ShrineToCl:
	SendInput {Ins}
	DllCall("mouse_event", uint, 1, int, -790, int, 110, uint, 0, int, 0) ; turn right
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	lSaveCounterAfterSleep(30, LastPerformanceCounter) ;20
	SendInput {Space down}
	lSaveCounterAfterSleep(50, LastPerformanceCounter)
	SendInput {Space up}  
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {t} 
	DllCall("mouse_event", uint, 1, int, 1860, int, 0, uint, 0, int, 0) ; Aim at limb
	lSaveCounterAfterSleep(40, LastPerformanceCounter) ;30
	SendInput {e} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {5} 
	lSaveCounterAfterSleep(130, LastPerformanceCounter)
	SendInput {MButton}
	SendInput {Home} ; Uncap fps 
	SendInput {1} 
	DllCall("mouse_event", uint, 1, int, 0, int, 625, uint, 0, int, 0) ; Aim at limb
	lWin32Sleep(675, LastPerformanceCounter)
	SendInput {e} 
	lWin32Sleep(715, LastPerformanceCounter)
	SendInput {z} 
	lWin32Sleep(1650, LastPerformanceCounter) ; 1800m 1770
	SendInput {LButton}

Return

;---GARRY DETECTOR---

GarryDetector:
	Critical, On
	if (scan.PixelRegion(0x3C292C, 1184, 440, 60, 30, 20)) { 
		Critical, Off ; Execute CR protocol
		Gosub, ClToCr
	} else {
		DllCall("Kernel32\Sleep", "UInt", 205) ; Give time for pink number to show up
		PixelSearch, PX, PY, 900, 500, 1000, 530, 0xFDFDFD, 1, Fast RGB; goog Find CL white crit number
		if (Errorlevel == 0) {
			;SendInput {Numpad0}
			Critical, Off ; Execute CL protocol
			; SendInput {Home} ; Uncap fps
		} else {
			DllCall("mouse_event", uint, 1, int, -590, int, 0, uint, 0, int, 0) ; turn right
			Critical, Off
			; DllCall("Kernel32\Sleep", "UInt", 105) ; Allow time screen to adjust so ahk can find the glow
			; PixelSearch, PX, PY, 876, 376, 959, 467, 0x8093A4, 10, Fast ; Find MID garry glow 729199
			; if (ErrorLevel == 0) { 
			; 	Critical, Off ; Execute MID protocol
			; 	DllCall("mouse_event", uint, 1, int, 1590, int, 520, uint, 0, int, 0) ; Reset direction
			; 	Gosub, ClToMidGarry
			; } else {
			; 	Critical, Off ; Execute LONG protocol
			; 	DllCall("mouse_event", uint, 1, int, 1590, int, 520, uint, 0, int, 0) ; Reset direction
			; 	Gosub, ClToLong 
			; }
		}
	}
Return

; ;---HARRY DETECTOR---

HarryDetector:
; 	Critical, On
; 	PixelSearch, PX, PY, 792, 274, 859, 317, 0x878741, 8, Fast ; Find CR harry limb
; 	if (Errorlevel == 0) {
; 		Critical, Off ; Execute CR protocol
; 		Gosub, ClToCr
; 	} else {
; 		DllCall("Kernel32\Sleep", "UInt", 100) ; Give time for pink number to show up
; 		PixelSearch, PX, PY, 600, 320, 680, 360, 0x00F7FF, 3, Fast ; Find CL white crit number															
; 		if (Errorlevel == 0) {
; 			SendInput {Numpad0}
; 			Critical, Off ; Execute CL protocol
; 			; SendInput {Home} ; Uncap fps
; 		} else {
; 			/*
; 			PixelSearch, PX, PY, 610, 330, 670, 350, 0x3D72CB, 8, Fast ; Find CL orange crit number
; 			if (ErrorLevel == 0) { 
; 				Critical, Off ; Execute CL protocol
; 				SendInput {Home} ; Uncap fps
; 			} else {
; 			*/
; 				DllCall("mouse_event", uint, 1, int, -1590, int, -520, uint, 0, int, 0) ; Face towards long
; 				DllCall("Kernel32\Sleep", "UInt", 110) ; Allow time screen to adjust so ahk can find the limb/glow
; 				PixelSearch, PX, PY, 857, 390, 959, 485, 0x7DAB6B, 15, Fast ; Find MID harry glow
; 				if (ErrorLevel == 0) { 
; 					Critical, Off ; Execute Mid protocol
; 					DllCall("mouse_event", uint, 1, int, 1590, int, 520, uint, 0, int, 0) ; Reset direction
; 					Gosub, ClToMidHarry
; 				} else {
; 					Critical, Off ; Execute LONG protocol
; 					DllCall("mouse_event", uint, 1, int, 1590, int, 520, uint, 0, int, 0) ; Reset direction
; 					Gosub, ClToLong 
; 				}
; 			}
; 		}
; 	;}
Return

; ;---CL TO CR---

ClToCr:
	DllCall("mouse_event", uint, 1, int, -79, int, -410, uint, 0, int, 0)
	lSleep(10)
	SendInput {LShift down}
	SendInput {w down}
	lSleep(160) ; Just right ;lwin32sleep
	SendInput {w up}

	lSleep(10)
	SendInput, e
	lSleep(150)
	DllCall("mouse_event", uint, 1, int, -979, int, 415, uint, 0, int, 0)
	SendInput {5}
	SendInput {LShift Up}
	lSleep(170)
	SendInput {Mbutton}
	lSleep(50)
	DllCall("mouse_event", uint, 1, int, -2279, int, -300, uint, 0, int, 0)
	;SendInput {e}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {Del}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {RButton down}
	lSaveCounterAfterSleep(200, LastPerformanceCounter)
	SendInput {LButton}
	DllCall("Kernel32\Sleep", "UInt", 10)
	SendInput {RButton up} 
Return	

; ;---CL TO MID---

ClToMidGarry:
	DllCall("mouse_event", uint, 1, int, -790, int, -385, uint, 0, int, 0) ; look at mid
	SendInput {LShift down}
	SendInput {w down}
	lSleep(145)
	SendInput {w up}
	lSleep(10)
	DllCall("mouse_event", uint, 1, int, 0, int, 805, uint, 0, int, 0) ; look at mid
	SendInput, e
	lSleep(250)
	SendInput {5}
	SendInput {LShift Up}
	;DllCall("mouse_event", uint, 1, int, -2000, int, -300, uint, 0, int, 0) ; aim
	lSleep(170)
	SendInput {Mbutton}
	lSleep(350)
	SendInput {e}
	lSleep(5)
	SendInput {Del}
	; DllCall("mouse_event", uint, 1, int, -350, int, 900, uint, 0, int, 0) ; look at ground
	; lSleep(50)
	; SendInput {j}
	; lSleep(50)
	DllCall("mouse_event", uint, 1, int, -2530, int, -730, uint, 0, int, 0) ; look at limb
	SendInput {RButton Down}
	lSleep(30)
	SendInput {RButton up} 
	lSleep(30)
	SendInput {LButton}





	; SendInput {e}
	; lSleep(5)
	; SendInput {Del}
	; DllCall("mouse_event", uint, 1, int, -350, int, 900, uint, 0, int, 0) ; look at ground
	; lSleep(50)
	; SendInput {j}
	; lSleep(50)
	; DllCall("mouse_event", uint, 1, int, -190, int, -570, uint, 0, int, 0) ; look at limb
	; SendInput {RButton Down}
	; lSleep(30)
	; SendInput {LButton}
	; DllCall("Kernel32\Sleep", "UInt", 10)
	; SendInput {RButton up} 


	; lSaveCounterAfterSleep(20, LastPerformanceCounter)
	; DllCall("mouse_event", uint, 1, int, -2230, int, -750, uint, 0, int, 0) ; look at limb
	; SendInput {Del}
	; lSaveCounterAfterSleep(20, LastPerformanceCounter)
	; SendInput {RButton down}
	; lSaveCounterAfterSleep(30, LastPerformanceCounter)
	; SendInput {LButton}
	; DllCall("Kernel32\Sleep", "UInt", 10)
	; SendInput {RButton up} 

Return

; ClToMidHarry:
; Return

; ;--CL TO LONG---

ClToLong:
	DllCall("mouse_event", uint, 1, int, -1612, int, -540, uint, 0, int, 0) ; Face towards long
	SendInput {LShift down}
	SendInput {w down}
	lSleep(160)
	SendInput {t}
	lSleep(205)	
	DllCall("mouse_event", uint, 1, int, 0, int, 1000, uint, 0, int, 0) ; Face down
	lSleep(10)
	SendInput {w up}
	SendInput {e}
	lSleep(500)
	DllCall("mouse_event", uint, 1, int, -1800, int, -800, uint, 0, int, 0) ; turn towards mountain
	lSleep(150)
	SendInput {5}
	SendInput {LShift up}
	lSleep(170)
	SendInput {Mbutton}
	lSleep(500)
	SendInput {e}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	DllCall("mouse_event", uint, 1, int, -573, int, 130, uint, 0, int, 0) ; look at limb
	SendInput {Del}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {RButton down}
	lSaveCounterAfterSleep(30, LastPerformanceCounter)
	SendInput {LButton}
	DllCall("Kernel32\Sleep", "UInt", 10)
	SendInput {RButton up} 


; 	SendInput {LShift down}
; 	SendInput {w down}
; 	lWin32Sleep(65) ; Later and body hit before slam attack
; 	SendInput {e}
; 	SendInput {w up}
; 	SendInput {LShift up}
; 	; SendInput {Home} ; Uncap fps
; 	lWin32Sleep(198) ; Earlier and operator may come out before slam attack
; 	SendInput {5}
; 	DllCall("mouse_event", uint, 1, int, 0, int, -250, uint, 0, int, 0) ; Aim propa
; 	lWin32Sleep(200)
; 	SendInput {y}
; 	lWin32Sleep(180)
; 	DllCall("mouse_event", uint, 1, int, -950, int, -350, uint, 0, int, 0) ; Aim zenith
; 	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
; 	lSaveCounterAfterSleep(25, LastPerformanceCounter)
; 	SendInput {e}
; 	lSaveCounterAfterSleep(25, LastPerformanceCounter)
; 	SendInput {]}
; 	lSaveCounterAfterSleep(25, LastPerformanceCounter)
; 	SendInput {]}
; 	lSaveCounterAfterSleep(25, LastPerformanceCounter)
; 	loop 5{
; 		SendInput {Numpad0}
; 		DllCall("Kernel32\Sleep", "UInt", 200)
; 	}
; 	*/
Return


	; DllCall("mouse_event", uint, 1, int, -1612, int, -380, uint, 0, int, 0) ; Face towards long
	; DllCall("Kernel32\Sleep", "UInt", 30)
	; loop {
	; PixelSearch, PX, PY, 900, 480, 1020, 600, 0x00F7FF, 0, Fast RGB; Lock on to loc-pin
	; } until (ErrorLevel == 0)
	; DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-962.5)*1.5, "UInt", (PY-538)*1.5)
	; DllCall("Kernel32\Sleep", "UInt", 30)
	; loop {
	; 	PixelSearch, PX, PY, 920, 500, 1000, 580, 0x00F7FF, 0, Fast RGB; Lock on to loc-pin
	; } until (ErrorLevel == 0)
	; DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-962.5)*1.5, "UInt", (PY-538)*1.5)
	; DllCall("Kernel32\Sleep", "UInt", 30)
	; loop {
	; 	PixelSearch, PX, PY, 940, 520, 980, 560, 0x00F7FF, 0, Fast RGB; Lock on to loc-pin
	; } until (ErrorLevel == 0)
	; DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-962.5)*1.5, "UInt", (PY-538)*1.5)
	; DllCall("Kernel32\Sleep", "UInt", 30)






	; 	DllCall("mouse_event", uint, 1, int, -790, int, -385, uint, 0, int, 0) ; look at mid
	; SendInput {LShift down}
	; SendInput {w down}
	; lSleep(170)
	; SendInput {w up}
	; lSleep(10)
	; SendInput, e
	; DllCall("mouse_event", uint, 1, int, -300, int, 815, uint, 0, int, 0) ; aim
	; lSleep(150)
	; SendInput {5}
	; SendInput {LShift Up}
	; lSleep(170)
	; SendInput {Mbutton}
	; ;SendInput {s Down}
	; lSleep(50)
	; SendInput {e}
	; ;SendInput {s Up}
	; ; lSaveCounterAfterSleep(20, LastPerformanceCounter)
	; ; DllCall("mouse_event", uint, 1, int, -2230, int, -750, uint, 0, int, 0) ; look at limb
	; ; SendInput {Del}
	; ; lSaveCounterAfterSleep(20, LastPerformanceCounter)
	; ; SendInput {RButton down}
	; ; lSaveCounterAfterSleep(30, LastPerformanceCounter)
	; ; SendInput {LButton}
	; ; DllCall("Kernel32\Sleep", "UInt", 10)
	; ; SendInput {RButton up} 