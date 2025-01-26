global CurrentLoopSubroutine := "LoopSoloTerry"
global SavedLoopSubroutine := ""
global SavedDetector := ""
global LastLimbDestroyedTiming := 0
global StopLoop := False

global fps := 300
global ZenithShot := 8000/fps
global EmoteOffset := 60

asdf:
Return

; ManualPPZ:
;     DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment)
;     SendInput {MButton}
;     DllCall("Kernel32\Sleep", "UInt", 530)
;     SendInput {MButton}
;     DllCall("Kernel32\Sleep", "UInt", 50)
;     Gosub, MeleeSwapIntoFrame
;     lWin32Sleep(1610, FirstPropaMoment) ;1610
;     SendInput {LButton}
;     DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
; Return

ManualPPRZ: 
    DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment) 
    SendInput {MButton}
    DllCall("Kernel32\Sleep", "UInt", 530)
    SendInput {MButton}
    lSleep(1585, FirstPropaMoment)
    SendInput {LButton Down}
    SendInput {e}
    SendInput {CtrlUp}
    DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
    lSleep(ZenithShot+EmoteOffset)
    SendInput {LButton Up}
    SendInput {Del}
Return

ManualPPRZSleep: 
    DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment) 
    SendInput {MButton}
    DllCall("Kernel32\Sleep", "UInt", 530)
    SendInput {MButton}
    lSleep(1585, FirstPropaMoment)
    SendInput {LButton}
    SendInput {e}
    lSleep(40)
    SendInput {LButton}
    lSleep(20)
    DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
Return

; ManualPPRZ: 
; 	DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment) 
; 	SendInput {MButton}
; 	DllCall("Kernel32\Sleep", "UInt", 530) ; Equivalent to Sleep 530 
; 	SendInput {MButton}
; 	lSleep(1585, FirstPropaMoment) ; Garry fps is higher since no need grab lures so 1607
; 	DllCall("QueryPerformanceCounter", "Int64*", LastPerformanceCounter)
; 	SendInput {LButton}
; 	lSaveCounterAfterSleep(15, LastPerformanceCounter)
; 	SendInput {e}
; 	lSaveCounterAfterSleep(15, LastPerformanceCounter)
; 	SendInput {Del}
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {RButton down} 
; 	lSaveCounterAfterSleep(20, LastPerformanceCounter)
; 	SendInput {LButton}
; 	DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
; 	lSaveCounterAfterSleep(15, LastPerformanceCounter)
; 	SendInput {RButton up}
; Return

;--- LOOP MACROS ---

LoopSoloTerry: 
    loop 3 {
        Gosub, ManualPPRZ
        Sleep 12000
        if (StopLoop == True) {
            StopLoop := False
            Exit
        }
        lSleep(15586, LastLimbDestroyedTiming) ; 17186 - 1610 + 1 = 15577
    }
    Gosub, ManualPPRZ
    CurrentLoopSubroutine := "LoopSoloGarry"
    CurrentDetector := "GarryDetector"
Return

LoopSoloGarry: 
    loop 4 {
        Gosub, ManualPPRZ
        Sleep 12000
        if (StopLoop == True) {
            StopLoop := False
            Exit
        }
        lSleep(15586, LastLimbDestroyedTiming) ; 17186 - 1610 - 5 = 15571 15571 , 15596
    }
    Gosub, ManualPPRZ
    CurrentLoopSubroutine := "LoopSoloHarry"
    CurrentDetector := "HarryDetector"
Return

LoopSoloHarry: 
    Gosub, ManualPPRZ
    Sleep 12000
    if (StopLoop == True) {
        StopLoop := False
        Exit
    }
    lSleep(15586, LastLimbDestroyedTiming) ; 17186 - 1610 - 5 = 15571 15571 , 15596
    loop 3 {
        Gosub, ManualPPRZ
        Sleep 12000
        if (StopLoop == True) {
            StopLoop := False
            Exit
        }
        lSleep(15586, LastLimbDestroyedTiming) ; 17186 - 1610 - 5 = 15571 15571 , 15596
    }
    Gosub, ManualPPRZ
    CurrentLoopSubroutine := "LoopSoloTerry"
    CurrentDetector := ""
Return

MeleeSwapIntoFrame:
    SendInput {e}
    DllCall("Kernel32\Sleep", "UInt", 20)
    SendInput {Del}
    DllCall("Kernel32\Sleep", "UInt", 20)
    SendInput {RButton down}
    DllCall("Kernel32\Sleep", "UInt", 5)
    SendInput {RButton up}
Return

;--- "OH NO I ZERO-ED" MACRO ---

LoopMacroedZeroed:
    if (CurrentLoopSubroutine == "LoopSoloTerry") {
        CurrentLoopSubroutine := "ManualPPRZ"
        SavedLoopSubroutine := "LoopSoloGarry"
        SavedDetector := "GarryDetector"
        StopLoop := True
    } else if (CurrentLoopSubroutine == "LoopSoloGarry") {
        CurrentLoopSubroutine := "ManualPPRZ"
        SavedLoopSubroutine := "LoopSoloHarry"
        SavedDetector := "HarryDetector"
        StopLoop := True
    } else if (CurrentLoopSubroutine == "LoopSoloHarry") {
        CurrentLoopSubroutine := "ManualPPRZ"
        SavedLoopSubroutine := "LoopSoloTerry"
        SavedDetector := ""
        StopLoop := True
    } else if (CurrentLoopSubroutine == "ManualPPRZ") {
        CurrentLoopSubroutine := SavedLoopSubroutine
        CurrentDetector := SavedDetector
    }
Return