#SingleInstance, Force
#NoEnv ; For performance and compatibility with future AutoHotkey releases
SendMode Input ; For speed and reliability
SetBatchLines -1 ; No script sleep, for more consistent timing behavior. Default behavior is 10ms execution then 10ms sleep
ListLines Off ; Increase performance by a few percent by not logging the lines of code that are executed
#MaxHotkeysPerInterval 1000
#InstallKeybdHook

#include SleepFunctions.ahk




!e::
	MsgBox, test
Reload
Return

PgUp::
	Gosub, HeatCore
Return

PgDn::
	Gosub, reaper
Return

Ins::
	Gosub, bone
	Return


HeatCore:
	Send, 3.59m
Return


bone:
	SendInput {4}
	lSleep(50)
	SendInput {RButton}
	lSleep(270)
	SendInput {f}
	Loop, 8 {
		SendInput {RButton}
		lSleep(100)
	}
	SendInput {r}
	lSleep(50)	
	SendInput {RButton}
	lSleep(100)
	SendInput {3}
	lSleep(100)
	SendInput {LButton}
Return

reaper:
	; SendInput {v}
	; lSleep(30)
	; SendInput {RButton}
	; lSleep(100)
	Send {SC006} ;SC006
	lSleep(300)
	;DllCall("mouse_event", "UInt", 0x01, "UInt", -100, "UInt", 10)
Return