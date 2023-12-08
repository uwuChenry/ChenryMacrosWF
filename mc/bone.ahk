﻿#SingleInstance, Force
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
	Gosub, reaperST
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
	SendInput {v}
	lSleep(30)
	SendInput {RButton}
	lSleep(50)
	SendInput {5 Down} ;SC006
	lSleep(50)
	SendInput {5 Up}
	lSleep(500)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -40, "UInt", 90)
	lSleep(30)
	SendInput {LButton}
	lSleep(30)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -40, "UInt", 0)
	lSleep(250)
	SendInput {LButton}
	lSleep(50)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -60, "UInt", 0)
	lSleep(250)
	SendInput {LButton}
	
	lSleep(100)
	SendInput {e}
	lSleep(300)
	SendInput {LShift Down}
	lSleep(100)
	SendInput {LShift Up}
	lSleep(100)
	SendInput {5 Down}
	lSleep(50)
	SendInput {5 Up}
	SendInput {LShift}
	lSleep(450)

	DllCall("mouse_event", "UInt", 0x01, "UInt", -40, "UInt", 90)
	lSleep(50)
	SendInput {LButton}
	lSleep(50)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -40, "UInt", 0)
	lSleep(250)
	SendInput {LButton}
	lSleep(50)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -60, "UInt", 0)
	lSleep(250)
	SendInput {LButton}
	
	lSleep(50)
	SendInput {e}
Return

reaperST:
	SendInput {v}
	lSleep(30)
	SendInput {RButton}
	lSleep(50)
	SendInput {F8}
	lSleep(500)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -40, "UInt", 90)
	lSleep(30)
	SendInput {LButton}
	lSleep(30)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -40, "UInt", 0)
	lSleep(250)
	SendInput {LButton}
	lSleep(50)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -60, "UInt", 0)
	lSleep(250)
	SendInput {LButton}
	
	lSleep(300)
	SendInput {e}
	lSleep(100)
	SendInput {LShift Down}
	lSleep(100)
	SendInput {LShift Up}
	lSleep(100)
	SendInput {F8}
	SendInput {LShift}
	lSleep(500)

	DllCall("mouse_event", "UInt", 0x01, "UInt", -40, "UInt", 90)
	lSleep(50)
	SendInput {LButton}
	lSleep(50)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -40, "UInt", 0)
	lSleep(250)
	SendInput {LButton}
	lSleep(50)
	DllCall("mouse_event", "UInt", 0x01, "UInt", -60, "UInt", 0)
	lSleep(250)
	SendInput {LButton}
	
	lSleep(50)
	SendInput {e}
Return