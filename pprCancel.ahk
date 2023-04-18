#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to asist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#Persistent
#InstallKeybdHook
#InstallMouseHook
#KeyHistory 0
ListLines Off
SetBatchLines -1
SetKeyDelay, -1, -1
SetMouseDelay, -1, -1
SetControlDelay -1
SetWinDelay -1
#MaxHotkeysPerInterval 100000
Process, Priority,, High



global CounterBefore, CounterAfter, Frequency
DllCall("QueryPerformanceFrequency", "Int64*", Frequency)
global LastPerformanceCounter := 0

lSleep(s_time, ByRef start = "defaultStart") {
    Critical, On
    if (start != "defaultStart")
        CounterBefore := start
    else
        DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)    
    if (s_time > 25) {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
        d_time := 1000 * (CounterAfter - CounterBefore) / Frequency
        Critical, Off
        Sleep % s_time - d_time - 25
    }
    Critical, On
    End := CounterBefore + ( Frequency * (s_time/1000))
    loop {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
    } until (End <= CounterAfter)
    Critical, Off
}

lWin32Sleep(s_time, ByRef start = "defaultStart") {
    Critical, On
    if (start != "defaultStart")
        CounterBefore := start
    else
        DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)    
    if (s_time > 25) {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
        d_time := 1000 * (CounterAfter - CounterBefore) / Frequency
        Critical, Off
        DllCall("Kernel32\Sleep", "UInt", s_time - d_time - 25)
    }
    Critical, On
    End := CounterBefore + ( Frequency * (s_time/1000))
    loop {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
    } until (End <= CounterAfter)
    Critical, Off
}

lSaveCounterAfterSleep(s_time, ByRef start) {
    Critical, On
    CounterBefore := start    
    if (s_time > 25) {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
        d_time := 1000 * (CounterAfter - CounterBefore) / Frequency
        Critical, Off
        Sleep % s_time - d_time - 25
    }
    Critical, On
    End := CounterBefore + ( Frequency * (s_time/1000))
    loop {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
    } until (End <= CounterAfter)
    start := CounterAfter
    Critical, Off
}





#IfWinActive Warframe
XButton1::
	;DllCall("Kernel32\Sleep", "UInt", 80)
	DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment) 
	SendInput {MButton}
	DllCall("Kernel32\Sleep", "UInt", 530) ; Equivalent to Sleep 530 
	SendInput {MButton}
	;lSleep(1610, FirstPropaMoment) ; Garry fps is higher since no need grab lures so 1607
	lSleep(1585, FirstPropaMoment)
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	SendInput {LButton}
	lSaveCounterAfterSleep(15, LastPerformanceCounter)
	SendInput {e}
	lSaveCounterAfterSleep(15, LastPerformanceCounter)
	SendInput {Del}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {RButton down} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {LButton}
	DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
	lSaveCounterAfterSleep(15, LastPerformanceCounter)
	SendInput {RButton up}
return

#IfWinActive Warframe
^XButton1::
	;DllCall("Kernel32\Sleep", "UInt", 80)
	DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment) 
	SendInput {MButton}
	DllCall("Kernel32\Sleep", "UInt", 530) ; Equivalent to Sleep 530 
	SendInput {MButton}
	;lSleep(1610, FirstPropaMoment) ; Garry fps is higher since no need grab lures so 1607
	lSleep(1600, FirstPropaMoment)
	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
	SendInput {LButton}
	lSaveCounterAfterSleep(15, LastPerformanceCounter)
	SendInput {e}
	lSaveCounterAfterSleep(15, LastPerformanceCounter)
	SendInput {Del}
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {RButton down} 
	lSaveCounterAfterSleep(20, LastPerformanceCounter)
	SendInput {LButton}
	DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
	lSaveCounterAfterSleep(15, LastPerformanceCounter)
	SendInput {RButton up}
return


#IfWinActive Warframe
!^XButton1::
	DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment)
	SendInput {MButton}
	DllCall("Kernel32\Sleep", "UInt", 530)
	SendInput {MButton}
	DllCall("Kernel32\Sleep", "UInt", 50)
	Gosub, MeleeSwapIntoWarframeWithVigSwapAndAniCancel
	lWin32Sleep(1615, FirstPropaMoment) 
	SendInput {LButton}
	DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
	SendInput {RButton up}
return

#IfWinActive Warframe
!XButton1::
	DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment)
	SendInput {MButton}
	DllCall("Kernel32\Sleep", "UInt", 530)
	SendInput {MButton}
	DllCall("Kernel32\Sleep", "UInt", 50)
	Gosub, MeleeSwapIntoWarframeWithVigSwapAndAniCancel
	lWin32Sleep(1615, FirstPropaMoment) 
	SendInput {LButton}
	DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
	SendInput {RButton up}
return


MeleeSwapIntoWarframeWithVigSwapAndAniCancel:
	SendInput {5}
	;DllCall("Kernel32\Sleep", "UInt", 30)
	;SendInput {Del}
	;DllCall("Kernel32\Sleep", "UInt", 30)
	;SendInput {RButton down}
Return


