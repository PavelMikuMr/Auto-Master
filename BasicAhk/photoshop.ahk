
#NoEnv ; рекомендуется для всех скриптов
#MaxHotkeysPerInterval 99000000 ; не останавливает скрипт и выводит ненужные сообщения
#HotkeyInterval 99000000 ; тоже
#KeyHistory 0 ; отключает ненужную регистрацию ключей
#SingleInstance, Forse ; замена скрипта новым . что то типо перезагрузки.
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
CoordMode, Mouse, Screen
;----------------------------------Glabal Setting--------------------------------

;----------------------------------Basic GUI--------------------------------


#IfWinActive ahk_exe Figma.exe

XButton1::SendInput {LCtrl DownTmp}
XButton1 Up::SendInput {LCtrl Up}
#IfWinActive



#IfWinActive ahk_class Photoshop

~XButton1 & WheelDown::s


~XButton1 & WheelUp::w

#IfWinActive 


#IfWinActive ahk_exe Photoshop.exe

#^b::
Menu PhotoTools, Add, Size, item1heimdal
Menu PhotoTools, Add, Canvase, item2heimdal
Menu PhotoTools, Add, Desaturate, item3heimdal
Menu PhotoTools, Add, GlobalLevels, item4heimdal
Menu PhotoTools, Add, GlobalCurves, item5heimdal
Menu PhotoTools, Add, Solid, item6heimdal
Menu PhotoTools, Add, Fill, item7heimdal
Menu PhotoTools, Add, Export, item8heimdal
Menu PhotoTools, Show
Return

item1heimdal:
Send,!^i
Return

item2heimdal:
Send,!^c
Return

item3heimdal:
Send,{f2}
Return

item4heimdal:
Send,^l
Return

item5heimdal:
Send,^m
Return

item6heimdal:
Send,{LShift}+{F8}
Return

item7heimdal:
Send,{LShift}+{F5}
Return

item8heimdal:
Send,^s
Return

#IfWinActive




#IfWinActive ahk_exe Photoshop.exe
^!t::
CoordMode, Mouse, Screen
MouseGetPos, XposA, YposA ; получение координаты мыши
XposA-=+80
YposA-=+80 ; подгонка под курсор мыши
gui, 34:destroy
Gui, 34:Color, 111111 ; 16 код цвета может быть любым-

Gui, 34:Add, Button, x2 y60 w50 h20 BackgroundTrans gFlip1, Horisont
Gui, 34:Add, Button, x122 y60 w50 h20 BackgroundTrans gFlip2, Vertical
Gui, 34:Add, Button, x62 y120 w50 h20 BackgroundTrans gFlip3, 90
Gui, 34:Add, Button, x122 y120 w50 h20 BackgroundTrans gMenuCl, Close
Gui, 34:Add, Button, x62 y0 w50 h20BackgroundTrans gFlip4, 180
Gui, 34:Add, Button, x62 y60 w50 h20BackgroundTrans gFlip5, free
Gui 34:+LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, 111111 ; - главное чтобы он совпадал вотдесь
Gui 34:-Caption
Gui, 34:Show, x%XposA% y%YposA% h176 w179, menus
Return

MenuCl:
Gui, 34:Destroy
return

Flip1:
Gui, 34:Destroy
Send,+^e
Return

Flip2:
Gui, 34:Destroy
Send,+^u
Return

Flip3:
Gui, 34:Destroy
Send,+^!g
Return

Flip4:
Gui, 34:Destroy
Send,+^!d
Return

Flip5:
Gui, 34:Destroy
msgbox free Button
Return

#IfWinActive










#IfWinActive ahk_exe Photoshop.exe


^t::
CoordMode, Mouse, Screen
MouseGetPos, XposA, YposA ; получение координаты мыши
XposA-=+80
YposA-=+80 ; подгонка под курсор мыши
gui, 87:destroy
Gui, 87:Color, 111111 ; 16 код цвета может быть любым-
Gui, 87:Add, Button, x2 y0 w50 h20 BackgroundTrans gTools1, Eraiser
Gui, 87:Add, Button, x2 y60 w50 h20 BackgroundTrans gTools2, Req
Gui, 87:Add, Button, x122 y60 w50 h20 BackgroundTrans gTools3, Brush
Gui, 87:Add, Button, x62 y120 w50 h20 BackgroundTrans gTools4, Gradi
Gui, 87:Add, Button, x122 y120 w50 h20 BackgroundTrans gclmenu, Close
Gui, 87:Add, Button, x122 y0 w50 h20 BackgroundTrans gTools5, Text
Gui, 87:Add, Button, x2 y120 w50 h20 BackgroundTrans gTools6, Pero
Gui, 87:Add, Button, x62 y0 w50 h20 BackgroundTrans gTools7, Color
Gui, 87:Add, Button, x62 y60 w50 h20 BackgroundTrans gTools8, Drago
Gui, 87:Add, Button, x92 y30 w50 h20 BackgroundTrans gTools9, Smooth
Gui, 87:Add, Button, x92 y90 w50 h20 BackgroundTrans gTools10, Lasso
Gui, 87:Add, Button, x32 y30 w50 h20 BackgroundTrans gTools11, Crop
Gui, 87:Add, Button, x32 y90 w50 h20 BackgroundTrans gTools12, Freeform
Gui 87:+LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, 111111 ; - главное чтобы он совпадал вотдесь
Gui 87:-Caption
Gui, 87:Show, x%XposA% y%YposA% h176 w179, menus
Return

