#SingleInstance, Force
#NoEnv ; For performance and compatibility with future AutoHotkey releases
SendMode Input ; For speed and reliability
SetBatchLines -1 ; No script sleep, for more consistent timing behavior. Default behavior is 10ms execution then 10ms sleep
ListLines Off ; Increase performance by a few percent by not logging the lines of code that are executed
#MaxHotkeysPerInterval 1000
#InstallKeybdHook

#include SleepFunctions.ahk



; ! alt key
; !e 

!e::
	MsgBox, boneeeeeee
Reload
Return

;pagedown key on keybord

PgUp::
	Gosub, HeatCore
Return

F13::
	Gosub, ReaperWD2
	; Gosub, dogReaper
Return

;* f14 

*F14::
	Gosub, bone
	; Gosub, boneDog
Return


HeatCore:
	Send, 3.998m
Return

dogReaper:
	SoundBeep	
	SendInput {v} ;chim axe
	lSleep(30)
	SendInput {RButton}
	lSleep(600)
	SendInput {6 Down} ;6 = wardrobe
	lSleep(60)
	SendInput {6 Up}
	Start := A_TickCount
	loop {
		if (A_TickCount - Start > 700){
			SoundBeep
			lSleep(20)
			SoundBeep  
    		Return
		}
		;pixel search numbers x1, y1, x2, y2, color code, tolerace
		pixelSearch, x, y, 699, 855, 702, 861, 0xFF51FF, 5, Fast RGB 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 1176, "int", 503)
	SoundBeep 
	lSleep(10)
	SendInput {LButton}
	lSleep(50)
	SendInput {e}
	lSleep(350)
	SendInput {LShift Down}
	lSleep(100)
	SendInput {6 down}
	lSleep(60)
	SendInput {6 Up}
	SendInput {LShift Up}
	; Start2 := A_TickCount
	loop {
		; if (A_TickCount - Start2 > 500){
		; 	SoundBeep
		; 	lSleep(20)
		; 	SoundBeep  
    	; 	Return
		; }
		pixelSearch, x, y, 699, 855, 702, 861, 0xFF51FF, 5, Fast RGB 
		; 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 906, "int", 503)
	SoundBeep 
	lSleep(10)
	SendInput {LButton}
	lSleep(300)
	SendInput {e}
Return

boneDog:
	SendInput {4} ; bone
	lSleep(50)
	SendInput {RButton}
	lSleep(100)
	SendInput {f} ; mace
	SendInput {LShift up}
	SendInput {6 Down} ;6 = wardrobe
	lSleep(60)
	SendInput {6 Up}
	SendInput {LShift up}
	Start := A_TickCount
	loop {
		if (A_TickCount - Start > 500){
			SoundBeep
			lSleep(20)
			SoundBeep  
    		Return
		}
		;pixel search numbers x1, y1, x2, y2, color code, tolerace
		pixelSearch, x, y, 699, 855, 702, 861, 0xFF51FF, 5, Fast RGB 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 1068, "int", 503)
		SendInput {LShift up}
	SoundBeep 
	lSleep(10)
		SendInput {LShift up}
	SendInput {LButton}
	lSleep(300)
	SendInput {e}
	lSleep(600)
	SendInput {1}
	lSleep(50)
	SendInput {RButton}
	lSleep(50)
	SendInput {r} ; endstone
	lSleep(50)	
	SendInput {RButton}
	lSleep(50)
	SendInput {3} ;juju
	lSleep(50)
	SendInput {LButton}
Return

bone:
	SendInput {4} ; bone
	lSleep(50)
	SendInput {RButton}
	lSleep(270)
	SendInput {f} ; mace
	Loop, 9 {
		SendInput {RButton}
		lSleep(100)
	}
	SendInput {r} ; endstone
	lSleep(50)	
	SendInput {RButton}
	lSleep(100)
	SendInput {3} ;juju
	lSleep(50)
	SendInput {LButton}
Return

boneHold:
	SendInput {4}
	lSleep(50)
	SendInput {RButton}
	lSleep(270)
	SendInput {f}
	lSleep(400)
	SendInput {RButton Down}
	lSleep(450)
	SendInput {RButton Up}
	lSleep(50)
	SendInput {r}
	lSleep(50)	
	SendInput {RButton}
	lSleep(100)
	SendInput {3}
	lSleep(50)
	SendInput {LButton}
Return

reaperWD2:
	SoundBeep	
	SendInput {v} ;chim axe
	lSleep(30)
	SendInput {RButton}
	lSleep(1300)
	SendInput {6 Down} ;6 = wardrobe
	lSleep(60)
	SendInput {6 Up}
	Start := A_TickCount
	firstTime := True
	loop {
		; if (A_TickCount - Start > 600 && firstTime){
		; 	SendInput {6 Down} ;6 = wardrobe
		; 	lSleep(60)
		; 	SendInput {6 Up}
		; 	firstTime := false
		; }
		if (A_TickCount - Start > 600){
			SoundBeep
			lSleep(20)
			SoundBeep  
    		Return
		}
		;pixel search numbers x1, y1, x2, y2, color code, tolerace
		pixelSearch, x, y, 699, 855, 702, 861, 0xFF51FF, 5, Fast RGB 
	} until (ErrorLevel == 0)
	BlockInput, On
	DllCall("SetCursorPos", "int", 1176, "int", 503)
	lSleep(10)
	SendInput {LButton}
	BlockInput, Off
	SoundBeep 
	lSleep(50)
	SendInput {e}
	lSleep(350)
	SendInput {LShift Down}
	lSleep(100)
	SendInput {6 down}
	lSleep(60)
	SendInput {6 Up}
	SendInput {LShift Up}
	; Start2 := A_TickCount

	loop {
		; if (A_TickCount - Start2 > 500){
		; 	SoundBeep
		; 	lSleep(20)
		; 	SoundBeep  
    	; 	Return
		; }
		pixelSearch, x, y, 699, 855, 702, 861, 0xFF51FF, 5, Fast RGB 
		; 
	} until (ErrorLevel == 0)
	BlockInput, On
	DllCall("SetCursorPos", "int", 1068, "int", 503)
	lSleep(10)
	SendInput {LButton}
	BlockInput, Off
	SoundBeep 
	lSleep(200)
	SendInput {e}
Return