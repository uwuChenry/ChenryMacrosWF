
#Include OverclockAHK.ahk
#include SleepFunctions.ahk
#include SoloLimbMacro.ahk
#include SoloWatershield.ahk
CoordMode, Pixel, Screen



;-------------------------- SOLO WATERSHIELD MACROS --------------------------

;---SHRINE TO CL---
#IfWinActive Warframe
7::	
	;Gosub, ShrineToClHigh
	;Gosub, ShrineToClLow
	;Gosub, ShrineToCl
	Gosub, ShrineToClOld
	;Gosub, %CurrentDetector% ; Loop limb macro should change to suitable detector. If not make a hotkey to set the detector yourself
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
		pixelSearch, PX, PY, 1010, 600, 1040, 640, 0xCA4538, 14, Fast RGB ; Detect if shard has appeared
	} until (ErrorLevel == 0)
	Critical, Off
	SendInput {x Up}
	;lSleep(10)
	Gosub, ShrineToClOld
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

