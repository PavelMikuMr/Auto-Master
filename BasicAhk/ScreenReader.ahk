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

Insert:: Gosub, Alwaysontop

AlwaysonTop:
WinGet, ExStyle, ExStyle, A
if (ExStyle & 0x8) {
 Winset, Alwaysontop, Off , A
} else {
 Winset, Alwaysontop, , A
}
return




!0::
; XButton1::
Menu MyMenu, Add,Define, item1handler
Menu MyMenu, Add,Screen, item2handler
Menu MyMenu, Add,Git, item3handler
Menu MyMenu, Add,Mdn, item4handler
Menu MyMenu, Add,OnTop, item5handler

Menu, MyMenu, Add,Code, MenuHandler
Menu, MySubMenu4, Add, Pug, SubMenu4Label
Menu, MySubMenu4, Add, CodeOpen, SubMenu4Label
Menu, MySubMenu4, Add, Validate, SubMenu4Label
Menu, MyMenu, Add,Code, :MySubMenu4

Menu, MyMenu, Add,Api, MenuHandler
Menu, MySubMenu5, Add, Public API, SubMenu5Label
Menu, MySubMenu5, Add, API, SubMenu5Label
Menu, MyMenu, Add, Api, :MySubMenu5

Menu, MyMenu, Add, Color, MenuHandler
Menu, MySubMenu2, Add, Pick, SubMenu2Label
Menu, MySubMenu2, Add, Match Color, SubMenu2Label
Menu, MySubMenu2, Add, Picture, SubMenu2Label
Menu, MySubMenu2, Add, Gradient, SubMenu2Label
Menu, MySubMenu2, Add, Gradient UI, SubMenu2Label
Menu, MyMenu, Add, Color, :MySubMenu2


Menu, MyMenu, Add, English, MenuHandler
Menu, MySubMenu1, Add, ToCatch, SubMenu1Label
Menu, MySubMenu1, Add, Collins, SubMenu1Label
Menu, MySubMenu1, Add, Oxford, SubMenu1Label
Menu, MySubMenu1, Add, Quizlet, SubMenu1Label
Menu, MySubMenu1, Add, Youglish, SubMenu1Label
Menu, MySubMenu1, Add, Life, SubMenu1Label
Menu, MyMenu, Add, English, :MySubMenu1

Menu, MyMenu, Add, English Base, MenuHandler
Menu, MySubMenu3, Add, ReggularVerb, SubMenu3Label
Menu, MySubMenu3, Add, IreggularVerb, SubMenu3Label
Menu, MySubMenu3, Add, Statement, SubMenu3Label
Menu, MySubMenu3, Add, In.On.At, SubMenu3Label
Menu, MyMenu, Add, English Base, :MySubMenu3




Menu MyMenu, Add,InsepctSearch, item6handler
Menu MyMenu, Add,Reload, item7handler
Menu MyMenu, Add,Close, item8handler

Menu MyMenu, Show
Return

item1handler:
; OldClipboard:= Clipboard
; Clipboard:= ""
; Send, ^c
; ClipWait
; CoordMode, Mouse , Screen
; run chrome.exe
; sleep,200
; IfWinActive, ahk_exe chrome.exe
; MouseGetPos, xpos, ypos
; PosX:=xpos/1.3
; PosY:=ypos/3
; WinMove, ahk_exe chrome.exe ,, %xpos%,%PosY% , 640, 700
; sleep 100
; Run https://www.collinsdictionary.com/dictionary/english/%Clipboard%


OldClipboard:= Clipboard
Clipboard:= ""
Send, ^c
ClipWait
run chrome.exe
sleep,200
Run https://www.collinsdictionary.com/dictionary/english/%Clipboard%
sleep,100
WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
Return



item2handler:
Send,^{PrintScreen}
; Send,^+p
Return


item3handler:
OldClipboard:= Clipboard
Clipboard:= ""
Send, ^c
ClipWait
Run chrome.exe
sleep,100
Run https://github.com/PavelMikuMr
WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
sleep,100
Return


item4handler:
OldClipboard:= Clipboard
Clipboard:= ""
Send, ^c
ClipWait
Run chrome.exe
sleep,100
Run https://developer.mozilla.org/ru/search?q=%Clipboard%
WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
sleep,100
Return




item5handler:
; Clipboard:=""
; SendInput, ^c
; ClipWait, 1 
; if !ErrorLevel
;      Run, explore %clipboard%
Gosub, Alwaysontop
Return

item6handler:
    send,^c
    WinActivate, DevTools
    send,^1
    sleep , 100
    send,^f
    sleep , 50
    send,^v
    send, {enter}
Return

item7handler:
send,^r
Return

item8handler:
Return


MenuHandler:
return

