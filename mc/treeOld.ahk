#SingleInstance, Force
#NoEnv ; For performance and compatibility with future AutoHotkey releases
SendMode Input ; For speed and reliability
SetBatchLines -1 ; No script sleep, for more consistent timing behavior. Default behavior is 10ms execution then 10ms sleep
ListLines Off ; Increase performance by a few percent by not logging the lines of code that are executed
#MaxHotkeysPerInterval 1000
#InstallKeybdHook

#include SleepFunctions.ahk


global abilitySpam := false
global abilityDelay := 2800 ;1400

!e::
	MsgBox, test
Reload
Return



treeFuncMonkey(){
SendInput {RButton Down}
SendInput {2}
lSleep(50)
SendInput {a Down}
lsleep(200)
SendInput {a Up}
lSleep(250)
SendInput {d Down}
lSleep(200)
SendInput {d up}
lSleep(200)
SendInput {3}
lSleep(250)
SendInput {v}
lSleep(200)
SendInput {4}
lSleep(200)
SendInput {LButton}
SendInput {RButton Up}
Return
}



treeFuncMonkey2(){
SendInput {2}
lSleep(50)
SendInput {RButton}
SendInput {a Down}
lSleep(50)
SendInput {RButton}
lSleep(25)
SendInput {a Up}
lSleep(50)
Loop, 2{
	SendInput {RButton}
	lSleep(75)
}
SendInput {d Down}
SendInput {RButton}
lSleep(75)
SendInput {d up}
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {3}
SendInput {RButton Down}
lSleep(100)
SendInput {v}
lSleep(350)
SendInput {4}
lSleep(100)
SendInput {RButton Up}
SendInput {LButton}
Return
}

treeFuncMonkey3(){
SendInput {2}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(75)
SendInput {RButton}
lSleep(75)
SendInput {d Down}
SendInput {w Down}
SendInput {RButton}
lSleep(75)
SendInput {d up}
SendInput {w up}
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {3}
SendInput {RButton Down}
lSleep(100)
SendInput {v}
lSleep(300)
SendInput {4}
lSleep(100)
SendInput {RButton Up}
SendInput {LButton}

lSleep(400)

SendInput {2}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(75)
SendInput {RButton}
lSleep(75)
SendInput {a Down}
SendInput {RButton}
lSleep(75)
SendInput {a up}
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {RButton}
lSleep(50)
SendInput {3}
SendInput {RButton Down}
lSleep(100)
SendInput {v}
lSleep(300)
SendInput {4}
lSleep(100)
SendInput {RButton Up}
SendInput {LButton}

lSleep(400)
Return
}

PgUp::
	treeFuncMonkey3()
Return


PgDn::
	abilitySpam := !abilitySpam
	if (abilitySpam){
		SoundBeep 
		SetTimer, treeFuncMonkey3, %abilityDelay%
		treeFuncMonkey3()
	} else {
		SetTimer, treeFuncMonkey3, Off
		SoundBeep
		lSleep(100)
		SoundBeep
	}
Return

treeFunc(){
SendInput {2}
lSleep(50)
SendInput {a Down}
SendInput {RButton Down}
lsleep(200)
SendInput {a Up}
lSleep(300)
SendInput {d Down}
lSleep(200)
SendInput {d up}
lSleep(300)
SendInput {3}
lSleep(400)
SendInput {4}
lSleep(300)
SendInput {RButton Up}
SendInput {LButton}
Return
}

tree:
SendInput {2}
lSleep(50)
SendInput {a Down}
SendInput {RButton Down}
lsleep(200)
SendInput {a Up}
lSleep(300)
SendInput {d Down}
lSleep(200)
SendInput {d up}
lSleep(300)
SendInput {3}
lSleep(400)
SendInput {4}
lSleep(300)
SendInput {RButton Up}
SendInput {LButton}
Return


