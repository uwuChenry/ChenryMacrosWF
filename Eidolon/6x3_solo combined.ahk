#Include OverclockAHK.ahk
#include SleepFunctions.ahk
#include SoloLimbMacro.ahk
#include SoloWatershield.ahk
CoordMode, Pixel, Screen


global fps := 330
global ZenithShot := 8000/fps
global EmoteOffset := 60

asd:
Return

#IfWinActive Warframe
Q::
	SendInput {RButton Down}
	lSleep(70)	
	SendInput {RButton Up}
	lSleep(10)
	SendInput {e}
	lSleep(240)
	SendInput, 5
Return


CenteredToolTip(text, duration = 999){ ; Duration in ms (MilliSeconds). Default value can be optionally overridden
	ToolTip, %text%, A_ScreenWidth/2, A_ScreenHeight/2
	SetTimer, RemoveToolTip, -%duration% ; Negative to only trigger once
}
RemoveToolTip(){
	ToolTip
}


;-------------------------- SOLO WATERSHIELD MACROS --------------------------

;---SHRINE TO CL---

7::	
	Gosub, ShrineToCl
	;Gosub, %CurrentDetector% ; Loop limb macro should change to suitable detector. If not make a hotkey to set the detector yourself
Return

; ;---CL TO CR---

8::
	Gosub, ClToCr
Return

; ;---CL TO MID---

9::
	Gosub, ClToMidGarry
	;Gosub, ClToMidHarry
Return

; ;--CL TO LONG---
      
0:: 
	Gosub, ClToLong
Return


;-------------------------- LIMB MACROS --------------------------

*XButton1::
	Gosub, %CurrentLoopSubroutine%
Return

CapsLock::
    Gosub, LoopMacroedZeroed ; Press after you zero-ed. This will stop the loop and change CurrentLoopSubroutine to ManualPPRZ. Press again to change the loop limb macro, watershield macro, and detector macro to the next eidolon (Terry -> Garry -> Harry)
Return

;-------------------------- RELOAD MACRO --------------------------

F3::
	Reload
Return

;-------------------------- TEST PIXELSEARCH MACRO --------------------------


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
	DllCall("Kernel32\Sleep", "UInt", 30)
	loop {
		PixelSearch, PX, PY, 940, 520, 980, 560, 0x53C97C, 0, Fast RGB; Lock on to loc-pin
	} until (ErrorLevel == 0)
	DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-962.5)*1.5, "UInt", (PY-538)*1.5)
	DllCall("Kernel32\Sleep", "UInt", 30)
	;CenteredToolTip("test")
Return

