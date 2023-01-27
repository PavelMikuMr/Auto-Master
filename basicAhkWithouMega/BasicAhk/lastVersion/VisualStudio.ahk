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

;----------------------------------Glabal Setting--------------------------------






#IfWinActive ahk_exe devenv.exe

Menu, VScde, Add, Class.Object.Metods, MainMenuStudio

Menu, Three Menu, Add, Metods, MainMenuStudio
Menu, Three Menu, Add, Class, MainMenuStudio
Menu, Three Menu, Add, ValueRefType, MainMenuStudio
Menu, Three Menu, Add, Dynamic, MainMenuStudio
Menu, Three Menu, Add, Convert, MainMenuStudio

Menu, AMetodsThree Menu, Add, Concept, MainMenuStudio1
Menu, AMetodsThree Menu, Add, freese, MainMenuStudio1
Menu, AMetodsThree Menu, Add, freeks, MainMenuStudio1

Menu, Three Menu, Add, Metods, :AMetodsThree Menu

Menu, Class Three Menu, Add, ClassPrClass 1, MainMenuStudio2
Menu, Class Three Menu, Add, ClassPrClass 2, MainMenuStudio2
Menu, Class Three Menu, Add, ClassPrClass 3, MainMenuStudio2

Menu, Three Menu, Add, Class, :Class Three Menu

Menu, ValueRefType Three Menu, Add, Ref. Value. Stack. Heap, MainMenuStudio3
Menu, ValueRefType Three Menu, Add, Null Ref Out, MainMenuStudio3
Menu, ValueRefType Three Menu, Add, In Param, MainMenuStudio3

Menu, Three Menu, Add, ValueRefType, :ValueRefType Three Menu

Menu, Dynamic Three Menu, Add, DynamicPrint 1, MainMenuStudio4
Menu, Dynamic Three Menu, Add, DynamicPrint 2, MainMenuStudio4
Menu, Dynamic Three Menu, Add, DynamicPrint 3, MainMenuStudio4

Menu, Three Menu, Add, Dynamic, :Dynamic Three Menu

Menu, Convert Three Menu, Add, ConvertPrint 1, MainMenuStudio5
Menu, Convert Three Menu, Add, ConvertPrint 2, MainMenuStudio5
Menu, Convert Three Menu, Add, ConvertPrint 3, MainMenuStudio5

Menu, Three Menu, Add, Convert, :Convert Three Menu

Menu, VScde, Add, Class.Object.Metods, :Three Menu
;-------------------------------------------------------

Menu, VScde, Add, Logic Operators, MainMenuLabel
Menu, VScde, Add, If|else|TernarnOp, MainMenuLabel

Menu, VScde, Add, Array , MenuHandler
Menu, MySubMenu3, Add, BaseArray, SubMenu3Label
Menu, MySubMenu3, Add, LoopArray, SubMenu3Label
Menu, MySubMenu3, Add, Array2D+Foreach, SubMenu3Label
Menu, MySubMenu3, Add, SharpArray, SubMenu3Label
Menu, MySubMenu3, Add, Array3D, SubMenu3Label
Menu, MySubMenu3, Add, Basic Metods, SubMenu3Label
Menu, VScde, Add, Array , :MySubMenu3

Menu, VScde, Add, Recursia, MainMenuLabel
Menu, VScde, Add, free5, MainMenuLabel
Menu, VScde, Add, frees6, MainMenuLabel
Menu, VScde, Add, freeel7, MainMenuLabel


Menu, VScde, Add, C#cookie, MenuHandler
Menu, MySubMenu4, Add, StopWath, SubMenu4Label
Menu, MySubMenu4, Add, Frees, SubMenu4Label
Menu, VScde, Add, C#cookie, :MySubMenu4



Menu, VScde, Add, Consol, MainMenuLabel

Menu, VScde, Add, Loop Operators, MenuHandler
Menu, MySubMenu1, Add, While, SubMenu1Label
Menu, MySubMenu1, Add, DoWhile, SubMenu1Label
Menu, MySubMenu1, Add, For, SubMenu1Label
Menu, MySubMenu1, Add, NestedLoop, SubMenu1Label
Menu, VScde, Add, Loop Operators, :MySubMenu1

Menu, VScde, Add, LogicOperators, MenuHandler
Menu, MySubMenu2, Add, Swith, SubMenu2Label
Menu, MySubMenu2, Add, BasicLogic&, SubMenu2Label
Menu, VScde, Add, LogicOperators, :MySubMenu2

;-------------------------------------------------

Menu, VScde, Add, DataType, MainMenuVisual

Menu, Two Menu, Add, String, MainMenuVisual
Menu, Two Menu, Add, Int, MainMenuVisual
Menu, Two Menu, Add, Double, MainMenuVisual
Menu, Two Menu, Add, Dynamic, MainMenuVisual
Menu, Two Menu, Add, Convert, MainMenuVisual

