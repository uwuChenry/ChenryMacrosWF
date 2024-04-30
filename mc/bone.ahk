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
	Gosub, reaperEQ2
	; Gosub, dogReaper
Return

*F14::
	While (GetKeyState("F14", "P")){
		SendInput {LButton}
		lsleep(120)
	}
Return


HeatCore:
	Send, 3.899m
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
	loop {
		pixelSearch, x, y, 699, 855, 702, 861, 0xFF51FF, 5, Fast RGB 
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


reaperEQ2:	
	SendInput {v} ;chim axe
	lSleep(20)
	SendInput {RButton}
	lSleep(30)
	SendInput {5 Down} ;6 = wardrobe
	lSleep(60)
	SendInput {5 Up}
	Start := A_TickCount
	loop {
		if (A_TickCount - Start > 600){
			SoundBeep
			lSleep(20)
			SoundBeep  
    		Return
		}
		pixelSearch, x, y, 699, 855, 702, 861, 0xFF51FF, 5, Fast RGB 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 863, "int", 651)
	lSleep(10)
	SendInput {LButton}
	Loop {
		pixelSearch, x, y, 878, 864, 880, 866, 0xFF51FF, 10, Fast RGB 
	} until (ErrorLevel == 0)
	Loop {
		pixelSearch, x, y, 972, 1005, 974, 1007, 0x140514, 10, Fast RGB 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 809, "int", 651)
	lSleep(330)
	SendInput {LButton}
	Loop {
		pixelSearch, x, y, 878, 864, 880, 866, 0xFF51FF, 10, Fast RGB 
	} until (ErrorLevel == 0)
	Loop {
		pixelSearch, x, y, 972, 1005, 974, 1007, 0x140514, 10, Fast RGB 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 743, "int", 651)
	lSleep(300)
	SendInput {LButton}
	Loop {
		pixelSearch, x, y, 878, 864, 880, 866, 0xFF51FF, 10, Fast RGB 
	} until (ErrorLevel == 0)
	Loop {
		pixelSearch, x, y, 972, 1005, 974, 1007, 0x140514, 10, Fast RGB 
	} until (ErrorLevel == 0)
	lSleep(50)
	SendInput {e}
	lSleep(50)
	SendInput {LShift Down}
	lSleep(200)
	SendInput {5 down}
	lSleep(60)
	SendInput {5 Up}
	SendInput {LShift Up}
	loop {
		pixelSearch, x, y, 699, 855, 702, 861, 0xFF51FF, 5, Fast RGB 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 863, "int", 651)
	lSleep(10)
	SendInput {LButton}
	Loop {
		pixelSearch, x, y, 878, 864, 880, 866, 0xFF51FF, 10, Fast RGB 
	} until (ErrorLevel == 0)
	Loop {
		pixelSearch, x, y, 972, 1005, 974, 1007, 0x140514, 10, Fast RGB 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 809, "int", 651)
	lSleep(300)
	SendInput {LButton}
	Loop {
		pixelSearch, x, y, 878, 864, 880, 866, 0xFF51FF, 10, Fast RGB 
	} until (ErrorLevel == 0)
	Loop {
		pixelSearch, x, y, 972, 1005, 974, 1007, 0x140514, 10, Fast RGB 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 743, "int", 651)
	lSleep(300)
	SendInput {LButton}
	Loop {
		pixelSearch, x, y, 878, 864, 880, 866, 0xFF51FF, 10, Fast RGB 
	} until (ErrorLevel == 0)
	Loop {
		pixelSearch, x, y, 972, 1005, 974, 1007, 0x140514, 10, Fast RGB 
	} until (ErrorLevel == 0)
	lSleep(50)
	SendInput {e}
Return