;-------------------------- CAP FPS MACRO --------------------------

LightCap:
	DllCall("Kernel32\Sleep", "UInt", 8000) 
	SendInput {Insert} ; 15
	DllCall("Kernel32\Sleep", "UInt", 21000)
	SendInput {Home} ; Uncapped
Return