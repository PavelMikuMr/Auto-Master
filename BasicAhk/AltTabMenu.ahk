#NoEnv ; рекомендуется для всех скриптов
#MaxHotkeysPerInterval 99000000 ; не останавливает скрипт и выводит ненужные сообщения
#HotkeyInterval 99000000 ; тоже
#KeyHistory 0 ; отключает ненужную регистрацию ключей
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

Alt::
If WinActive("ahk_group AltTabWindow") {
  j::ShiftAltTab
  l::AltTab
  
}
Return



#w::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", -Speed, "UInt", 0, "UPtr", 0)
#s::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", Speed, "UInt", 0, "UPtr", 0)
#a::DllCall("mouse_event", "UInt", 0x0001, "Int", -Speed, "Int", 0, "UInt", 0, "UPtr", 0)
#d::DllCall("mouse_event", "UInt", 0x0001, "Int", Speed, "Int", 0, "UInt", 0, "UPtr", 0)

#+w::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", -Speedmin, "UInt", 0, "UPtr", 0)
#+s::DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", Speedmin, "UInt", 0, "UPtr", 0)
#+a::DllCall("mouse_event", "UInt", 0x0001, "Int", -Speedmin, "Int", 0, "UInt", 0, "UPtr", 0)
#+d::DllCall("mouse_event", "UInt", 0x0001, "Int", Speedmin, "Int", 0, "UInt", 0, "UPtr", 0)

#q::click