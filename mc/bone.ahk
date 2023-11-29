#SingleInstance, Force
#NoEnv ; For performance and compatibility with future AutoHotkey releases
SendMode Input ; For speed and reliability
SetBatchLines -1 ; No script sleep, for more consistent timing behavior. Default behavior is 10ms execution then 10ms sleep
ListLines Off ; Increase performance by a few percent by not logging the lines of code that are executed
#MaxHotkeysPerInterval 1000

#include SleepFunctions.ahk

!e::
	MsgBox, test
Reload
Return

PgUp::
	Gosub, HeatCore
Return

HeatCore:
	Send, 3.4m
Return

Ins::
	Gosub, bone
	Return

bone:
	SendInput {4}
	lSleep(50)
	SendInput {RButton}
	lSleep(70)
	SendInput {f}
	Loop, 10 {
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

; bone:
; 	SendInput {1}
; 	lSleep(50)
; 	SendInput {RButton}
; 	lSleep(300)
; 	SendInput {4}
; 	lSleep(70)
; 	SendInput {RButton}
; 	lSleep(70)
; 	SendInput {f}
; 	Loop, 13 {
; 		SendInput {RButton}
; 		lSleep(100)
; 	}
; 	SendInput {r}
; 	lSleep(50)	
; 	SendInput {RButton}
; 	lSleep(100)
; 	SendInput {3}
; 	lSleep(100)
; 	SendInput {LButton}
; Return

