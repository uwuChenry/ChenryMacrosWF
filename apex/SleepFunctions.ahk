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
