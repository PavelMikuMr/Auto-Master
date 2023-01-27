;----------------------------------Maya--------------------------------


; Run Maya.exe
; #3::
; Run C:\Users\PavelTrud\Documents\maya\2022\Maya 2022 Py2.bat
; Return
; Run Maya.exe


#IfWinActive ahk_exe maya.exe

CapsLock::o
Return

Pause::
Send,^0
Return

#IfWinActive 


;----------------------------------Maya--------------------------------
#IfWinActive ahk_exe Adobe Substance 3D Designer.exe

~RButton::
    If (A_TimeSincePriorHotkey < 400) && (A_TimeSincePriorHotkey <> -1) {
        Send, {Space}	
    }
return


+1::
Send,{Alt}{Tab}{Tab}{Tab}{Space}{Down}{Down}{Enter}
Return

+2::
Send, {Alt}{Tab}{Tab}{Tab}{Space}{Down}{Enter}
Return

+n::
Send, {Alt}+{Right}+{Right}+{Right}+{Space}+{Down}+{Down}+{Down}+{Down}+{Down}+{Down}+{Down}+{Enter}
Return

sc00F::
Send, {LShift}+{Space}
Return


^t::
Send, {LShift}+{Space}
Return


PgDn::
Send, {Delete}
Return


z::
Send, ^z
Return

sc029::
Send, {Delete}
Return

#IfWinActive


#IfWinActive ahk_exe UnrealEditor.exe
^h::
Send, !+s
Return



PgDn::
Send, {Delete}
Return


^f10::
send, +^w
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
; Sleep,100
; Click 526 ,286
; MouseClick, left, 526, 286, 1, 0
; Sleep,100
send, 0.8
send, {enter}
send, ^{f4}
Return


^f11::
send, +^w
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
send, {Tab}
Sleep,25
; Click 526 ,286
send, 1
send, {enter}
send, ^{f4}
send, {f11}
Return

#IfWinActive
#IfWinActive ahk_exe UnrealEditor.exe

!q::
CoordMode, Mouse, Screen
MouseGetPos, XposA, YposA ; получение координаты мыши
XposA-=+80
YposA-=+80 ; подгонка под курсор мыши
gui, 50:destroy
Gui, 50:Color, 111111 ; 16 код цвета может быть любым-
Gui, 50:Add, Button, x2 y0 w50 h20 BackgroundTrans gdothis1, One
Gui, 50:Add, Button, x2 y60 w50 h20 BackgroundTrans gdothis2, Left
Gui, 50:Add, Button, x122 y60 w50 h20 BackgroundTrans gdothis3, Right
Gui, 50:Add, Button, x62 y120 w50 h20 BackgroundTrans gdothis4, Down
Gui, 50:Add, Button, x122 y120 w50 h20 BackgroundTrans gclosewanrmenu, Close
Gui, 50:Add, Button, x122 y0 w50 h20 BackgroundTrans gdothis5, 1x1
Gui, 50:Add, Button, x2 y120 w50 h20 BackgroundTrans gdothis6, Default
Gui, 50:Add, Button, x62 y0 w50 h20BackgroundTrans gdothis7, Top
Gui, 50:Add, Button, x62 y60 w50 h20BackgroundTrans gdothis8, Perspec
Gui, 50:Add, Button, x2 y30 w50 h20 BackgroundTrans gdothis9, Front
Gui, 50:Add, Button, x2 y90 w50 h20 BackgroundTrans gdothis10, Cinema
Gui, 50:Add, Button, x122 y30 w50 h20 BackgroundTrans gdothis11, Back
Gui, 50:Add, Button, x122 y90 w50 h20 BackgroundTrans gdothis12, Realtime
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
  Send , !+3
Return

dothis2:
Gui, 50:Destroy
Send , !k
Return

dothis3:
Gui, 50:Destroy
Send , !+k
Return

dothis4:
Gui, 50:Destroy
Send , !m
Return

dothis5:
Gui, 50:Destroy
Send , !+2
Return

dothis6:
Gui, 50:Destroy
Send , +!d
Return

dothis7:
Gui, 50:Destroy
Send,!j
Return

dothis8:
Gui, 50:Destroy
Send , !g
Return

dothis9:
Gui, 50:Destroy
Send , !h
Return

dothis10:
Gui, 50:Destroy
Send , +!c
Return

dothis11:
Gui, 50:Destroy
Send , !+h
Return

dothis12:
Gui, 50:Destroy
Send , ^r
Return

#IfWinActive






#IfWinActive ahk_exe UnrealEditor.exe
^#b::
Menu Profile, Add,  Messege, item20handler
Menu Profile, Add,  RHI, item21handler
Menu Profile, Add,  GPU, item22handler
Menu Profile, Add,  Memory, item23handler
Menu Profile, Add,  Streaming, item24handler
Menu Profile, Add,  UnitGraph, item25handler
Menu Profile, Add,  Unit, item26handler
Menu Profile, Add,  SceneRender, item27handler
Menu Profile, Add,  ProfileGPU, item28handler
Menu Profile, Add,  Histogramm, item29handler
Menu Profile, Add,  ConsoleCommand, item30handler
Menu Profile, Add,  Clean, item31handler
Menu Profile, Add,  TaskMeneger, item32handler
Menu Profile, Show
Return

