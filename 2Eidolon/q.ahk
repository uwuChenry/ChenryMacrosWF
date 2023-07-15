#Include OverclockAHK.ahk
#include SleepFunctions.ahk

#IfWinActive Warframe
Q::
	;SendInput {RButton Down}
	lSleep(90)	
	;SendInput {RButton Up}
	lSleep(10)
	SendInput {e}
	lSleep(220)
	;sendInput {del}
	; lSleep(60)
	SendInput {5}
Return


#IfWinActive Warframe
F9::
	SendInput {s Down}
	lSleep(50)
	SendInput {Space}
	lSleep(150)
	SendInput {Space}
	lSleep(200)
	SendInput {RButton Down}
	lSleep(100)
	SendInput {s Up}
	SendInput {w Down}
	lSleep(200)
	SendInput {t}
	lSleep(50)
	SendInput {w Up}
	lSleep(150)
	SendInput {RButton Up}
Return