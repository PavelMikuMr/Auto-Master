
f1::
loop
{ 
send,e
sleep 500
}
f2::
reload
return
;еееее отправка множества символов на запрос клавиши ф1 с интервалом и ф2 остановка 

;---------------------------
f3::
Send Hello
KeyWait f3
Send World
Return
; задержка между отправкой комманд 
;------------------------------

f8::
loop{
GetKeyState, state, f8
if (state = "D")
{
Send {f9 down}
}
Else
{
Send {f9 up}
break
}}
Msgbox, f9 up and loop broken
Return
; f8 держишь нажатой - начинается цикл, при удержании клавиши ф8-нажимается постоянно
; ф9 - отпустил -ф9 отпускается и появляется сообщение.
;------------------------

Send {d down}
send {w down}
sleep 2000
Send {d up}
Send {w up}
; 
Run, calc.exe
WinWait, Calculator
WinMove, 0, 0 ; Use the window found by WinWait.



CenterWindow("ahk_class Notepad")

CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
}

F2::
WinMove, Notepad, , 500, 100 
Return

F3::
WinMove, Notepad, , 500, 100 , 300, 300 
Return

F4::
WinMove, Notepad,, (A_ScreenWidth/2), (A_ScreenHeight/2)
Return

F5::
MouseGetPos, mx, my
msgbox, %mx% , %my%
WinMove, MyEditgui, , ,  , %mx%, %my%
Return
;координаты мыши 

;GuiControl, Move, MyEditgui, x10 y20 w200 h100

F3::
WinMinimize,, Hello my friend,
Return

F4::
WinMaximize , Notepad
Return

F5::
WinMaximize ,, Hello my friend
Return

F6::
WinClose, Notepad
Return
; манипуляция окнами





SetTitleMatchMode, 2
; ------google search------
f1::
clipboard=
send ^c
If clipboard =
 {
 Return
 }
Run,  http://www.google.com/search?q=%clipboard%
Return
; поиск по f
-k---addadkkkk------f

9 & 0::
msgbox, You pressed both 9 and 0
Return 
; двойной щелчок

f1::
 run, calc.exe
sleep 300
send +{tab}
sleep 300
send {space}
WinClose A
return
; сочетание   