item20handler:
Send,'
Send,DisableAllScreenMessages
Sleep,100
Send,{enter}
Return
Return

item21handler:
Send,'
Send,stat rhi
Sleep,100
Send,{enter}
Return
Return

item22handler:
Send,'
Send,stat gpu
Sleep,100
Send,{enter}
Return

item23handler:
Send,'
Send,stat memory
Sleep,100
Send,{enter}
Return

item24handler:
Send,'
Send,stat streaming
Sleep,100
Send,{enter}
Return

item25handler:
Send,'
Send,stat unitGraph
Sleep,100
Send,{enter}
Return

item26handler:
Send,'
Send,stat unit
Sleep,100
Send,{enter}
Return

item27handler:
Send,'
Send , stat scenerendering
Sleep,100
Send,{enter}
Return

item28handler:
Send,'
Send , ProfileGPU
Sleep,100
Send,{enter}
Return

item29handler:
Send,'
Send , ShowFlaf.VisualizeHDR 1
Sleep,100
Send,{enter}
Return

item30handler:
Run G:\Unreal\CONSOL_COMAND.txt
Return

item31handler:
Send,'
Send, stat none
Sleep,100
Send,{enter}
Return

item32handler:
run taskmgr.exe
Return


#IfWinActive

#IfWinActive ahk_exe Adobe Substance 3D Painter.exe

f1::
MouseGetPos, x, y
MouseClick, left, 160, 32, 1, 0
Sleep,100
send,{Down}
send,{Enter}
send,{Enter}
MouseMove, %x%, %y%
Return

#IfWinActive

#IfWinActive ahk_exe Adobe Substance 3D Painter.exe
^!p::
Menu Config, Add,  BaseColor, item100handler
Menu Config, Add,  Mask, item101handler
Menu Config, Add,  ID, item102handler
Menu Config, Add,  Roughnnes, item103handler
Menu Config, Add,  Metallic, item104handler
Menu Config, Add,  Normal, item105handler
Menu Config, Add,  AO, item106handler
Menu Config, Add,  Curvature, item107handler
Menu Config, Add,  Height, item108handler
Menu Config, Add,  Close, item109handler
Menu Config, Show
Return

item100handler:
MouseGetPos, x, y
MouseClick, left, 1533, 105, 1, 0
Sleep,100
send,{Down}
Sleep,50
send,{Enter}
MouseMove, %x%, %y%
Return

item101handler:
MouseGetPos, x, y
MouseClick, left, 1533, 105, 1, 0
Sleep,100
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Enter}
MouseMove, %x%, %y%
Return

item102handler:
MouseGetPos, x, y
MouseClick, left, 1533, 105, 1, 0
Sleep,100
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Enter}
MouseMove, %x%, %y%
Return

item103handler:
MouseGetPos, x, y
MouseClick, left, 1533, 105, 1, 0
Sleep,100
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Enter}
MouseMove, %x%, %y%
Return

item104handler:
MouseGetPos, x, y
MouseClick, left, 1533, 105, 1, 0
Sleep,100
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Enter}
MouseMove, %x%, %y%
Return

item105handler:
MouseGetPos, x, y
MouseClick, left, 1533, 105, 1, 0
Sleep,100
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Enter}
MouseMove, %x%, %y%
Return

item106handler:
MouseGetPos, x, y
MouseClick, left, 1533, 105, 1, 0
Sleep,100
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Enter}
MouseMove, %x%, %y%
Return

item107handler:
MouseGetPos, x, y
MouseClick, left, 1533, 105, 1, 0
Sleep,100
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Enter}
MouseMove, %x%, %y%
Return

item108handler:
MouseGetPos, x, y
MouseClick, left, 1533, 105, 1, 0
Sleep,100
send,{Down}
Sleep,25
send,{Down}
Sleep,25
send,{Enter}
MouseMove, %x%, %y%
Return

item109handler:
Return
#IfWinActive

#IfWinActive ahk_exe Adobe Substance 3D Painter.exe


RButton & WheelDown:: Send, c 
Return 
 RButton & WheelUp:: Send, m 
RButton::Send,^{RButton}
Return


Return

#IfWinActive


#IfWinActive ahk_exe rizomuv.exe
w::Tab
1::u
2::p

#IfWinActive


#IfWinActive ahk_class AutoHotkeyGUI
f1::
ControlClick, Button1, Google Translate, , Left, 1, X10 Y10
return

1::
ControlClick, Edit1, Google Translate, , Left, 1, X10 Y10
return
2::
ControlClick, Edit2, Google Translate, , Left, 1, X10 Y10
return

!1::
ControlClick, ComboBox1, Google Translate, , Left, 1, X10 Y10
return

!2::
ControlClick, ComboBox2, Google Translate, , Left, 1, X10 Y10
return

!space:: Click 292 , 362

#IfWinActive 

