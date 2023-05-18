#Include OverclockAHK.ahk
#include SleepFunctions.ahk

#IfWinActive Warframe
Q::
	SendInput {RButton Down}
	lSleep(90)	
	SendInput {RButton Up}
	lSleep(10)
	SendInput {e}
	lSleep(260)
	SendInput, 5
Return