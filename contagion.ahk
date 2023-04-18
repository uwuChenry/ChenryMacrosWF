; CHANGE THESE VALUES
fps 		= 200 			; Change this to your average FPS during the fight. 
meleeKey 	= e 			; Change this to your quick melee key. Default: e
jumpKey 	= Space 		; Change this to your jump key. Default: Space
aimKey 	= RButton 		; Change this to your aim key. Default: RButton
macroKey 	= CapsLock 		; Change this to the key you would like to activate the macro. Default: CapsLock
; DON'T CHANGE BELOW HERE

#NoEnv
SendMode Input
SetBatchLines -1
ListLines Off

sleepTime := 2000/fps

#IfWinActive ahk_exe Warframe.x64.exe
Hotkey, IfWinActive, ahk_exe Warframe.x64.exe

Hotkey, *%macrokey%, ThrowContagion
return

ThrowContagion:
	Send, {Blind}{%jumpKey%}
	Sleep, %sleepTime%
	Send, {Blind}{%jumpKey%}
	Sleep, %sleepTime%
	Send, {Blind}{%aimKey% Down}
	Sleep, %sleepTime%
	Send, {Blind}{%meleeKey%}
	Sleep, %sleepTime%
	Send, {Blind}{%aimKey% Up}
return

#IfWinActive
F11::Suspend, Toggle
