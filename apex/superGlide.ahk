#SingleInstance, Force
#NoEnv ; For performance and compatibility with future AutoHotkey releases
SendMode Input ; For speed and reliability
SetBatchLines -1 ; No script sleep, for more consistent timing behavior. Default behavior is 10ms execution then 10ms sleep
ListLines Off ; Increase performance by a few percent by not logging the lines of code that are executed
#MaxHotkeysPerInterval 1000
#InstallKeybdHook

#include SleepFunctions.ahk


!e::
	MsgBox, superglide
Reload
Return

#IfWinActive Apex Legends
x::
	Gosub, superGlide
Return



; #IfWinActive Apex Legends
; XButton2::
; while (GetKeyState("XButton2", "P")){
; 	SendInput {w}
; 	lSleep(40)
; }
; Return




superGlide:
	SendInput {Space}
	lSleep(5)
	SendInput {LCtrl}
Return
