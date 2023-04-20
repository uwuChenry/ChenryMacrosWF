global CurrentDetector := ""

;-------------------------- SOLO WATERSHIELD MACROS --------------------------

;---SHRINE TO CL---

asd:
Return


ShrineToCl:
	; Critical, On
	; loop {
	; 	SendInput {x}
	; 	pixelSearch, PX, PY, 1010, 600, 1040, 640, 0xCA4538, 14, Fast RGB ; Detect if shard has appeared
	; } until (ErrorLevel == 0)
	; Critical, Off
	DllCall("mouse_event", uint, 1, int, -790, int, 110, uint, 0, int, 0) 
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	SendInput {Space down}
	lSaveCounterAfterSleep(80, LastPerformanceCounter)
	SendInput {Space up}  
	lSaveCounterAfterSleep(10, LastPerformanceCounter)
	SendInput {t} 
	DllCall("mouse_event", uint, 1, int, 1850, int, 0, uint, 0, int, 0) ; Aim at limb
	lSaveCounterAfterSleep(10, LastPerformanceCounter)
	SendInput {e} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {5} 
	lSaveCounterAfterSleep(130, LastPerformanceCounter)
	SendInput {MButton} 
	SendInput {1} 
	DllCall("mouse_event", uint, 1, int, 0, int, 670, uint, 0, int, 0) ; Aim at limb
	lWin32Sleep(675, LastPerformanceCounter)
	SendInput {e} 
	lWin32Sleep(715, LastPerformanceCounter)
	SendInput {z} 
	lWin32Sleep(1640, LastPerformanceCounter) ; 1800m 1770
	SendInput {LButton}
Return

;---GARRY DETECTOR---

; GarryDetector:
; 	Critical, On
; 	PixelSearch, PX, PY, 770, 270, 840, 300, 0x6C9983, 11, Fast ; Find CR garry limb
; 	if (Errorlevel == 0) { 
; 		Critical, Off ; Execute CR protocol
; 		Gosub, ClToCr
; 	} else {
; 		DllCall("Kernel32\Sleep", "UInt", 105) ; Give time for pink number to show up
; 		PixelSearch, PX, PY, 600, 320, 680, 360, 0xFFFFFF, 3, Fast ; Find CL white crit number
; 		if (Errorlevel == 0) {
; 			SendInput {Numpad0}
; 			Critical, Off ; Execute CL protocol
; 			; SendInput {Home} ; Uncap fps
; 		} else {
; 			DllCall("mouse_event", uint, 1, int, -1590, int, -520, uint, 0, int, 0) ; Face towards long
; 			DllCall("Kernel32\Sleep", "UInt", 105) ; Allow time screen to adjust so ahk can find the glow
; 			PixelSearch, PX, PY, 876, 376, 959, 467, 0x8093A4, 10, Fast ; Find MID garry glow 729199
; 			; 63710C
; 			; 5D6135
; 			; B: 99 + 93 = 96
; 			; G: 113 + 97 = 105
; 			; R: 53 + 12 = 33
; 			if (ErrorLevel == 0) { 
; 				Critical, Off ; Execute MID protocol
; 				DllCall("mouse_event", uint, 1, int, 1590, int, 520, uint, 0, int, 0) ; Reset direction
; 				Gosub, ClToMidGarry
; 			} else {
; 				Critical, Off ; Execute LONG protocol
; 				DllCall("mouse_event", uint, 1, int, 1590, int, 520, uint, 0, int, 0) ; Reset direction
; 				Gosub, ClToLong 
; 			}
; 		}
; 	}
; Return

; ;---HARRY DETECTOR---

