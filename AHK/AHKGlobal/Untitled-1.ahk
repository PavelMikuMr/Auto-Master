#SingleInstance,Force

;OPTIMIZATIONS START
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
DllCall("ntdll\ZwSetTimerResolution","Int",5000,"Int",1,"Int*",MyCurrentTimerResolution) ;setting the Windows Timer Resolution to 0.5ms, THIS IS A GLOBAL CHANGE
;OPTIMIZATIONS END
BenchmarkLoopCount := 1000
DllCall("QueryPerformanceFrequency", "Int64*", Frequency)
StartTime := A_TickCount
DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)


;BENCHMARK START
Loop,%BenchmarkLoopCount%
{
	SendInput {Pause} ;run the script 3 times by switching SendEvent to SendInput and SendPlay to benchmark the 3 different Send methods
}
;BENCHMARK END


DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
ElapsedTime := A_TickCount - StartTime
MsgBox % "Loops:`n" BenchmarkLoopCount "`n`n" "TickCount:`n" ElapsedTime " ms`n`n" "QueryPerformanceCounter:`n" . (CounterAfter - CounterBefore)*1000/Frequency . " ms"

