global CurrentLoopSubroutine := "LoopSoloTerry"
global SavedLoopSubroutine := ""
global SavedDetector := ""
global LastLimbDestroyedTiming := 0
global StopLoop := False

global fps := 300   
global ZenithShot := 8000/fps
global EmoteOffset := 60

global TestTime := 8000/290

asdddf:
Return

ManualPPRZ: 
    DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment) 
    SendInput {F7}
    DllCall("Kernel32\Sleep", "UInt", 530)
    SendInput {F7}
    lSleep(1585, FirstPropaMoment)
    SendInput {F5 Down}
    SendInput {e}
    DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
    lSleep(ZenithShot+EmoteOffset)
    SendInput {F5 Up}
    SendInput {Del}
Return

; PPRZTest:
;     DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment) 
;     SendInput {F7}
;     lSleep(1585, FirstPropaMoment)
;     DllCall("QueryPerformanceCounter", "Int64*", RaplakMoment) 
;     SendInput {F5 Down}{5}
;     lSleep(875, RaplakMoment)
;     SendInput {F5 Up}
;     ; Loop 3{
;     ;     ;SendInput {F5}
;     ;     lSleep(5)
;     ; }
;     ; lSleep(350)
;     ; SendInput {e}
;     ; lSleep(50)
;     ; SendInput {Del}
;     ; lSleep(50)
;     ; SendInput {Del}
;     DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
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