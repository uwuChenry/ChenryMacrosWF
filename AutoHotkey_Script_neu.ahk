#NoEnv ; For performance and compatibility with future AutoHotkey releases
SendMode Input ; For speed and reliability
SetBatchLines -1 ; No script sleep, for more consistent timing behavior. Default behavior is 10ms execution then 10ms sleep
ListLines Off ; Increase performance by a few percent by not logging the lines of code that are executed
#MaxHotkeysPerInterval 1000

; Modifiers: [+ = Shift] [^ = Ctrl] [# = Win] [! = Alt] [* = Ignores modifiers] [~ = Also uses original function] [$ = Forces hook, preventing hotkey from triggering itself] More info here: https://www.autohotkey.com/docs/KeyList.htm
; All time values listed are in ms(MilliSeconds), which are 1/1000 of a second. 1000/delay = activationsPerSecond. I.e: 50ms delay -> 1000/50 = 20 per sec
; Time values are typically rounded up to a multiple of 10ms by the Windows time-keeping system. So there's no point to Timer/Sleep values that aren't multiples of 10. Higher precision may be achieved via Loop+DllCall, but is rarely relevant and certainly doesn't matter for this script

global slideDelay := 110 ; 110 achieves max movement speed with Balla (with extremely high attack speed). Use higher delay for slower attack speeds. Too low a delay can yield normal, non-slide attacks. To find out the sweetspot for your weapon, see if you execute any non-slide attacks, then increase delay incrementally until they stop

global crouchDelay := 250 ; 125ms between notes for Octavia tracks

global abilitySpam := [false, false, false, false]
global abilityDelay := [500, 9000, 15000, 2000] ; Delay between activations for ability 1, 2, 3 and 4, respectively
global delayToModify := 4
global incrementIncrement := 50
global abilityDelayIncrement := 500
global abilityKeys := ["1", "2", "3", "4"] ; Keybind for each respective ability key. Change these to be the same as your ingame keybinds

#IfWinActive ahk_exe Warframe.x64.exe ; Only trigger hotkeys when Warframe is the active window
Hotkey, IfWinActive, ahk_exe Warframe.x64.exe ; Same, but for dynamically created hotkeys

global BoundFuncCache := {} ; A collection of bound functions for use in Timer stopping. Func(f).Bind(k) seems to create an object and return a reference to it, without caching the result, so manual caching is required to reference the same object

for i, key in abilityKeys {
	toggleAbilityBF := Func("ToggleAbilitySpam").Bind(key)
	Hotkey, % "*<^>!" . key, % toggleAbilityBF ; AltGr+AbilityKey to toggle spam for that ability
	selectBF := Func("SelectAbilityToModify").Bind(key)
	Hotkey, % "#" . key, % selectBF ; Win+AbilityKey to select ability for modification of delay
	BoundFuncCache[key] := Func("CastAbility").Bind(key)
}

SelectAbilityToModify(key){
	delayToModify := IndexOf(abilityKeys, key)
	DisplayAbilityDelay()
}

ToggleAbilitySpam(key){
	i := IndexOf(abilityKeys, key)
	abilitySpam[i] := !abilitySpam[i]
	if (abilitySpam[i]){
		CenteredToolTip("Ability " . i . " Spam On (Delay: " . abilityDelay[i] . "ms)") ; Periods concatenate strings
		Send, % "{Blind}{" . key . "}"
		tmp := BoundFuncCache[key] ; SetTimer doesn't support function references in expression mode, requiring a temporary variable and regular variable dereferencing
		SetTimer, %tmp%, % abilityDelay[i]
	} else {
		CenteredToolTip("Ability " . i . " Spam Off")
		tmp := BoundFuncCache[key]
		SetTimer, %tmp%, Off
	}
}
CastAbility(key){
	if (WinActive("ahk_exe Warframe.x64.exe"))
		Send, % "{Blind}{" . key . "}" ; {Blind} fixes issues with a combined Sprint+Roll key; Without {Blind}, holding down Shift during a Send command will send {Shift Up}, then the key and then {Shift Down}, causing unintentional rolling
}

global spam := false
spamHotkeys := ["LButton", "e", "MButton"] ; Hold one of these to spam that key. Just add a key to the array to automatically make it a new spam hotkey (same goes for removing)

for i, key in spamHotkeys { ; Creates hotkeys for each key in the array above
	BoundFuncCache[key] := Func("SendBlind").Bind(key)
	Hotkey, IfWinActive ; Make StopSpam work outside of Warframe to avoid button getting stuck when clicking on a different window
	stopSpamBF := Func("StopSpam").Bind(BoundFuncCache[key])
	Hotkey, % "~*" . key . " Up", % stopSpamBF
	Hotkey, IfWinActive, ahk_exe Warframe.x64.exe ; Re-enable condition
	spamBF := Func("Spam").Bind(key) ; Bind(BoundFunc) the Key to the Spam function to use it as input for the Hotkey Command
	Hotkey, % "$*" . key, % spamBF ; $ to ensure Hotkeys can't trigger themselves
}

Spam(key){
	Send, % "{Blind}{" . key . " Down}" ; Required because ~ can't be used with KeyWait for blocking Auto-Repeat
	if (spam){
		tmp := BoundFuncCache[key] ; SetTimer doesn't support function references in expression mode, requiring a temporary variable and regular variable dereferencing
		SetTimer, %tmp%, 50 ; Delay between activations in ms. 50ms = 20 times per second. Should be good for most use-cases
		KeyWait, % key
	}
}
StopSpam(boundFunc){
	SetTimer, %boundFunc%, Off
}
SendBlind(key){ ; Function-wrapper for the Send Command
	Send, % "{Blind}{" . key . "}"
}

^L:: ; Ctrl+L toggles Spam On/Off
	spam := !spam
	if (spam)
		CenteredToolTip("Spam On")
	else
		CenteredToolTip("Spam Off")
return

MeleeAttack(){
	Send, {Blind}{e} ; Melee key. Replace with the key you use
}
*!Q:: ; Alt+Q to throw Contagion. Most of the delays(Sleep) need to be longer than 2 frames, which at 60FPS is 2/60 = 33.33ms, i.e: 40 delay. Increase delay to 70 if you can't keep FPS above 60
	Send, {Blind}{Space}
	Sleep, 25 ; Too short delay = throw fizzles (no throw)
	Send, {Blind}{Space}
	Sleep, 1 ; Without a minimal delay here the throw fizzles if you don't have your melee out
	Send, {Blind}{RButton Down}
	Sleep, 15 ; Too short delay = aim-glide gets stuck
	MeleeAttack()
	Sleep, 15 ; ONLY NEEDED AS CLIENT. Too short delay = throw fizzles
	Send, {Blind}{RButton Up}
return

; Shift+PageUp/Down to adjust delay between Slide-Attacks. Warframe uses a queue system for melee inputs; too low a delay can yield normal, non-slide attacks
+PgUp::
	slideDelay := slideDelay+10
	CenteredToolTip("SlideDelay: " . slideDelay . "ms")
return
+PgDn::
	if (slideDelay > 10) ; Avoid 0 and negative values
		slideDelay := slideDelay-10
	CenteredToolTip("SlideDelay: " . slideDelay . "ms")
return

*+LAlt:: ; Triggers with Shift+LeftAlt, then keeps attacking while LeftAlt is held down
	SlideAttack()
	SetTimer, SlideAttack, %slideDelay%
	KeyWait, LAlt
return
~*LAlt Up::
	SetTimer, SlideAttack, Off
return
SlideAttack(){
	Send, {LCtrl Down} ; Crouch key. {Blind} is not used because it causes Alt to sometimes get stuck logically down
	MeleeAttack()
	Send, {LCtrl Up} ; No delay needed between Crouch down and up. Has the bonus of removing the "shake" of spam-crouching
}

; Alt+PageUp/Down to adjust delay between crouches
!PgUp::
	crouchDelay := crouchDelay+10
	CenteredToolTip("CrouchDelay: " . crouchDelay . "ms")
return
!PgDn::
	if (crouchDelay > 10)
		crouchDelay := crouchDelay-10
	CenteredToolTip("CrouchDelay: " . crouchDelay . "ms")
return

*!C:: ; Alt+C to spam crouch
	Send, {Blind}{LCtrl Down}
	SetTimer, CrouchSpam, %crouchDelay%
	KeyWait, C
return
~*C Up::
	Send, {Blind}{LCtrl Up}
	SetTimer, CrouchSpam, Off
return
CrouchSpam(){
	Send, {Blind}{LCtrl Up}
	Sleep, 1
	Send, {Blind}{LCtrl Down}
}

DisplayAbilityDelay(){
	CenteredToolTip("Ability " . delayToModify . " Delay: " . abilityDelay[delayToModify] . "ms")
}

; AltGr+PageUp/Down to adjust delay between ability activations
<^>!PgUp::
	abilityDelay[delayToModify] := abilityDelay[delayToModify]+abilityDelayIncrement
	DisplayAbilityDelay()
	if (abilitySpam[delayToModify]){
		tmp := BoundFuncCache[abilityKeys[delayToModify]]
		SetTimer, %tmp%, % abilityDelay[delayToModify] ; Update running timers
	}
return
<^>!PgDn::
	if (abilityDelay[delayToModify] > abilityDelayIncrement) ; Avoid 0 and negative values
		abilityDelay[delayToModify] := abilityDelay[delayToModify]-abilityDelayIncrement
	DisplayAbilityDelay()
	if (abilitySpam[delayToModify]){
		tmp := BoundFuncCache[abilityKeys[delayToModify]]
		SetTimer, %tmp%, % abilityDelay[delayToModify]
	}
return

; Win+PageUp/Down to adjust increment for adjusting delay between ability activations
#PgUp::
	abilityDelayIncrement := abilityDelayIncrement+incrementIncrement
	CenteredToolTip("Ability Delay Increment: " . abilityDelayIncrement . "ms")
return
#PgDn::
	if (abilityDelayIncrement > incrementIncrement)
		abilityDelayIncrement := abilityDelayIncrement-incrementIncrement
	CenteredToolTip("Ability Delay Increment: " . abilityDelayIncrement . "ms")
return

!X:: ; Alt+X to skip transmission dialogue (AKA "Nightwave skip"). Made for 16:9 aspect ratios, change the MouseMove if your screen isn't 16:9 so the cursor lands on the Nightwave banner
	Send, {Esc}
	Sleep, 444 ; Wait for transition animation
	MouseMove, % A_ScreenWidth*0.85, % A_ScreenHeight*0.87, 0 ; Use relative location rather than absolute so that it works with any 16:9 resolution. NOTE: Mouse Movement doesn't work in fullscreen mode
	Sleep, 1 ; Needs delay between movement and Click
	Click, down
	Sleep, 1 ; Needs separate up and down events, otherwise the UI doesn't register the click
	Click, up ; Essentially: Send, {Blind}{LButton Up}
	Sleep, 444 ; Wait for transition animation
	Send, {Esc}
return

CapsLock::j ; Remaps CapsLock to 5. I'm using CapsLock as Transference key

#IfWinActive ; The next hotkeys work outside of Warframe too

^P::Suspend ; Ctrl+P toggles hotkeys On/Off
*#P::Pause ; Win+P toggles execution Pause
<^>!R::Reload ; AltGr+R reloads script

CenteredToolTip(text, duration = 999){ ; Duration in ms (MilliSeconds). Default value can be optionally overridden
	ToolTip, %text%, A_ScreenWidth/2, A_ScreenHeight/2
	SetTimer, RemoveToolTip, -%duration% ; Negative to only trigger once
}
RemoveToolTip(){
	ToolTip
}

IndexOf(array, item){ ; Returns the index of the first item matching the input item
	for i in array
		if (array[i] == item)
			return i
}