; HarryDetector:
; 	Critical, On
; 	PixelSearch, PX, PY, 792, 274, 859, 317, 0x878741, 8, Fast ; Find CR harry limb
; 	if (Errorlevel == 0) {
; 		Critical, Off ; Execute CR protocol
; 		Gosub, ClToCr
; 	} else {
; 		DllCall("Kernel32\Sleep", "UInt", 100) ; Give time for pink number to show up
; 		PixelSearch, PX, PY, 600, 320, 680, 360, 0xFFFFFF, 3, Fast ; Find CL white crit number															
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
; Return

; ;---CL TO CR---

ClToCr:
	DllCall("mouse_event", uint, 1, int, -79, int, -455, uint, 0, int, 0) ; Start getting closer so macro can lock on and still be accurate in landing position
	;/*
	; lSleep(10)
	; SendInput {LShift down}
	; SendInput {Space down}
	; SendInput {w down}
	; lWin32Sleep(180) ; Just right
	; SendInput {w up}
	; SendInput {Space up}
	; SendInput {s down}
	; SendInput {LCtrl down}
	; lWin32Sleep(79)
	; SendInput {s up}
	; SendInput {LCtrl up}
	; SendInput {LShift up}
	; ;DllCall("mouse_event", uint, 1, int, -59, int, 200, uint, 0, int, 0) ; Aim at loc-pin for lock on
	; lWin32Sleep(50) ; Don't let it lock on too fast while archwing still moving (need testing)
	; ; loop {
	; ; 	PixelSearch, PX, PY, 540, 260, 740, 460, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
	; ; } until (ErrorLevel == 0)
	; ; DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640)*1.2, "UInt", (PY-360)*1.2)
	; ; DllCall("Kernel32\Sleep", "UInt", 30)
	; ; loop {
	; ; 	PixelSearch, PX, PY, 580, 300, 700, 420, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
	; ; } until (ErrorLevel == 0)
	; ; DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640)*1.2, "UInt", (PY-360)*1.2)
	; ; DllCall("Kernel32\Sleep", "UInt", 30)
	; ; loop {
	; ; 	PixelSearch, PX, PY, 600, 320, 680, 400, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
	; ; } until (ErrorLevel == 0)
	; ; DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640)*1.25, "UInt", (PY-360)*1.25)
	; DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	; lSaveCounterAfterSleep(30, LastPerformanceCounter)
	; SendInput {LShift down}
	; SendInput {w down}
	; lSaveCounterAfterSleep(90, LastPerformanceCounter) ; Later than this and you risk knocking onto floor before slam melee
	; SendInput {e}
	; SendInput {w up}
	; SendInput {LShift up}
	; ; SendInput {Home} ; Uncap fps
	; lSaveCounterAfterSleep(150, LastPerformanceCounter) ; Earlier and you risk transference before slam
	; DllCall("mouse_event", uint, 1, int, -1700, int, 300, uint, 0, int, 0) ; Aim propa
	; SendInput {5}
	; lSaveCounterAfterSleep(170, LastPerformanceCounter) ; Earlier and operator cant shoot propa
	; SendInput {y}
	; lSaveCounterAfterSleep(50, LastPerformanceCounter) ; Don't let warframe insta det propa
	; DllCall("mouse_event", uint, 1, int, -3010, int, -710, uint, 0, int, 0) ; Aim zenith
	; SendInput {e}
	; lSaveCounterAfterSleep(20, LastPerformanceCounter)
	; SendInput {]}
	; lSaveCounterAfterSleep(20, LastPerformanceCounter)
	; SendInput {Numpad1 down}
	; lSaveCounterAfterSleep(20, LastPerformanceCounter)
	; loop 5{
	; 	SendInput {Numpad0}
	; 	DllCall("Kernel32\Sleep", "UInt", 200)
	; }
	; SendInput {Numpad1 up} 
Return	

; ;---CL TO MID---

; ClToMidGarry:
; 	DllCall("mouse_event", uint, 1, int, -840, int, 185, uint, 0, int, 0) ; Aim and move closer to mid
; 	;/*
; 	SendInput {LShift down}
; 	SendInput {space down}
; 	SendInput {w down}
; 	lWin32Sleep(225)
; 	SendInput {w up}
; 	SendInput {Space up}
; 	SendInput {s down}
; 	SendInput {LCtrl down}
; 	lWin32Sleep(79)
; 	SendInput {s up}
; 	SendInput {LCtrl up}
; 	SendInput {LShift up}
; 	DllCall("mouse_event", uint, 1, int, 0, int, 490, uint, 0, int, 0) ; Aim above locpin
; 	lWin32Sleep(50) ; Don't let it lock on too fast while archwing still moving (need testing)
; 	loop {
; 		PixelSearch, PX, PY, 570, 290, 710, 430, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
; 	} until (ErrorLevel == 0)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640)*1.5, "UInt", (PY-360)*1.5)
; 	DllCall("Kernel32\Sleep", "UInt", 30)
; 	loop {
; 		PixelSearch, PX, PY, 590, 310, 690, 410, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
; 	} until (ErrorLevel == 0)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
; 	DllCall("Kernel32\Sleep", "UInt", 30)
; 	loop {
; 		PixelSearch, PX, PY, 610, 330, 670, 390, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
; 	} until (ErrorLevel == 0)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
; 	DllCall("Kernel32\Sleep", "UInt", 30)
; 	SendInput {LShift down}
; 	SendInput {w down}
; 	lWin32Sleep(92) ; Later and body hit before slam attack
; 	SendInput {e}
; 	SendInput {w up}
; 	SendInput {LShift up}
; 	; SendInput {Home} ; Uncap fps
; 	lWin32Sleep(155) ; Earlier and operator may come out before slam attack
; 	SendInput {5}
; 	DllCall("mouse_event", uint, 1, int, -700, int, 0, uint, 0, int, 0) ; Aim propa
; 	lWin32Sleep(200) ; Do not change this as it may cause insta det
; 	SendInput {y}
; 	;/*
; 	DllCall("Kernel32\Sleep", "UInt", 50)
; 	DllCall("mouse_event", uint, 1, int, -2600, int, -1030, uint, 0, int, 0) ; Aim zenith
; 	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {e}
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {]}
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {Numpad1 down}
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	loop 5{
; 		SendInput {Numpad0}
; 		DllCall("Kernel32\Sleep", "UInt", 200)
; 	}
; 	SendInput {Numpad1 up}
; 	*/
; Return

; ClToMidHarry:
; 	DllCall("mouse_event", uint, 1, int, -840, int, 185, uint, 0, int, 0) ; Aim and move closer to mid
; 	;/*
; 	SendInput {LShift down}
; 	SendInput {space down}
; 	SendInput {w down}
; 	lWin32Sleep(225)
; 	SendInput {w up}
; 	SendInput {Space up}
; 	SendInput {s down}
; 	SendInput {LCtrl down}
; 	lWin32Sleep(79)
; 	SendInput {s up}
; 	SendInput {LCtrl up}
; 	SendInput {LShift up}
; 	DllCall("mouse_event", uint, 1, int, 0, int, 490, uint, 0, int, 0) ; Aim above locpin
; 	lWin32Sleep(50) ; Don't let it lock on too fast while archwing still moving (need testing)
; 	loop {
; 		PixelSearch, PX, PY, 570, 290, 710, 430, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
; 	} until (ErrorLevel == 0)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640)*1.5, "UInt", (PY-360)*1.5)
; 	DllCall("Kernel32\Sleep", "UInt", 30)
; 	loop {
; 		PixelSearch, PX, PY, 590, 310, 690, 410, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
; 	} until (ErrorLevel == 0)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
; 	DllCall("Kernel32\Sleep", "UInt", 30)
; 	loop {
; 		PixelSearch, PX, PY, 610, 330, 670, 390, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
; 	} until (ErrorLevel == 0)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
; 	DllCall("Kernel32\Sleep", "UInt", 30)
; 	SendInput {LShift down}
; 	SendInput {w down}
; 	lWin32Sleep(92) ; Later and body hit before slam attack
; 	SendInput {e}
; 	SendInput {w up}
; 	SendInput {LShift up}
; 	; SendInput {Home} ; Uncap fps
; 	lWin32Sleep(155) ; Earlier and operator may come out before slam attack
; 	SendInput {5}
; 	DllCall("mouse_event", uint, 1, int, -700, int, 0, uint, 0, int, 0) ; Aim propa
; 	lWin32Sleep(180)
; 	SendInput {y}
; 	;/*
; 	DllCall("Kernel32\Sleep", "UInt", 530)
; 	SendInput {y}
; 	;/*
; 	DllCall("Kernel32\Sleep", "UInt", 20)
; 	DllCall("mouse_event", uint, 1, int, -2600, int, -1030, uint, 0, int, 0) ; Aim zenith
; 	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {e}
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {]}
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {Numpad1 down}
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	loop 5{
; 		SendInput {Numpad0}
; 		DllCall("Kernel32\Sleep", "UInt", 200)
; 	}
; 	SendInput {Numpad1 up}
; 	*/
; Return

; ;--CL TO LONG---

; ClToLong:
; 	SendInput {LShift down}
; 	SendInput {Space down}
; 	DllCall("mouse_event", uint, 1, int, -1659, int, -415, uint, 0, int, 0) ; Face towards long
; 	lSleep(50)
; 	SendInput {Space up}
; 	lSleep(50)
; 	SendInput {w down}
; 	lWin32Sleep(340)
; 	SendInput {z}
; 	SendInput {w up}
; 	SendInput {s down}
; 	lWin32Sleep(79)
; 	SendInput {s up}
; 	SendInput {LShift up}
; 	;/*
; 	DllCall("mouse_event", uint, 1, int, -1619, int, 754, uint, 0, int, 0) ; Aim at locpin 
; 	;/*
; 	lWin32Sleep(50) ; Allow screen time to adjust
; 	loop {
; 		PixelSearch, PX, PY, 570, 290, 710, 430, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
; 	} until (ErrorLevel == 0)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
; 	DllCall("Kernel32\Sleep", "UInt", 30)
; 	loop {
; 		PixelSearch, PX, PY, 580, 300, 700, 420, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
; 	} until (ErrorLevel == 0)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
; 	DllCall("Kernel32\Sleep", "UInt", 30)
; 	loop {
; 		PixelSearch, PX, PY, 600, 320, 680, 400, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
; 	} until (ErrorLevel == 0)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
; 	DllCall("Kernel32\Sleep", "UInt", 30)
; 	DllCall("mouse_event", "UInt", 0x01, "UInt", -20, "UInt", 20)
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
; Return