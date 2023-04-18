global CurrentLoopSubroutine := "LoopSoloTerry"
global SavedLoopSubroutine := ""
global SavedDetector := ""
global LimbsLeft := 4
global LastLimbDestroyedTiming := 0
global StopLoop := False
; global PreviousManualSubroutine := ""
; global TimeToSleep := 0
; global ManualSubroutine := ""
; global ListOfSubroutinesGoTo := ["ManualPPZ", "ManualPPZ", "ManualPPZ", "ManualPPZ"]

;-------------------------- LIMB MACROS --------------------------

global fps := 300
global ZenithShot := 8000/fps
global EmoteOffset := 60


;--- MANUAL MACROS ---


#IfWinActive Warframe
Q::
	SendInput {RButton Down}
	lSleep(80)	
	SendInput {RButton Up}
	lSleep(10)
	SendInput {e}
	lSleep(230)
	SendInput, 5
	; lSleep(150)
	; SendInput {Ctrl Down}
Return

; ManualPR:
; 	SendInput {MButton}
; 	lSleep(1585)
; 	SendInput {LButton}
; 	DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
; Return

; ManualPZ:
; 	DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment)
; 	SendInput {MButton}
; 	DllCall("Kernel32\Sleep", "UInt", 50)
; 	Gosub, MeleeSwapIntoWarframeWithVigSwapAndAniCancel
; 	lWin32Sleep(1610, FirstPropaMoment) ;1610
; 	SendInput {LButton}
; 	DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
; 	SendInput {RButton up}
; Return

ManualPPZ:
	DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment)
	SendInput {MButton}
	DllCall("Kernel32\Sleep", "UInt", 530)
	SendInput {MButton}
	DllCall("Kernel32\Sleep", "UInt", 50)
	Gosub, MeleeSwapIntoWarframeWithVigSwapAndAniCancel
	lWin32Sleep(1610, FirstPropaMoment) ;1610
	SendInput {LButton}
	DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
Return


ManualPPRZ: 
	DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment) 
	SendInput {MButton}
	DllCall("Kernel32\Sleep", "UInt", 530)
	SendInput {MButton}
	lSleep(1585, FirstPropaMoment)
	SendInput {LButton Down}
	SendInput {e}
	lSleep(ZenithShot+EmoteOffset)
	SendInput {LButton Up}
	SendInput {Del}
	DllCall("QueryPerformanceCounter", "Int64*", LastLimbDestroyedTiming) 
Return

; ManualPPRZ: 
; 	DllCall("QueryPerformanceCounter", "Int64*", FirstPropaMoment) 
; 	SendInput {MButton}
; 	DllCall("Kernel32\Sleep", "UInt", 530) ; Equivalent to Sleep 530 
; 	SendInput {MButton}
; 	lSleep(1585, FirstPropaMoment) ; Garry fps is higher since no need grab lures so 1607
; 	DllCall("QueryPerformanceCounter"e "Int64*", LastPerformanceCounter)
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
		Gosub, ManualPPZ
		Sleep 12000
		if (StopLoop == True) {
			StopLoop := False
			Exit
		}
		lSleep(15579, LastLimbDestroyedTiming) ; 17186 - 1610 + 1 = 15577
	}
	Gosub, ManualPPZ
	CurrentLoopSubroutine := "LoopSoloGarry"
	CurrentDetector := "GarryDetector"
Return


LoopSoloGarry: ; PPRZ -> PPRZ -> VS -> PPRZ -> VS 
	loop 4 {
		Gosub, ManualPPRZ
		Sleep 12000
		if (StopLoop == True) {
			StopLoop := False
			Exit
		}
		lSleep(15696, LastLimbDestroyedTiming) ; 17186 - 1610 - 5 = 15571 15571 , 15596
	}
	Gosub, ManualPPRZ
	CurrentLoopSubroutine := "LoopSoloHarry"
	CurrentDetector := "HarryDetector"
Return



LoopSoloHarry: ; LAST GASP -> LAST GASP -> VS -> LAST GASP -> VS
	loop 4 {
		Gosub, ManualPPRZ
		Sleep 12000
		if (StopLoop == True) {
			StopLoop := False
			Exit
		}
		lSleep(15696, LastLimbDestroyedTiming) ; 17186 - 1610 - 5 = 15571 15571 , 15596
	}
	Gosub, ManualPPRZ
	CurrentLoopSubroutine := "LoopSoloTerry"
	CurrentDetector := ""
Return

;-- SWAP MACROS ---

MeleeSwapIntoWarframe:
	SendInput {e}
Return

MeleeSwapIntoWarframeWithVigSwapAndAniCancel:
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