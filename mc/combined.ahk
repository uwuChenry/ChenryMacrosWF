#SingleInstance, Force
#NoEnv ; For performance and compatibility with future AutoHotkey releases
SendMode Input ; For speed and reliability
SetBatchLines -1 ; No script sleep, for more consistent timing behavior. Default behavior is 10ms execution then 10ms sleep
ListLines Off ; Increase performance by a few percent by not logging the lines of code that are executed
#MaxHotkeysPerInterval 1000
#InstallKeybdHook

#include SleepFunctions.ahk



global abilitySpam := false
global abilityDelay := 2800 ;1400


!e::
	MsgBox, aaaaaaaaaaaaaaaaaaaaa
Reload
Return

PgUp::
	Gosub, HeatCore
Return

F13::
	Gosub, reaperWD2
Return

*F14::
	Gosub, bone
	Return


HeatCore:
	Send, 4.3m
Return


bone:
	SendInput {4}
	lSleep(50)
	SendInput {RButton}
	lSleep(270)
	SendInput {f}
	Loop, 9 {
		SendInput {RButton}
		lSleep(100)
	}
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
	SendInput {v}
	lSleep(30)
	SendInput {RButton}
	lSleep(1200)
	SendInput {6 Down}
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
	loop {
		pixelSearch, x, y, 699, 855, 702, 861, 0xFF51FF, 5, Fast RGB 
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", 1068, "int", 503)
	SoundBeep 
	lSleep(10)
	SendInput {LButton}
	lSleep(300)
	SendInput {e}
Return



treeFuncMonkey3(){
SendInput {2}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(75)
SendInput {RButton}
lSleep(75)
SendInput {d Down}
SendInput {w Down}
SendInput {RButton}
lSleep(75)
SendInput {d up}
SendInput {w up}
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {3}
SendInput {RButton Down}
lSleep(100)
SendInput {v}
lSleep(300)
SendInput {4}
lSleep(100)
SendInput {RButton Up}
SendInput {LButton}

lSleep(400)

SendInput {2}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(75)
SendInput {RButton}
lSleep(75)
SendInput {a Down}
SendInput {RButton}
lSleep(75)
SendInput {a up}
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {3}
SendInput {RButton Down}
lSleep(100)
SendInput {v}
lSleep(300)
SendInput {4}
lSleep(100)
SendInput {RButton Up}
SendInput {LButton}

lSleep(400)
Return
}



Home::
	treeFuncMonkey3()
Return

PgDn::
	abilitySpam := !abilitySpam
	if (abilitySpam){
		SoundBeep 
		SetTimer, treeFuncMonkey3, %abilityDelay%
		treeFuncMonkey3()
	} else {
		SetTimer, treeFuncMonkey3, Off
		SoundBeep
		lSleep(100)
		SoundBeep
	}
Return