clmenu:
Gui, 87:Destroy
return

Tools1:
Gui, 87:Destroy
Send,e
Return

Tools2:
Gui, 87:Destroy
Send,m
Return

Tools3:
Gui, 87:Destroy
Send,b
Return

Tools4:
Gui, 87:Destroy
Send,g
Return

Tools5:
Gui, 87:Destroy
Send,t
Return

Tools6:
Gui, 87:Destroy
Send,v
Return

Tools7:
Gui, 87:Destroy
Send,{f8}
Return

Tools8:
Gui, 87:Destroy
Send,d
Return

Tools9:
Gui, 87:Destroy
Send,r
Return

Tools10:
Gui, 87:Destroy
Send,c
Return

Tools11:
Gui, 87:Destroy
Send,l
Return

Tools12:
Gui, 87:Destroy
Send,+^t
Return



#IfWinActive

;----------------------------------Basic GUI--------------------------------





#IfWinActive ahk_exe Photoshop.exe


^!f5::
MouseClick, right,,, 1
Return

RButton::LButton


~MButton::space

Insert::RButton 

!+y::
Send, a
Return

~Pause::
Send,+^m
Return



!f::
Send, {LShift}+{F5}
Return
!a::
Send, {LShift}+{F8}
Return
!h::
Send, {LShift}+{F7}
Return
!d::
Send, {F6}
Return
!q::
Send,{]}
Return
!s::
Send,{LShift}+{F9}
Return
+a::
Send,{LShift}+{F3}
Return
+s::
Send,{LShift}+{F4}
Return
!2::
Send,![
Return
!3::
Send,!]
Return
f2::
Send,{LShift}+{F10}
Return
+b::
Send,{F9}
Return
+c::
Send,{F8}
Return

!w::
Send,a
Return

!c::
Send,'
Return

+z::
Send,m
Return



!g::
Send, {LShift}+{F6}
Return
#c::
Run, {f}
return



~z::
Send, ^z
Return 


^!p::
Send, {enter}
Return


F12::Suspend
Return 

!RButton::LButton

~CapsLock::LControl
Return


^f6::
CoordMode, Mouse, Screen
MouseGetPos, XposA, YposA ; получение координаты мыши
XposA-=+80
YposA-=+80 ; подгонка под курсор мыши
gui, 50:destroy
Gui, 50:Color, 111111 ; 16 код цвета может быть любым-
Gui, 50:Add, Button, x2 y0 w50 h20 BackgroundTrans gdothis1, Levels
Gui, 50:Add, Button, x2 y60 w50 h20 BackgroundTrans gdothis2, Curves
Gui, 50:Add, Button, x122 y60 w50 h20 BackgroundTrans gdothis3, Export
Gui, 50:Add, Button, x62 y120 w50 h20 BackgroundTrans gdothis4, Hue|Sat
Gui, 50:Add, Button, x122 y120 w50 h20 BackgroundTrans gclosewanrmenu, Close
Gui, 50:Add, Button, x2 y120 w50 h20 BackgroundTrans gdothis6, GradMap
Gui, 50:Add, Button, x62 y0 w50 h20BackgroundTrans gdothis7, Range
Gui, 50:Add, Button, x62 y60 w50 h20BackgroundTrans gdothis8, NewLev
Gui, 50:Add, Button, x2 y90 w50 h20 BackgroundTrans gdothis10, Sroke
Gui, 50:Add, Button, x122 y30 w50 h20 BackgroundTrans gdothis11, Fill
Gui, 50:Add, Button, x122 y90 w50 h20 BackgroundTrans gdothis12, Invert
Gui, 50:Add, Button, x2 y30 w50 h20 BackgroundTrans gdothis13, Balance
Gui, 50:Add, Button, x122 y0 w50 h20 BackgroundTrans gdothis14, Solid
Gui 50:+LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, 111111 ; - главное чтобы он совпадал вотдесь
Gui 50:-Caption
Gui, 50:Show, x%XposA% y%YposA% h176 w179, menus
Return

closewanrmenu:
Gui, 50:Destroy
return

dothis1:
Gui, 50:Destroy
  send, {LShift}+{F3}
Return

dothis2:
Gui, 50:Destroy
send, {LShift}+{F4}
Return

dothis3:
Gui, 50:Destroy
Send,^+p
Return

dothis4:
Gui, 50:Destroy
Send, {LShift}+{F7}
Return

dothis6:
Gui, 50:Destroy
Send,{LShift}+{F6}
Return

