
#Include OverclockAHK.ahk
#include SleepFunctions.ahk
#include SoloLimbMacro.ahk
#include SoloWatershield.ahk
CoordMode, Pixel, Screen



;-------------------------- SOLO WATERSHIELD MACROS --------------------------

;---SHRINE TO CL---
#IfWinActive Warframe
7::	
	Gosub, ShrineToClLow
	;Gosub, ShrineToClOld
	lSleep(500)
	;Gosub, ResetPPRZFromArchwing
	Gosub, ResetPPRZFromGround
	;Gosub, %CurrentDetector% ; Loop limb macro should change to suitable detector. If not make a hotkey to set the detector yourself
Return


F2::
	loop {
		PixelSearch, PX, PY, 1805, 978, 1898, 1065, 0x2ce3ea, 10, Fast RGB; Lock on to loc-pin
	} until (ErrorLevel == 0)
	DllCall("QueryPerformanceCounter", "Int64*", blueThing)
	lSleep(29670, blueThing)
	Gosub, %CurrentLoopSubroutine%	
Return

;-------------------------- LIMB MACROS --------------------------

*XButton1::
	Gosub, %CurrentLoopSubroutine%
Return

*CapsLock::
    Gosub, LoopMacroedZeroed ; Press after you zero-ed. This will stop the loop and change CurrentLoopSubroutine to ManualPPRZ. Press again to change the loop limb macro, watershield macro, and detector macro to the next eidolon (Terry -> Garry -> Harry)
Return

;-------------------------- RELOAD MACRO --------------------------

*F3::
	MsgBox, test
	Reload
Return

;-------------------------- TEST PIXELSEARCH MACRO --------------------------

!4::
	;SendInput {Insert}
	SendInput {Tab Down}
	Sleep, 300
	SendInput {Tab Up}
	Critical, On
	loop {
		SendInput x
		;pixelSearch, PX, PY, 1010, 600, 1040, 640, 0xCA4538, 50, Fast RGB ; Detect if shard has appeared
		;pixelSearch, PX, PY, 980, 520, 1070, 620, 0xC91B20, 50, Fast RGB ; seal.mp4's shard with new loc pin
		pixelSearch, PX, PY, 766, 557, 856, 696, 0xC91B20, 60, Fast RGB ; seal.mp4's shard with new new loc pin
	} until (ErrorLevel == 0)
	Critical, Off
	SendInput {x Up}
	
	;Gosub, ShrineToClLow
	Gosub, ShrineToClOld
	DllCall("QueryPerformanceCounter", "Int64*", thing)
	lSleep(400)
	Gosub, ResetPPRZFromArchwing
	;Gosub, ResetPPRZFromGround
	lSleep(15571, thing)
	Gosub, %CurrentLoopSubroutine%
Return

!3::	
	loop {
		PixelSearch, PX, PY, 860, 440, 1060, 640, 0x53C97C, 0, Fast RGB; Lock on to loc-pin
	} until (ErrorLevel == 0)
	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-962.5)*1.5, "UInt", (PY-538)*1.5)
	DllCall("Kernel32\Sleep", "UInt", 30)
	loop {
		PixelSearch, PX, PY, 900, 480, 1020, 600, 0x53C97C, 0, Fast RGB; Lock on to loc-pin
	} until (ErrorLevel == 0)
	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-962.5)*1.5, "UInt", (PY-538)*1.5)
	DllCall("Kernel32\Sleep", "UInt", 30)
	loop {
		PixelSearch, PX, PY, 920, 500, 1000, 580, 0x53C97C, 0, Fast RGB; Lock on to loc-pin
	} until (ErrorLevel == 0)
	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-962.5)*1.5, "UInt", (PY-538)*1.5)
Return

; #IfWinActive Warframe
; 8::	
; 	;Gosub, ShrineToClLow
; 	Gosub, ResetPPRZFromArchwing
; 	;Gosub, %CurrentDetector% ; Loop limb macro should change to suitable detector. If not make a hotkey to set the detector yourself
; Return

; k::
; CancelAnimation:
;     SendInput, {Blind}{rbutton Down}
;     lSleep(100)
;     SendInput, {Blind}{rbutton Up}
;     lSleep(50)

; 	DllCall("QueryPerformanceCounter", "Int64*", FirstEmotion)
;     SendInput, {Blind}{F8}
;     lSleep(-1, FirstEmotion)
;     loop, 50 {
;         SendInput, {Blind}{5}
;     }
; 	DllCall("QueryPerformanceCounter", "Int64*", Operator)
;     SendInput, {Blind}{s Down}
;     lSleep(500, Operator)
;     SendInput, {Blind}{s Up}
; 	DllCall("QueryPerformanceCounter", "Int64*", SecondEmotion)
;     SendInput, {Blind}{f8}
;     lSleep(-1, SecondEmotion)
;     loop, 50 {
;         SendInput, {Blind}{5}
;     }
; 	DllCall("QueryPerformanceCounter", "Int64*", Operator2)
;     lSleep(50, Operator2)
;     Loop, 25 {
;         SendInput, {Blind}{Space}
;         lSleep(1)
;     }
; return