SubMenu1Label:
If (A_ThisMenuItemPos = 1) {
	send,^{f8}
} else if (A_ThisMenuItemPos = 2) {
	Run C:\Users\pavel\GitHub\Soft\Collins\Collins
}else if (A_ThisMenuItemPos = 3) {
	Run C:\Users\pavel\GitHub\Soft\Collins\Oxford
}
else if (A_ThisMenuItemPos = 4) {
	Run C:\Users\pavel\GitHub\Soft\Quizlet\Quizlet
}
else if (A_ThisMenuItemPos = 5) {
	Run C:\Users\pavel\GitHub\Soft\Youglish\Youglish
}
else if (A_ThisMenuItemPos = 6) {
	Run C:\Users\pavel\GitHub\LIbrary\English\Life\Life.cs
}

return

SubMenu2Label:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\Soft\picker\jcpicker_32bit.exe
} else if (A_ThisMenuItemPos = 2) {
	Run C:\Users\pavel\GitHub\Soft\MatchColor\MatchColor
}
else if (A_ThisMenuItemPos = 3) {
	Run C:\Users\pavel\Documents\ShareX\Screenshots\2022-12
}
else if (A_ThisMenuItemPos = 4) {
    run chrome.exe
    sleep,200
	Run https://uigradients.com/#GradeGrey
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
}
else if (A_ThisMenuItemPos = 5) {
    run chrome.exe
    sleep,200
	Run https://cssgradient.io/gradient-backgrounds
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
}
return

SubMenu3Label:
If (A_ThisMenuItemPos = 1) {
	Run, C:\Users\pavel\GitHub\LIbrary\English\Verb\Regular.pdf
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\English\Verb\IRRegular.pdf
}
else if (A_ThisMenuItemPos = 3) {
	Run C:\Users\pavel\GitHub\LIbrary\English\Statement\Table.png
}
else if (A_ThisMenuItemPos = 4) {
	Run C:\Users\pavel\GitHub\LIbrary\English\In.On.At\InOnAt.jpg
}
return


SubMenu4Label:
If (A_ThisMenuItemPos = 1) {
	run chrome.exe
    sleep,200
	Run https://html2jade.org/
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
} else if (A_ThisMenuItemPos = 2) {
	run chrome.exe
    sleep,200
	Run https://codepen.io/PavelMikuMr/pen/MWXNeQM
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
}
else if (A_ThisMenuItemPos = 3) {
	run chrome.exe
    sleep,200
	Run https://validator.w3.org/#validate_by_input
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
}
return

SubMenu5Label:
If (A_ThisMenuItemPos = 1) {
	run chrome.exe
    sleep,200
	Run https://github.com/public-apis/public-apis
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
}
else if (A_ThisMenuItemPos = 2) {
	run chrome.exe
    sleep,200
	Run https://validator.w3.org/#validate_by_input
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
}
return

Return

; item10handler:
; if (KeyPressCountSelActor > 0) ;if key press count is greater than zero because you have run this hotkey just before
; {
; 	KeyPressCountSelActor += 1 ;add a count to existing key press count
; } else {
; 	KeyPressCountSelActor := 1 ;otherwise this is your first time running the hotkey so set press count to one
; }

; SetTimer, KeyPressMonitorSelActor, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

; return

; KeyPressMonitorSelActor:
; if (KeyPressCountSelActor = 1) ; The key was pressed only once
; {
; OldClipboard:= Clipboard
; Clipboard:= ""
; Send, ^c ;copies selected text
; ClipWait
; Run http://www.google.com/search?q=%Clipboard%
; Sleep 200
; Clipboard:= OldClipboard


; }
; else if (KeyPressCountSelActor = 2) ; The key was pressed twice
; {
; Run C:\Program Files\Everything\Everything

; }

; KeyPressCountSelActor := 0 ;reset the count to zero
; SetTimer, KeyPressMonitorSelActor, Off ;turn label off to stop monitoring for key strokes
; tooltip, ;turn tooltip off
; send,^c
; sleep,50
; Run https://developer.mozilla.org/ru/search?q=%Clipboard%
; Return







#IfWinActive ahk_exe chrome.exe

~MButton:: ;hotkey - You can also use mouse clicks such as ~LButton
if (KeyPressCountWireFrame > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountWireFrame += 1 ;add a count to existing key press count
} else {
	KeyPressCountWireFrame := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorWireFrame, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorWireFrame:
if (KeyPressCountWireFrame = 2) ; The key was pressed twice
{

	Send,^+c
    
}

KeyPressCountWireFrame := 0 ;reset the count to zero
SetTimer, KeyPressMonitorWireFrame, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive


#IfWinActive ahk_exe jcpicker_32bit.exe
XButton1::!x
Return