dothis7:
Gui, 50:Destroy
Send, {LShift}+{F9}
Return

dothis8:
Gui, 50:Destroy
Send,^+l
Return

dothis9:
Gui, 50:Destroy
Send,{LControl}+{F3}
Return

dothis10:
Gui, 50:Destroy
Send,+^v
Return

dothis11:
Gui, 50:Destroy
Send,{LShift}+{F5}
Return

dothis12:
Gui, 50:Destroy
Send,^i
Return

dothis13:
Gui, 50:Destroy
send,{F6}
Return

dothis14:
Gui, 50:Destroy
Send,{LShift}+{F8}
Return

^f11::Suspend

#IfWinActive



#IfWinActive ahk_exe Adobe Substance 3D Painter.exe
SetWinDelay, -1


!^f5::
CoordMode, Mouse, Screen
MouseGetPos, XposA, YposA ; получение координаты мыши
XposA-=+80
YposA-=+80 ; подгонка под курсор мыши
gui, 66:destroy
Gui, 66:Color, 111111 ; 16 код цвета может быть любым-
Gui, 66:Add, Button, x2 y0 w50 h20 BackgroundTrans  gdoother1, mFill
Gui, 66:Add, Button, x2 y60 w50 h20 BackgroundTrans  gdoother2, WhiteM
Gui, 66:Add, Button, x122 y60 w50 h20 BackgroundTrans gdoother3, BlackM
Gui, 66:Add, Button, x62 y120 w50 h20 BackgroundTrans gdoother4, NPaint
Gui, 66:Add, Button, x122 y120 w50 h20 BackgroundTran gcloseName, Close
Gui, 66:Add, Button, x122 y0 w50 h20 BackgroundTrans gdoother5, mPaint
Gui, 66:Add, Button, x2 y120 w50 h20 BackgroundTrans gdoother6, Anchor
Gui, 66:Add, Button, x62 y0 w50 h20BackgroundTrans  gdoother7, NewFill
Gui, 66:Add, Button, x62 y60 w50 h20BackgroundTrans gdoother8, Layer
Gui, 66:Add, Button, x2 y30 w50 h20 BackgroundTrans gdoother9, Levels
Gui, 66:Add, Button, x2 y90 w50 h20 BackgroundTrans  gdoother10, ColorS
Gui, 66:Add, Button, x122 y30 w50 h20 BackgroundTrans gdoother11,Generat
Gui, 66:Add, Button, x122 y90 w50 h20 BackgroundTrans gdoother12, Filter
Gui, 66:Add, Button, x62 y30 w50 h20BackgroundTrans gdoother13, library
Gui, 66:Add, Button, x62 y90 w50 h20BackgroundTrans gdoother14, Strike
Gui 66:+LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, 111111 ; - главное чтобы он совпадал вотдесь
Gui 66:-Caption
Gui, 66:Show, x%XposA% y%YposA% h176 w179, menus
Return

closeName:
Gui, 66:Destroy
return

doother1:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1696, 95, 1, 0
Sleep,100
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return

doother2:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1724, 96, 1, 0
Sleep,100
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return

doother3:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1724, 96, 1, 0
Sleep,100
Send,{Down}
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return

doother4:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left,1753, 94, 1, 0
MouseMove, %x%, %y%
Return

doother5:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1696, 95, 1, 0
Sleep,100
Send,{Down}
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return

doother6:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1696, 95, 1, 0
Sleep,100
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return

doother7:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left,1780, 97, 1, 0
MouseMove, %x%, %y%
Return

doother8:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left,1780, 97, 1, 0
Sleep,100
MouseClick, left, 1724, 96, 1, 0
Sleep,100
Send,{Down}
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return

doother9:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1696, 95, 1, 0
Sleep,100
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return

doother10:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1696, 95, 1, 0
Sleep,100
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return

doother11:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1696, 95, 1, 0
Sleep,100
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return

doother12:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1696, 95, 1, 0
Sleep,100
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Down}
Send,{Enter}
MouseMove, %x%, %y%
Return


doother13:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 160, 32, 1, 0
Sleep,100
send,{Down}
send,{Enter}
send,{Enter}
MouseMove, %x%, %y%
Return

doother14:
Gui, 66:Destroy
MouseGetPos, x, y
MouseClick, left, 1865, 95, 1, 0
MouseMove, %x%, %y%
Return

#IfWinActive


#IfWinActive ahk_exe Adobe Substance 3D Painter.exe
^!t::
Menu Config, Add,  Export, item111handler
Menu Config, Add,  Bake, item112handler
Menu Config, Add,  Reload, item113handler
Menu Config, Add,  Close, item114handler
Menu Config, Show
Return

item111handler:
send,+!e
Return

item112handler:
send,+!q
Return

item113handler:
MouseGetPos, x, y
MouseClick, left, 58, 32, 1, 0
Sleep,100
send,{Down}
send,{Down}
send,{Down}
send,{Enter}
MouseMove, %x%, %y%
Return

item114handler:
Return
#IfWinActive


