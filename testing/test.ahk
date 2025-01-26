#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
#noenv
setbatchlines,-1
settitlematchmode,1

#include ShinsImageScanClass.ahk

scan := new ShinsImageScanClass() ;no title supplied so using desktop instead

RemoveToolTip(){
    ToolTip
    Return
}

CenteredToolTip(text, duration = 999){ ; Duration in ms (MilliSeconds). Default value can be optionally overridden
    ToolTip, %text%, A_ScreenWidth/2, A_ScreenHeight/2
    SetTimer, RemoveToolTip, -%duration% ; Negative to only trigger once
    Return
}

F4::
    ;MsgBox, test1
    ;CenteredToolTip("test")
    CoordMode, Pixel, Screen
	loop{
    if(scan.Image("test9.6.png", 30, x, y)){
        ;MsgBox, pog
		sleep 200
        DllCall("mouse_event", "UInt", 0x01, "UInt", (x-955)*1.5375, "UInt", (y-536)*1.5375)
        ;CenteredToolTip(x)
        ;Sleep, 1000
		break
    }}
    ;352529
    ;PixelSearch, PX, PY, 8, 470, 80, 520, 0xCEB27D, 10, Fast RGB; goog detect mid garry
    ;PixelSearch, PX, PY, 1150, 400, 1250, 420, 0xFFFEE0, 10, Fast RGB; goog detect cr garry
    ;PixelSearch, PX, PY, 1215, 240, 1265, 250, 0xFFDF76, 10, Fast RGB; goog v2 detect cr garry
    ;pixelSearch, PX, PY, 1010, 600, 1040, 640, 0xCA4538, 14, Fast RGB ; Detect if shard has appeared
    ;pixelSearch, PX, PY, 1080, 860, 1120, 900, 0xC6EAFF, 14, Fast RGB ; Detect if shard has appeared particles
    ;PixelSearch, PX, PY, 900, 500, 1000, 530, 0xFDFDFD, 1, Fast RGB; goog Find CL white crit number

    ;CenteredToolTip(y)
    ;1040 860 ;0xCFEEFF
Return

^1:: 
    MsgBox, test1
    loop{
    if(scan.PixelRegion(0x53C97C, 860, 440, 200, 200, 0, x, y)){
    ;if(scan.PixelRegion(0x3C292C, 1184, 440, 60, 30, 20, x, y)){
        MsgBox, pog
		sleep 200
        DllCall("SetCursorPos", "int", x, "int", y)
        ;DllCall("mouse_event", "UInt", 0x01, "UInt", (x-955)*1.5375, "UInt", (y-536)*1.5375)
        ;CenteredToolTip(x)
        ;Sleep, 1000
		break
    }}
            MsgBox, pog
Return

; ^2::
    ; MsgBox, test2
    ; CoordMode, Pixel, Screen
    ; Loop, {
    ;     ImageSearch, PX, PY, 0, 0, 1920, 1080, *50 1.png
    ; } until (ErrorLevel == 0)
    ; MsgBox, pog
    ; DllCall("SetCursorPos", "int", PX, "int", PY)
    ; CenteredToolTip(PX)
    ; Sleep, 1000
    ; CenteredToolTip(PY)

^4::
    MsgBox, reload
    Reload
Return
