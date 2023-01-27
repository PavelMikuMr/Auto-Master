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
#NoTrayIcon
;----------------------------------Glabal Setting--------------------------------
; Alt Key Mapping






global LevelFive
; ________

global Google

; ________
LevelFive = false

; ________

Google = false

; _______

EnableLevelFive()
{
    LevelFive = true
}

DisableLevelFive()
{
    LevelFive = false  
}

; ----------------------

EnableGoogle()
{
    Google = true
}

DisableGoogle()
{
    Google = false  
}

; ----------------------

IsLevelFive()
{
    return %LevelFive% = true
}

IsGoogle()
{
    return %Google% = true
}



*RAlt::
	if WinActive("ahk_exe chrome.exe")
		EnableGoogle()
    else if WinActive("ahk_exe brave.exe")
		EnableGoogle()    
	else
    	EnableLevelFive()

return

*RAlt up::
    DisableLevelFive()
	DisableGoogle()
return


#If IsLevelFive()


    ; arrow keys

    a::return
    s::return
    f::return

    j::
    If GetKeyState("s","P"){

        send {ctrl down}{shift down}{left}{shift up}{ctrl up}
    }
    else if GetKeyState("a","P"){

        send {ctrl down}{left}{ctrl up}
    }
    else if GetKeyState("f","P"){

        send {left}{left}{left}{left}
    }
    else{
        send {left}
    }
    
    return

   
    l::
    If GetKeyState("s","P"){
        send {ctrl down}{shift down}{Right}{shift up}{ctrl up}
    }
    else if GetKeyState("a","P"){
        send {ctrl down}{Right}{ctrl up}
    }
    else if GetKeyState("f","P"){
        send {right}{right}{right}{right}
    }
    else{
        send {Right}
    }
    return

    i::
    If GetKeyState("f","P"){
        send {Up}{Up}{Up}{Up}
    }
    else if GetKeyState("s","P"){
        send {shift down}{Up}{shift up}
    }
    else{
        send {Up}
    }
    return

    k::
    If GetKeyState("f","P"){
        send {Down}{Down}{Down}{Down}
    }
    else if GetKeyState("s","P"){
        send {shift down}{Down}{shift up}
    }
    else{
        send {Down}
    }
    return

    +j::send {LShift down}{left}{LShift up}
    return
    +l::send {LShift down}{Right}{LShift up}
    return


   !j::!+g
   return
   !l::!+y
   return
   ^!i::send {LControl down}{LAlt down}{Up}{LControl up}{LAlt up}
   return
   ^!k::send {LControl down}{LAlt down}{Down}{LControl up}{LAlt up}
   return
   !i::send {LAlt down}{Up}{LAlt up}
   return
   !k::send {LAlt down}{Down}{LAlt up}
   return
   !+i::send {LShift down}{LAlt down}{Up}{LAlt up}{LShift Up}
   return
   !+k::send {LShift down}{LAlt down}{Down}{LAlt up}{LShift Up}
   return

   +i::send {LShift down}{Up}{LShift up}
   return
   +k::send {LShift down}{Down}{LShift up}
   return

   +^i::+^home
   return
   +^k::+^end
   return

   !e::
   send,^d
   send,^c 
   send, {end}{Shift down}{home}{LShift Up}{BackSpace}
   send,^v
   return

   Tab::SendInput, {End}{Enter}
   return
 

    ^k::
    send,^+a
    send,^+a
    send,^+a
    send,^+a
    return

    ^i::
    send,{LShift down}
    send,{Up}
    send,{Up}
    send,{Up}
    send,{Up}
    send,{Home}
    send,{LShift up}
    return



    z::
    send,#v
    return 


    
    !d::
    send,{CtrlDown}{Left}{CtrlUp}{LShift down}{home}{LShift up}{BackSpace}{CtrlDown}{Right}{CtrlUp}{LShift down}{end}{LShift up}{BackSpace}
    return  

    !o::
    send,{LShift down}{end}{LShift up}{BackSpace}
    return 
    !u::
    send,{LShift down}{home}{LShift up}{BackSpace}
    return 
    
    c::
    send,^c
    return

    ]::
    send,^+]
    return
    [::
    send,^+[
    return
    
  
    
    9::
    Send,{Left}
    send,{LShift Down}
    Send,{Right}
    Send,{Right}
    send,{LShift Up}
    send,{BackSpace}
    return


    n::SendInput,{LAlt down}b{LAlt up}
    return

    b::
    Send,{Home}
    send,{LShift down}
    send,{End}
    send,{LShift up}
    send, ^c 
    send,{Escape}
    return 

    

    w::SendInput, {LCtrl down}d{LCtrl up}{BackSpace}
    return

    t::
    SendInput, {LCtrl down}d{LCtrl up}{BackSpace}
    send,{LCtrl down}v{LCtrl up}
    return


    
    m::
    send, {PgUp}
    return
    !m::
    send,^+m
    send,^+m
    send,^+m
    return


    ,::
    send, {PgDn}
    return
    e::Delete

    return
    q::BackSpace
    return
    ; home & end
    u::
    If GetKeyState("s","P"){
        send {shift down}{home}{shift up}
    }
    else{
        send,{home}
    }
    return

    o::
    If GetKeyState("s","P"){
        send {shift down}{end}{shift up}
    }
    else{
        send,{end}
    }
    return

    +o::send {LShift down}{end}{LShift up}
    return
    +u::send {LShift down}{home}{LShift up}
    return

    ^n::^!n
    ^m::^!m
    ^r::^!r
    ^d::^!d

    \::AppsKey
    `::`   
    return
    

    

    h::SendInput ,{LShift down}{f12}{LShift up}
    return 

    g::SendInput,{LControl down}{f12}{LControl up}
    ; Send,{LCtrl down}
    ; Send, {LShift down}
    ; Send,{Left}
    ; Send,{LShift up}
    ; Send,{LCtrl up}
    ; Send,^c
    ; Send,{esc}
    return

    d::
    send,^d 
    return

    x::
    send ^x
    return

    r::
    send,^d
    send,^c
    send, {Esc}
    return

    '::
    send,^'
    return
    v::
    send,^v
    return

    

    

    !f::
    send,+^f
    return

    !s::
    send,^s
    return

 
    .::
    send,^f
    return

    BackSpace::
    send,{LControl Down}{space}{LControl up}
    return

    
    space::^space
    return
    



    #i::
    send !+^w
    return
    #l::

    send !+^b
    return

    #.::
    send ^b
    return

    #k::
    send  !+^v
    return

    #j::
    send !+^a
    return




    


    +f::
    send,{sc029}   
    return

    ^f::
    send,~
    return

    
    +p::
    send,{`%}
    return
    +r::
    send,{=}
    return

    +w::
    send,{&}
    return

    



    +q::
    send,{#}
    return

    +s::
    send,!t
    return

    +e::
    send,{+}
    return

    +d::
    send,{-}
    return

    +v::
    send,{^}
    return

    +g::
    send,{*}
    return

    2::
    send,{f2}
    return

    0::
    send,^0
    return
    4::
    send,!4
    return

    1::+!3
    return


    3::+!4
    send,{LAlt}{f8}
    return



    Esc::
    send,{delete}
    return
    Enter::
    send,{Escape}
    return


    
          
#If


#If IsGoogle()
0::
send,^0
return


q::^+a
t::^t
r::^r
; d::^h
i::Up
k::Down
j::Left
l::Right
!l::send,{LControl down}{PgDn}{LControl up}
!j::send,{LControl down}{PgUp}{LControl up}
m::PgUp
,::PgDn
v::^v
c::^c



d::
send,{LControl down}{Right}{LControl up}
send,{LControl down}{LShift down}{Left}{LControl up}{LShift up}
return

!r::
send,{LControl down}{Right}{LControl up}
send,{LControl down}{LShift down}{Left}{LControl up}{LShift up}
send,^c
send,{right}
return

w::
send,{LControl down}{Right}{LControl up}
send,{LControl down}{LShift down}{Left}{LControl up}{LShift up}
send,{BackSpace}
return






    a::return
    s::return
    f::return

    j::
    If GetKeyState("s","P"){

        send {ctrl down}{shift down}{left}{shift up}{ctrl up}
    }
    else if GetKeyState("a","P"){

        send {ctrl down}{left}{ctrl up}
    }
    else if GetKeyState("f","P"){

        send {left}{left}{left}{left}
    }
    else{
        send {left}
    }
    
    return

   
    l::
    If GetKeyState("s","P"){
        send {ctrl down}{shift down}{Right}{shift up}{ctrl up}
    }
    else if GetKeyState("a","P"){
        send {ctrl down}{Right}{ctrl up}
    }
    else if GetKeyState("f","P"){
        send {right}{right}{right}{right}
    }
    else{
        send {Right}
    }
    return

    i::
    If GetKeyState("f","P"){
        send {Up}{Up}{Up}{Up}
    }
    else if GetKeyState("s","P"){
        send {shift down}{Up}{shift up}
    }
    else{
        send {Up}
    }
    return

    k::
    If GetKeyState("f","P"){
        send {Down}{Down}{Down}{Down}
    }
    else if GetKeyState("s","P"){
        send {shift down}{Down}{shift up}
    }
    else{
        send {Down}
    }
    return

    +j::send {LShift down}{left}{LShift up}
    return
    +l::send {LShift down}{Right}{LShift up}
    return


    
        ; home & end
    u::
    If GetKeyState("s","P"){
        send {shift down}{home}{shift up}
    }
    else{
        send,{home}
    }
    return

    o::
    If GetKeyState("s","P"){
        send {shift down}{end}{shift up}
    }
    else{
        send,{end}
    }
    return

    +o::send {LShift down}{end}{LShift up}
   return
   +u::send {LShift down}{home}{LShift up}
   return


    +f::
    send,{sc029}   
    return

    ^f::
    send,~
    return
    


    +r::
    send,{=}
    return


    q::
    send,{f7}
    return





    Enter::
    send,{Escape}
    return
#If









; ----------------------------
global SelectionTab

SelectionTab = false


EnableSelectionTab()
{
    SelectionTab = true
}

DisableSelectionTab()
{
    SelectionTab = false  
}

IsSelectionTab()
{
    return %SelectionTab% = true
}

*RShift::
    EnableSelectionTab()
return

*RShift up::
    DisableSelectionTab()
return


#If IsSelectionTab()
    r::
    GroupAdd, VscodeGroup, ahk_exe Code.exe
    If WinActive("ahk_exe Code.exe")
	GroupActivate, VscodeGroup, r
    else
	WinActivate ahk_exe Code.exe
    return

	; ExplorerGroup
    i::
    GroupAdd, NotepadGroup, ahk_class Notepad++
    If WinActive("ahk_exe notepad++.exe")
	GroupActivate, NotepadGroup, r
    else
	WinActivate ahk_class Notepad++
    return

	;Shell Group 
    ; x::
    ; GroupAdd, ShellGroup, ahk_exe WindowsTerminal.exe
    ; If WinActive("ahk_exe WindowsTerminal.exe")
	; GroupActivate, ShellGroup, r
    ; else
	; WinActivate ahk_exe WindowsTerminal.exe
    ; return
    x::
    send,!+v
    return

    ; Resize the window
    f::
    WinGet, active_id, ID, A
    WinGet, checkmax, MinMax, A
    If(checkmax == 1) {
	    WinGet, active_id, ID, A
	    WinRestore, ahk_id %active_id%
    } else {
	    WinGetClass, class, ahk_id %active_id%
	    If class not in ahk_class WorkerW,Shell_TrayWnd, Button, SysListView32,Progman,#32768 ;Creates exclusion for Wndows
	    WinMaximize, ahk_id %active_id%
    }   
    return
    
    v::
    WinGet, active_id, ID, A
    WinGetClass, class, ahk_id %active_id%
    If class not in ahk_class WorkerW,Shell_TrayWnd,Button, SysListView32, Progman,#32768 ; Creates exclusion for Wndows
    WinMinimize, ahk_id %active_id%
    return

    Esc::!+t

    Tab::
    Send,{LShift Down}{Tab}{LShift Up}
    return

; !change!
    z::
    CoordMode, Mouse , Screen
    run chrome.exe
    IfWinActive, ahk_exe chrome.exe
    MouseGetPos, xpos, ypos
    PosX:=xpos/1.3
    PosY:=ypos/3
    WinMove, ahk_exe chrome.exe ,, 10,386
    sleep 100
    return


    
    q::SendInput, {LCtrl down}{LShift down}{Left}{LShift up}{LCtrl up}{BackSpace}
    return
    e::SendInput, {LCtrl down}{LShift down}{Right}{LShift up}{LCtrl up}{BackSpace}
    return

    space::^b
    return

    \::
    send,~
    return

    n::
    send,#3
    return


    2::
    send,{f2}
    send,{end}
    send,{ShiftDown}{home}{ShiftUp}
    Send, ^c
    send,{escape}
    return
    s::
    send,^s
    return

    w::^w
    return

    f5::
    WinGetActiveTitle, Title
    String = %Title%
    Clipboard =%Title%
    Return

    c::
    WinActivate, DevTools
    send,^1
    return

    a::
    send,^c
    WinActivate, DevTools
    send,^1
    sleep , 100
    send,^f
    sleep , 50
    send,^v
    send, {enter}
    return

  


    d::
    WinActivate, Google
    return

    4::
    send,!{f4}
    return
    g::
    send,!g
    return

    ; l::
    ; ; !change!
    ; OldClipboard:= Clipboard
    ; Clipboard:= ""
    ; Send, ^c ;copies selected text
    ; ClipWait
    ; Run chrome.exe
    ; sleep,100
	; WinMove, ahk_exe chrome.exe ,, 10,370
    ; Run http://www.google.com/search?q=%Clipboard%
    ; Return

    t::^!f
    return



    o::
    ControlSend, , {Right}, ahk_class MozillaWindowClass
    ControlSend, , {Right}, ahk_class MediaPlayerClassicW
    return 
    k::
    ControlSend, , {Left}, ahk_class MozillaWindowClass
    ControlSend, , {Left}, ahk_class MediaPlayerClassicW
    return 
    
    +d::
    WinActivate, ahk_exe Code.exe
    WinMove, ahk_exe chrome.exe,, 1383,0, 536, 1079
    WinActivate, ahk_exe chrome.exe
    return
    +s::
    WinActivate, ahk_exe Code.exe
    WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
    WinActivate, ahk_exe chrome.exe
    return
    +w::
    WinMove, ahk_exe Code.exe ,, 4,1, 1375, 1079
    return
#If



;-  toggle ` > russian or english-US
$Esc::
V++
M:=mod(V,2)
if M=1
   SetDefaultKeyboard(0x0419) ; Russian
else
   SetDefaultKeyboard(0x0409) ; english-US
return

SetDefaultKeyboard(LocaleID){
	Global
	SPI_SETDEFAULTINPUTLANG := 0x005A
	SPIF_SENDWININICHANGE := 2
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(Lan%LocaleID%, 4, 0)
	NumPut(LocaleID, Lan%LocaleID%)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
	WinGet, windows, List
	Loop %windows% {
		PostMessage 0x50, 0, %Lan%, , % "ahk_id " windows%A_Index%
	}
}
return




 
#l::right
#j::left
#i::up
#k::down


#Esc::
send,{Delete}
return


#m::return
#,::return





CapsLock:: 
Send,^z 
return

+space::
send,{Media_Play_Pause}
ControlSend, , {space}, ahk_class MediaPlayerClassicW
return 





; search in networt
#f::
if (KeyPressCountSelActor > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountSelActor += 1 ;add a count to existing key press count
} else {
	KeyPressCountSelActor := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorSelActor, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorSelActor:
if (KeyPressCountSelActor = 1) ; The key was pressed only once
{
OldClipboard:= Clipboard
Clipboard:= ""
Send, ^c ;copies selected text
ClipWait
Run http://www.google.com/search?q=%Clipboard%
Sleep 200
Clipboard:= OldClipboard


}
else if (KeyPressCountSelActor = 2) ; The key was pressed twice
{
Run C:\Program Files\Everything\Everything

}

KeyPressCountSelActor := 0 ;reset the count to zero
SetTimer, KeyPressMonitorSelActor, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return

; search in networt




+Pause::
send,#b
send,{right}
send,{enter}
return



;AltTabMenu
XButton2::AltTabMenu
WheelDown::AltTab
WheelUp::ShiftAltTab
;AltTabMenu



; Snipedtool
+ScrollLock::
WinClose, Snipping Tool
WinWaitClose, Snipping Tool
Run, SnippingTool.exe
WinWait, ahk_exe SnippingTool.exe
Sleep 200
ControlSend, , !{n}, ahk_class Microsoft-Windows-SnipperToolbar
; Snipedtool

;~ If !A_IsAdmin
 ;~ Run *RunAs "%A_ScriptFullPath%"

Insert:: Gosub, Alwaysontop

AlwaysonTop:
WinGet, ExStyle, ExStyle, A
if (ExStyle & 0x8) {
 Winset, Alwaysontop, Off , A
} else {
 Winset, Alwaysontop, , A
}
return





!Escape::
send,{Esc}
return
 



; ShareX
^+p::
Send,^{PrintScreen}
Return
; ShareX

;Calc
#c::
Run Calc.exe
return
;Calc

#n::
run notepad.exe
return

#IfWinActive ahk_exe Photoshop.exe

; MButton::h

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
if (KeyPressCountWireFrame = 1) ; The key was pressed only once
{
	Send, h
}
else if (KeyPressCountWireFrame = 2) ; The key was pressed twice
{

	Send, v
    
}
else if (KeyPressCountWireFrame = 3) ; The key was pressed twice
{

	Send, ^d
    
}
KeyPressCountWireFrame := 0 ;reset the count to zero
SetTimer, KeyPressMonitorWireFrame, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return

!f::
send,{LShift down}{f5}{LShift up}
Return
XButton1::LControl
\::Enter
#IfWinActive


#IfWinActive ahk_exe Photoshop.exe
^c::
Menu MyMenu, Add, Copy, item1handler
Menu MyMenu, Add,Select, item2handler
Menu MyMenu, Add, Brush, item3handler
Menu MyMenu, Add,Trasform, item4handler
Menu MyMenu, Add,Shape, item5handler
Menu MyMenu, Add,Text, item6handler
Menu MyMenu, Add,Crop, item7handler
Menu MyMenu, Add,Pero, item8handler
Menu MyMenu, Add,New Layer, item9handler
Menu MyMenu, Add,Delete , item10handler
Menu MyMenu, Add,Save , item11handler
Menu MyMenu, Add,Close, item12handler
Menu MyMenu, Show
Return

item1handler:
Send, ^{j} ; 
Return
item2handler:
Send,m
Return
item3handler:
Send,b
Return
item4handler:
Send,^t
Return
item5handler:
Send,u
Return
item6handler:
Send,t
Return
item7handler:
Send,c
Return
item8handler:
Send,p
Return

item10handler:
Send,{Delete}
Return

item9handler:
Send,^!+n
Return
item11handler:
Send,!^s
Return
#IfWinActive
item12handler:
Return
#IfWinActive
;Terminal
>^Esc::
Run wt.exe
return
;Terminal


+!o::
list := ["time","year","people","way","day","man","woman","life","child","girl","salary","state","family","student","man","country","problem","hand","part","world","place","case","week","company","system","program","program","work","government","number","night","point","home","change","water","room","area","mother","story","fact","person","party","month","lot","right","study","book","eye","job","word","business","age","side","kind","head","house","service","friend","father","power","hour","game","line","end","member","law","car","name","team","minute","idea","kid","body","information","back","parent","face","office","level","door","person","teacher","education"]
Random, Ran, 1, % List.MaxIndex()
send % List[Ran]
return

; +!u::
; color := ["black","silver","white","maroon","red","man","purple","fuchsia","olive","","yellow","blue","aqua","teal","aliceblue","aqua","azure","beige","blue","brown","coral","cornsilk","cyan","darkkhaki","darkolivegreen","darkred","darkslategray","deeppink","dimgray","forestgreen","gold","lime","green","grey","indigo","lawngreen","lightcyan","lightgray","lightsalmon","linen","mediumorchid","mistyrose","olivedrab","palevioletred","pink","royalblue","seashell","snow","thistle","whitesmoke","yellow","skyblue"]
; Random, Ran, 1, % color.MaxIndex()
; send % color[Ran]
; return


+!n::
nameList := ["James","John","Robert ","Michael","William","David","Richard","Charles","Joseph","Thomas","Christopher","Daniel","Paul","Mark","Donald","Kenneth","George","Steven","Edward","Brian","Ronald","Anthony","Kevin","Jason","Matthew","Danny","Timothy","Jose","Larry","Jeffrey","Frank","Scott","Eric","Stephen","Andrew","Raymond","Gregory","Joshua","Jerry","Dennis","Walter","Patrick","Patrick","Harold","Herold","Henry","Carl","Ryan","Joe","Albert","Jack","Terry"]
Random, Ran, 1, % nameList.MaxIndex()
send % nameList[Ran]
return


+!u::
color := ["🆕","⭕","❌","🌈","❤️","🌔","🍃","⛔","♨️","⤵️","〽️","⛈️","⚪","🩱","🧛‍♂️","🪘","☹️","🧳","🩰","🌄","😁","😈","😎","🖕","😻","🙂","😼","😙","😙","🌐","🀄","🔼","0️⃣","1️⃣","2️⃣","3️⃣","4️⃣","5️⃣","7️⃣","8️⃣","9️⃣","🅰️","🧲","🪀","⚱️","🍿","🌏","🌠","🍊","🍖","🎆","🌠"]
Random, Ran, 1, % color.MaxIndex()
send % color[Ran]
return







#IfWinActive ahk_exe Figma.exe

XButton1::SendInput {LCtrl DownTmp}
XButton1 Up::SendInput {LCtrl Up}
#IfWinActive


#IfWinActive Figma - Google Chrome

XButton1::SendInput {LCtrl DownTmp}
XButton1 Up::SendInput {LCtrl Up}
#IfWinActive











