

global A_ScreenWidth := 1920
global A_ScreenHeight := 1080


;---------------------------------------------------------------------------
SendMouse_LeftClick() { ; send fast left mouse clicks
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x02) ; left button down
    DllCall("mouse_event", "UInt", 0x04) ; left button up
}


;---------------------------------------------------------------------------
SendMouse_RightClick() { ; send fast right mouse clicks
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x08) ; right button down
    DllCall("mouse_event", "UInt", 0x10) ; right button up
}


;---------------------------------------------------------------------------
SendMouse_MiddleClick() { ; send fast middle mouse clicks
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x20) ; middle button down
    DllCall("mouse_event", "UInt", 0x40) ; middle button up
}


;---------------------------------------------------------------------------
SendMouse_RelativeMove(x, y) { ; send fast relative mouse moves
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x01, "UInt", x, "UInt", y) ; move
}


;---------------------------------------------------------------------------
SendMouse_AbsoluteMove(x, y) { ; send fast absolute mouse moves
;---------------------------------------------------------------------------
    ; Absolute coords go from 0..65535 so we have to change to pixel coords
    ;-----------------------------------------------------------------------
    static SysX, SysY
    If (SysX = "")
        SysX := 65535//A_ScreenWidth, SysY := 65535//A_ScreenHeight
    DllCall("mouse_event", "UInt", 0x8001, "UInt", x*SysX, "UInt", y*SysY)
}


;---------------------------------------------------------------------------
SendMouse_Wheel(w) { ; send mouse wheel movement, pos=forwards neg=backwards
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x800, "UInt", 0, "UInt", 0, "UInt", w)
}