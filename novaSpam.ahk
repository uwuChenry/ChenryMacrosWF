#SingleInstance, Force
#NoEnv ; For performance and compatibility with future AutoHotkey releases
SendMode Input ; For speed and reliability
SetBatchLines -1 ; No script sleep, for more consistent timing behavior. Default behavior is 10ms execution then 10ms sleep
ListLines Off ; Increase performance by a few percent by not logging the lines of code that are executed
#MaxHotkeysPerInterval 1000

global abilitySpam := false
global abilityDelay := 20000

PressFour(){
    SendInput {4}
    Return
}

!4::
	; i := IndexOf(abilityKeys, key)
	abilitySpam := !abilitySpam
	if (abilitySpam){
        SendInput {4}
		;CenteredToolTip("Ability " . i . " Spam On (Delay: " . abilityDelay[i] . "ms)") ; Periods concatenate strings
		SetTimer, PressFour, %abilityDelay%
	} else {
		;CenteredToolTip("Ability " . i . " Spam Off")
		; tmp := BoundFuncCache[key]
		SetTimer, PressFour, Off
	}
Return

