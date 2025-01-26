global CounterBeforeTwo, CounterAfterTwo, FrequencyTwo
DllCall("QueryPerformanceFrequency", "Int64*", FrequencyTwo)
global LastPerformanceCounter := 0

lSleep2(s_time, ByRef start = "defaultStart") {
    Critical, On
    if (start != "defaultStart")
        CounterBeforeTwo := start
    else
        DllCall("QueryPerformanceCounter", "Int64*", CounterBeforeTwo)    
    if (s_time > 25) {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfterTwo)
        d_time := 1000 * (CounterAfterTwo - CounterBeforeTwo) / FrequencyTwo
        Critical, Off
        Sleep % s_time - d_time - 25
    }
    Critical, On
    End := CounterBeforeTwo + ( FrequencyTwo * (s_time/1000))
    loop {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfterTwo)
    } until (End <= CounterAfterTwo)
    Critical, Off
}

lWin32Sleep2(s_time, ByRef start = "defaultStart") {
    Critical, On
    if (start != "defaultStart")
        CounterBeforeTwo := start
    else
        DllCall("QueryPerformanceCounter", "Int64*", CounterBeforeTwo)    
    if (s_time > 25) {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfterTwo)
        d_time := 1000 * (CounterAfterTwo - CounterBeforeTwo) / FrequencyTwo
        Critical, Off
        DllCall("Kernel32\Sleep", "UInt", s_time - d_time - 25)
    }
    Critical, On
    End := CounterBeforeTwo + ( FrequencyTwo * (s_time/1000))
    loop {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfterTwo)
    } until (End <= CounterAfterTwo)
    Critical, Off
}

lSaveCounterAfterTwoSleep2(s_time, ByRef start) {
    Critical, On
    CounterBeforeTwo := start    
    if (s_time > 25) {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfterTwo)
        d_time := 1000 * (CounterAfterTwo - CounterBeforeTwo) / FrequencyTwo
        Critical, Off
        Sleep % s_time - d_time - 25
    }
    Critical, On
    End := CounterBeforeTwo + ( FrequencyTwo * (s_time/1000))
    loop {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfterTwo)
    } until (End <= CounterAfterTwo)
    start := CounterAfterTwo
    Critical, Off
}
