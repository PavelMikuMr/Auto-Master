#NoEnv ; рекомендуется для всех скриптов
#MaxHotkeysPerInterval 99000000 ; не останавливает скрипт и выводит ненужные сообщения
#HotkeyInterval 99000000 ; тоже
#Persistent
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
DetectHiddenWindows, On
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
controlID 		:= 0
return
;----------------------------------Glabal Setting-------------------------------


;ReloadAllScripts
Pause::goSub, reload_allScript


reload_allScript:
winGet, running, list, ahk_class AutoHotkey  ; get running scripts  
loop % running
    {
    winGetTitle, title, % "ahk_id " running%a_index%
    script := regExReplace(title, "\s-\sAutoHotkey\s.*")
    if (script = a_lineFile)    ; skip this script
        continue

    run, % script " /restart"
    sleep 90
    }

sleep 300
reload    ; reload this script
return
;ReloadAllScripts






#IfWinActive ahk_class CabinetWClass
^t::
CoordMode, Mouse, Screen
MouseGetPos, XposA, YposA ; получение координаты мыши
XposA-=+80
YposA-=+80 ; подгонка под курсор мыши
gui, 31:destroy
Gui, 31:Color, 111111 ; 16 код цвета может быть любым-

Gui, 31:Add, Button, x2 y60 w50 h20 BackgroundTrans gExpl1, ExplrorX
Gui, 31:Add, Button, x122 y60 w50 h20 BackgroundTrans gExpl2, Name
Gui, 31:Add, Button, x62 y120 w50 h20 BackgroundTrans gExpl3, FolName
Gui, 31:Add, Button, x122 y120 w50 h20 BackgroundTrans gMenuCl, Close
Gui, 31:Add, Button, x62 y0 w50 h20BackgroundTrans gExpl4, FolPath
Gui, 31:Add, Button, x62 y60 w50 h20BackgroundTrans gExpl5, Path
Gui 31:+LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, 111111 ; - главное чтобы он совпадал вотдесь
Gui 31:-Caption
Gui, 31:Show, x%XposA% y%YposA% h176 w179, menus
Return

MenuCl:
Gui, 31:Destroy
return

Expl1:
Gui, 31:Destroy
Send,+^x
Return

Expl2:
Gui, 31:Destroy
Send,+^x
Return

Expl3:
Gui, 31:Destroy
Send,!x
Return

Expl4:
Gui, 31:Destroy
Send,!c
Return

Expl5:
Gui, 31:Destroy
Send,+^c
Return

#IfWinActive


;GroupWindow
; 1::
; GroupAdd, ExplorerGroup, ahk_class CabinetWClass
; If WinActive("ahk_exe explorer.exe")
; 	GroupActivate, ExplorerGroup, r
; else
; 	WinActivate ahk_class CabinetWClass
; return


;-------------------Explorer--------------------------------


;-------------------image--------------------------------
#IfWinActive ahk_class ApplicationFrameWindow
^t::
Send,!{enter}
Return
#IfWinActive










#IfWinActive ahk_exe Figma.exe

XButton1::SendInput {LCtrl DownTmp}
XButton1 Up::SendInput {LCtrl Up}
#IfWinActive