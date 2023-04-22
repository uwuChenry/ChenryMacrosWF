#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to asist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#Persistent
#InstallKeybdHook
#InstallMouseHook
#KeyHistory 0
ListLines Off
SetBatchLines -1
SetKeyDelay, -1, -1
SetMouseDelay, -1, -1
SetControlDelay -1
SetWinDelay -1
#MaxHotkeysPerInterval 100000
Process, Priority,, High




global CurrentDetector := ""

;-------------------------- SOLO WATERSHIELD MACROS --------------------------

;---SHRINE TO CL---

asdfds:
Return


ShrineToCl:
	; Critical, On
	; loop {
	; 	SendInput {x}
	; 	pixelSearch, PX, PY, 1010, 600, 1040, 640, 0xCA4538, 14, Fast RGB ; Detect if shard has appeared
	; } until (ErrorLevel == 0)
	; Critical, Off
	DllCall("mouse_event", uint, 1, int, -790, int, 110, uint, 0, int, 0) ; turn right
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	SendInput {Space down}
	lSaveCounterAfterSleep(80, LastPerformanceCounter)
	SendInput {Space up}  
	lSaveCounterAfterSleep(10, LastPerformanceCounter)
	SendInput {t} 
	DllCall("mouse_event", uint, 1, int, 1860, int, 0, uint, 0, int, 0) ; Aim at limb
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
	SendInput {e}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {Del}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {RButton down}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {LButton}
	DllCall("Kernel32\Sleep", "UInt", 20)
	SendInput {RButton up} 
Return	

; ;---CL TO MID---

ClToMidGarry:
	DllCall("mouse_event", uint, 1, int, -790, int, -385, uint, 0, int, 0)
	SendInput {LShift down}
	SendInput {w down}
	lSleep(170)
	SendInput {w up}
	lSleep(10)
	SendInput, e
	DllCall("mouse_event", uint, 1, int, -300, int, 815, uint, 0, int, 0)
	lSleep(150)
	SendInput {5}
	SendInput {LShift Up}
	lSleep(170)
	SendInput {Mbutton}
	lSleep(50)
	SendInput {e}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	DllCall("mouse_event", uint, 1, int, -2250, int, -750, uint, 0, int, 0) ; look at limb
	SendInput {Del}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {RButton down}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {LButton}
	DllCall("Kernel32\Sleep", "UInt", 20)
	SendInput {RButton up} 

Return

; ClToMidHarry:
; Return

; ;--CL TO LONG---

ClToLong:
	DllCall("mouse_event", uint, 1, int, -1630, int, -540, uint, 0, int, 0) ; Face towards long
	SendInput {LShift down}
	SendInput {w down}
	lWin32Sleep(680)
	DllCall("mouse_event", uint, 1, int, 0, int, 1000, uint, 0, int, 0) ; Face down
	lSleep(10)
	SendInput {w up}
	lSleep(300)
	SendInput {LShift up}


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