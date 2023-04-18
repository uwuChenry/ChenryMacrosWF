;-------------------------- INCLUDED LIBRARIES --------------------------

#include OverclockAHK.ahk
#include SleepFunctions.ahk

;#include CapFPS.ahk
#include SoloLimbMacro.ahk
#include SoloWatershield.ahk
CoordMode, Pixel, Screen

;-------------------------- CAP FPS MACRO --------------------------

;NumpadMult::
;	Gosub, LightCap
;Return

;-------------------------- SOLO WATERSHIELD MACROS --------------------------

;---SHRINE TO CL---

7::	
	Gosub, ShrineToCl
	;Gosub, %CurrentDetector% ; Loop limb macro should change to suitable detector. If not make a hotkey to set the detector yourself
Return

; ;---CL TO CR---

; XButton1::
; 	Gosub, ClToCr
; Return

; ;---CL TO MID---

; F5::
; 	;Gosub, ClToMidGarry
; 	Gosub, ClToMidHarry
; Return

; ;--CL TO LONG---
      
; F2:: 
; 	Gosub, ClToLong
; Return

;-------------------------- SPAM SPACEBAR MACRO --------------------------

; XButton2::
; 	while GetKeyState("XButton2","P")
; 		{
; 			SendInput {Space}
; 			DllCall("Kernel32\Sleep", "UInt", 55)
; 		}
; Return

;-------------------------- LIMB MACROS --------------------------

XButton1::
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

/*
h::	
	CoordMode, Pixel, Screen
	loop { 
		PixelSearch, PX, PY, 600, 320, 680, 360, 0xFFFFFF, 3, Fast ; Find CL white crit number
	} until (ErrorLevel == 0)
	DllCall("SetCursorPos", "int", PX, "int", PY)
Return

; PixelSearch, PX, PY, 420, 433, 459, 458, 0x7170B4, 14, Fast ; 113 112 180 Detect if shard has appeared
;PixelSearch, PX, PY, 270, 520, 300, 570, 0x7170B4, 14, Fast ; 113 112 180 Detect if shard has appeared