Menu, AStringTwo Menu, Add, DataType, MainMenuVisual1
Menu, AStringTwo Menu, Add, RoadVerPaint 2, MainMenuVisual1
Menu, AStringTwo Menu, Add, HousePrint 3, MainMenuVisual1

Menu, Two Menu, Add, String, :AStringTwo Menu

Menu, Int Two Menu, Add, IntPrint 1, MainMenuVisual2
Menu, Int Two Menu, Add, IntPrint 2, MainMenuVisual2
Menu, Int Two Menu, Add, IntPrint 3, MainMenuVisual2

Menu, Two Menu, Add, Int, :Int Two Menu

Menu, Double Two Menu, Add, DoublePrint 1, MainMenuVisual3
Menu, Double Two Menu, Add, DoublePrint 2, MainMenuVisual3
Menu, Double Two Menu, Add, DoublePrint 3, MainMenuVisual3

Menu, Two Menu, Add, Double, :Double Two Menu

Menu, Dynamic Two Menu, Add, DynamicPrint 1, MainMenuVisual4
Menu, Dynamic Two Menu, Add, DynamicPrint 2, MainMenuVisual4
Menu, Dynamic Two Menu, Add, DynamicPrint 3, MainMenuVisual4

Menu, Two Menu, Add, Dynamic, :Dynamic Two Menu

Menu, Convert Two Menu, Add, ConvertPrint 1, MainMenuVisual5
Menu, Convert Two Menu, Add, ConvertPrint 2, MainMenuVisual5
Menu, Convert Two Menu, Add, ConvertPrint 3, MainMenuVisual5

Menu, Two Menu, Add, Convert, :Convert Two Menu

Menu, VScde, Add, DataType, :Two Menu



Menu, VScde, Add, Close, MainMenu2Label

return

^!p::
Menu, VScde, Show
return


MainMenuLabel:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\VisualStudio\BasicPart\String.Operatros.Metods\String.Operatros.Metods.png
} else if (A_ThisMenuItemPos = 2) {
	Run E:\GlobalLibrary\VisualStudio\BasicPart\LogicOperators\LogicOperators.png
	
}else if (A_ThisMenuItemPos = 3) {
	Run E:\GlobalLibrary\VisualStudio\LogicOperators\Ifelse.cs
}else if (A_ThisMenuItemPos = 4) {
	 Run E:\GlobalLibrary\VisualStudio\Array\Array.cs
}else if (A_ThisMenuItemPos = 5) {
	 Run E:\GlobalLibrary\VisualStudio\Other\Recursia\Recursia.cs
}else if (A_ThisMenuItemPos = 6) {
	 Run E:\GlobalLibrary\ShaderLibrary\Afina\TriPlanarMaterial\TRIPLANAR.png
}else if (A_ThisMenuItemPos = 7) {
	 Run E:\GlobalLibrary\ShaderLibrary\Afina\TriPlanarMaterial\Radius.png
}else if (A_ThisMenuItemPos = 8) {
	 Run E:\GlobalLibrary\ShaderLibrary\Other\ChanellPacking\AdvanceWorkChannel.png
}else if (A_ThisMenuItemPos = 9) {
	 Run E:\GlobalLibrary\VisualStudio\Other\Console\Console.cs
}else if (A_ThisMenuItemPos = 10) {
	 Run E:\GlobalLibrary\VisualStudio\Other\Console\Console.cs
}
return


MenuHandler:
return

SubMenu1Label:
If (A_ThisMenuItemPos = 1) {
	Run, E:\GlobalLibrary\VisualStudio\Loop\While\Whilel.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, E:\GlobalLibrary\VisualStudio\Loop\DoWhile\DoWhile.cs
}else if (A_ThisMenuItemPos = 3) {
	Run, E:\GlobalLibrary\VisualStudio\Loop\For\For.cs
}else if (A_ThisMenuItemPos = 4) {
	Run, E:\GlobalLibrary\VisualStudio\Loop\InsertLoop\Nestedloop.cpp
}
return

SubMenu2Label:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\VisualStudio\LogicOperators\Switch.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, E:\GlobalLibrary\VisualStudio\LogicOperators\&.cs
}
return

SubMenu3Label:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\VisualStudio\Array\Array.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, E:\GlobalLibrary\VisualStudio\Array\ArrayLoop.cs
}
else if (A_ThisMenuItemPos = 3) {
	Run, E:\GlobalLibrary\VisualStudio\Array\Array2D.cs
}
else if (A_ThisMenuItemPos = 4) {
	Run, E:\GlobalLibrary\VisualStudio\Array\SharpArray.cs
}
else if (A_ThisMenuItemPos = 5) {
	Run, E:\GlobalLibrary\VisualStudio\Array\Array3D.cs
}
else if (A_ThisMenuItemPos = 6) {
	Run, E:\GlobalLibrary\VisualStudio\Array\ArrayMetods.cs
}
return


SubMenu4Label:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\VisualStudio\Other\С#Cokie\С#Cokie.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, E:\GlobalLibrary\VisualStudio\LogicOperators\&.cs
}
return

