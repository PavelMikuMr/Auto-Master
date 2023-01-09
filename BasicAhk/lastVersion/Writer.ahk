#NoEnv ; рекомендуется для всех скриптов
#MaxHotkeysPerInterval 99000000 ; не останавливает скрипт и выводит ненужные сообщения
#HotkeyInterval 99000000 ; тоже
#KeyHistory 0 ; отключает ненужную регистрацию ключей
#SingleInstance
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
;----------------------------GlobalSet--------------

CapsLock::
Suspend

CoordMode, ToolTip, Screen

ToolTip,% a_isSuspended?"":"Active", 950, 0
SetTimer, RemoveToolTip, 1000000
return

RemoveToolTip:
ToolTip
return

; CapsLock::
; Suspend

; ToolTip,% a_isSuspended?"Not":"Active"
; SetTimer, RemoveToolTip, -2000
; return

; RemoveToolTip:
; ToolTip
; return

i::Up
k::down
l::right
j::left
o::End
u::Home

; ^t::
; WinActivate, ahk_exe msedge.exe
; send,^t
; Return

; #IfWinActive, ahk_exe msedge.exe

; l:: Tab 
; j::+Tab

; #IfWinActive


