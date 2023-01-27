#SingleInstance, Force
ListLines Off ; отключает ненужную регистрацию ключей
Process, Priority, , H ; вроде как должно повысить производительность. если проблемы то вырубить
SetWinDelay, 0 ; умешьшает задержки
SetMouseDelay, -1 ; умешьшает задержки
SetBatchLines, -1 ; мощная штука для производительности но может привести к ошибкам
SetDefaultMouseSpeed, 0 ; умешьшает задержки
SetControlDelay, 0 ; умешьшает задержки
SetKeyDelay, -1, -1, -1  ; умешьшает задержки
SendMode Input ; самый быстрый метод отправки из SendEvent-by default,  SendInput and SendPlay
SetTitleMatchMode 2
SetTitleMatchMode Fast

;----------------------------------Glabal Setting--------------------------------
Speed := 100 
Speedmin := 10 

Home & 1::f1
Home & 2::f2
Home & 3::f3
Home & 4::f4
Home & 5::f5
Home & 6::f6
Home & 7::f7
Home & 8::f8
Home & 9::f9
Home & 0::f10
Home & -::f11
Home & =::f12

Home & w::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", -Speed, "UInt", 0, "UPtr", 0)
Home & s::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", Speed, "UInt", 0, "UPtr", 0)
Home & a::DllCall("mouse_event", "UInt", 0x0001, "Int", -Speed, "Int", 0, "UInt", 0, "UPtr", 0)
Home & d::DllCall("mouse_event", "UInt", 0x0001, "Int", Speed, "Int", 0, "UInt", 0, "UPtr", 0)
Home & o::WheelUp
Home & l::WheelDown
Home & k::click
Home & `;::click, Right

#if GetKeyState("alt", "P")
Home & o::!WheelUp
Home & l::!WheelDown
Return

#if GetKeyState("Shift", "P")
Home & w::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", -Speedmin, "UInt", 0, "UPtr", 0)
Home & s::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", Speedmin, "UInt", 0, "UPtr", 0)
Home & a::DllCall("mouse_event", "UInt", 0x0001, "Int", -Speedmin, "Int", 0, "UInt", 0, "UPtr", 0)
Home & d::DllCall("mouse_event", "UInt", 0x0001, "Int", Speedmin, "Int", 0, "UInt", 0, "UPtr", 0)
Return