;---------------------------------------

MainMenuStudio1:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\VisualStudio\Class.Object.Metods\ConceptOfMetods.cs
} else if (A_ThisMenuItemPos = 2) {
	Run E:\GlobalLibrary\ShaderLibrary\AutumnHouse\BlueCode\Road\BP_RoadSpline-UserConstructionScript.png
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuStudio2:
If (A_ThisMenuItemPos = 1) {
	MsgBox, you press button 1
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuStudio3:
If (A_ThisMenuItemPos = 1) {
	Run	E:\GlobalLibrary\VisualStudio\Class.Object.Metods\Ref.Value.Stack\Ref.Value.Stack.cs
} else if (A_ThisMenuItemPos = 2) {
	Run E:\GlobalLibrary\VisualStudio\Class.Object.Metods\Ref.Value.Stack\Null.cs
} else if (A_ThisMenuItemPos = 3) {
	Run E:\GlobalLibrary\VisualStudio\Class.Object.Metods\Ref.Value.Stack\InParam.cs
}
return

MainMenuStudio4:
If (A_ThisMenuItemPos = 1) {
	MsgBox, you press button 1
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuStudio5:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\VisualStudio\DataType\Convert.cs
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuStudio:
return
;--------------------------------------

MainMenuVisual1:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\VisualStudio\DataType\MetodString.cs
} else if (A_ThisMenuItemPos = 2) {
	Run E:\GlobalLibrary\ShaderLibrary\AutumnHouse\BlueCode\Road\BP_RoadSpline-UserConstructionScript.png
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuVisual2:
If (A_ThisMenuItemPos = 1) {
	MsgBox, you press button 1
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuVisual3:
If (A_ThisMenuItemPos = 1) {
	MsgBox, you press button 1
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuVisual4:
If (A_ThisMenuItemPos = 1) {
	MsgBox, you press button 1
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuVisual5:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\VisualStudio\DataType\Convert.cs
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return


MainMenuVisual:
return



MainMenu2Label:

return

#IfWinActive

#IfWinActive ahk_exe devenv.exe 

f1::
send, +!{enter}
return

!space:: Click 292 , 362



+space::
send,{Media_Play_Pause}
; ControlSend, , {space}, ahk_exe firefox.exe
; ControlSend, , {space}, ahk_class Chrome_WidgetWin_1
return 

^/::
send , ^k
send , ^c
return

^.::
send , ^k
send , ^u
return

#IfWinActive


#IfWinActive ahk_exe Code.exe


+space::
send,{Media_Play_Pause}
; ControlSend, , {space}, ahk_exe firefox.exe
; ControlSend, , {space}, ahk_class Chrome_WidgetWin_1
return 
#IfWinActive 

#IfWinActive ahk_class Notepad++


+space::
send,{Media_Play_Pause}
; ControlSend, , {space}, ahk_exe firefox.exe
; ControlSend, , {space}, ahk_class Chrome_WidgetWin_1
return 
#IfWinActive 


#IfWinActive ahk_exe devenv.exe
~^s::
if (KeyPressCountSelActor > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountSelActor += 1 ;add a count to existing key press count
} else {
	KeyPressCountSelActor := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

if (KeyPressCountSelActor = 1) ; The key was pressed only once
{
    tooltip, Save
	
}
else if (KeyPressCountSelActor = 2) ; The key was pressed twice
{

	tooltip, Surround
    
}
else if (KeyPressCountSelActor = 3) ; The key was pressed twice
{

	tooltip, SnipManager
    
}


SetTimer, KeyPressMonitorSelActor, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorSelActor:
if (KeyPressCountSelActor = 1) ; The key was pressed only once
{
    Send,^s
}
else if (KeyPressCountSelActor = 2) ; The key was pressed twice
{
	Send, ^k
	Send, ^s
}
else if (KeyPressCountSelActor = 3) ; The key was pressed twice
{
	Send, ^k
	Send, ^b
}


KeyPressCountSelActor := 0 ;reset the count to zero
SetTimer, KeyPressMonitorSelActor, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 


#IfWinActive ahk_exe devenv.exe
f9::
if (KeyPressCountPoint > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountPoint += 1 ;add a count to existing key press count
} else {
	KeyPressCountPoint := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

if (KeyPressCountPoint = 1) ; The key was pressed only once
{
    tooltip, BreakPoint
	
}
else if (KeyPressCountPoint = 2) ; The key was pressed twice
{

	tooltip, Delete Point
    
}



SetTimer, KeyPressMonitorPoint, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorPoint:
if (KeyPressCountPoint = 1) ; The key was pressed only once
{
    Send,{f9}
}
else if (KeyPressCountPoint = 2) ; The key was pressed twice
{
	Send, ^+{f9}

}


KeyPressCountPoint := 0 ;reset the count to zero
SetTimer, KeyPressMonitorPoint, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 


