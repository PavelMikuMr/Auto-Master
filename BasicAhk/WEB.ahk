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


;________________________________JavaScript_____________________________________________
; #IfWinActive ahk_exe Code.exe

Menu, VScde, Add, Web Element/Style, MainMenuStudio

Menu, Three Menu, Add, InputData, MainMenuStudio
Menu, Three Menu, Add, Class, MainMenuStudio
Menu, Three Menu, Add, ValueRefType, MainMenuStudio
Menu, Three Menu, Add, Object, MainMenuStudio
Menu, Three Menu, Add, Convert, MainMenuStudio

Menu, InputDataThree Menu, Add, Form/Input/Label , MainMenuStudio1
Menu, InputDataThree Menu, Add, freese, MainMenuStudio1
Menu, InputDataThree Menu, Add, freeks, MainMenuStudio1

Menu, Three Menu, Add, InputData, :InputDataThree Menu

Menu, Class Three Menu, Add, ClassPrClass 1, MainMenuStudio2
Menu, Class Three Menu, Add, ClassPrClass 2, MainMenuStudio2
Menu, Class Three Menu, Add, ClassPrClass 3, MainMenuStudio2

Menu, Three Menu, Add, Class, :Class Three Menu

Menu, ValueRefType Three Menu, Add, Ref. Value. Stack. Heap, MainMenuStudio3
Menu, ValueRefType Three Menu, Add, Null Ref Out, MainMenuStudio3
Menu, ValueRefType Three Menu, Add, In Param, MainMenuStudio3

Menu, Three Menu, Add, ValueRefType, :ValueRefType Three Menu

Menu, Object Three Menu, Add, Object Concept, MainMenuStudio4
Menu, Object Three Menu, Add, ObjectPrint 2, MainMenuStudio4
Menu, Object Three Menu, Add, ObjectPrint 3, MainMenuStudio4

Menu, Three Menu, Add, Object, :Object Three Menu

Menu, Convert Three Menu, Add, ConvertPrint 1, MainMenuStudio5
Menu, Convert Three Menu, Add, ConvertPrint 2, MainMenuStudio5
Menu, Convert Three Menu, Add, ConvertPrint 3, MainMenuStudio5

Menu, Three Menu, Add, Convert, :Convert Three Menu

Menu, VScde, Add, Web Element/Style, :Three Menu
;-------------------------------------------------------
Menu, VScde, Add, HTML/Css(ELEMENT), MenuHandler
Menu, MySubMenu6, Add,HTML/Css, SubMenu6Label
Menu, MySubMenu6, Add, Freese, SubMenu6Label
Menu, VScde, Add, HTML/Css(ELEMENT), :MySubMenu6

Menu, VScde, Add, Css LifeHack, MenuHandler
Menu, MySubMenu8, Add, Vertical Iline, SubMenu8Label
Menu, MySubMenu8, Add, Reset Value, SubMenu8Label
Menu, MySubMenu8, Add, Useful things, SubMenu8Label
Menu, VScde, Add, Css LifeHack, :MySubMenu8

Menu, VScde, Add, Css Tools, MenuHandler
Menu, MySubMenu3, Add, FlexBox, SubMenu3Label
Menu, MySubMenu3, Add, Grid, SubMenu3Label
Menu, MySubMenu3, Add, Grow/Shrink/Basis, SubMenu3Label
Menu, MySubMenu3, Add, Position, SubMenu3Label
Menu, MySubMenu3, Add, Grid png, SubMenu3Label
Menu, MySubMenu3, Add, Basic Metods, SubMenu3Label
Menu, VScde, Add, Css Tools, :MySubMenu3

Menu, VScde, Add, Verstka, MenuHandler
Menu, MySubMenu9, Add, Laborghini, SubMenu9Label
Menu, MySubMenu9, Add, Command, SubMenu9Label
Menu, VScde, Add, Verstka, :MySubMenu9


Menu, VScde, Add, Google Search, MainMenuLabel

Menu, VScde, Add, GitHub, MenuHandler
Menu, MySubMenu7, Add, video, SubMenu7Label
Menu, MySubMenu7, Add, Command, SubMenu7Label
Menu, VScde, Add, GitHub, :MySubMenu7

Menu, VScde, Add, JSON, MenuHandler
Menu, MySubMenu5, Add, BasicJSON, SubMenu5Label
Menu, MySubMenu5, Add, Frees, SubMenu5Label
Menu, VScde, Add, JSON, :MySubMenu5


Menu, VScde, Add, PrePrecess, MenuHandler
Menu, MySubMenu4, Add, PugPng, SubMenu4Label
Menu, MySubMenu4, Add, PugBasic, SubMenu4Label
Menu, MySubMenu4, Add, SCSS, SubMenu4Label
Menu, VScde, Add, PrePrecess, :MySubMenu4



Menu, VScde, Add, Note, MainMenuLabel

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

Menu, AStringTwo Menu, Add, String Basic, MainMenuVisual1
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

; ^!o::
!=::
Menu, VScde, Show
return


MainMenuLabel:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\BasicPart\String.Operatros.Metods\String.Operatros.Metods.png
} else if (A_ThisMenuItemPos = 2) {
	Run C:\Users\pavel\GitHub\LIbrary\HTML.SCC\HTML\Basic\Basic.xml
	
}else if (A_ThisMenuItemPos = 3) {
	Run C:\Users\pavel\GitHub\LIbrary\HTML.SCC\SCC\Basic\CssBasic.xml
}else if (A_ThisMenuItemPos = 4) {
	 Run C:\Users\pavel\GitHub\LIbrary\Array\Array.cs
}else if (A_ThisMenuItemPos = 5) {
	 Run C:\Users\pavel\GitHub\LIbrary\Other\Recursia\Recursia.cs
}else if (A_ThisMenuItemPos = 6) {
	 Run C:\Users\pavel\GitHub\LIbrary\HTML.SCC\googleSeach\google.cs
}else if (A_ThisMenuItemPos = 7) {
	 Run G:\GlobalLibrary\ShaderLibrary\Afina\TriPlanarMaterial\Radius.png
}else if (A_ThisMenuItemPos = 8) {
	 Run G:\GlobalLibrary\ShaderLibrary\Other\ChanellPacking\AdvanceWorkChannel.png
}else if (A_ThisMenuItemPos = 9) {
	 Run C:\Users\pavel\GitHub\LIbrary\Note\Note.txt
}else if (A_ThisMenuItemPos = 10) {
	 Run  C:\Users\pavel\GitHub\LIbrary\Note\Note.txt
}
return


MenuHandler:
return

SubMenu1Label:
If (A_ThisMenuItemPos = 1) {
	Run, C:\Users\pavel\GitHub\LIbrary\Loop\While\Whilel.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\Loop\DoWhile\DoWhile.cs
}else if (A_ThisMenuItemPos = 3) {
	Run, C:\Users\pavel\GitHub\LIbrary\Loop\For\For.cs
}else if (A_ThisMenuItemPos = 4) {
	Run, C:\Users\pavel\GitHub\LIbrary\Loop\InsertLoop\Nestedloop.cpp
}
return

SubMenu2Label:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\LogicOperators\Switch.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\LogicOperators\&.cs
}
return

SubMenu3Label:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\HTML.SCC\SCC\DisplayTools\Flexbox\flexbox.png
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\HTML.SCC\HTML\Form\AtributesTag.xml
}
else if (A_ThisMenuItemPos = 3) {
	Run, C:\Users\pavel\GitHub\LIbrary\HTML.SCC\SCC\DisplayTools\Flexbox\basis.png
}
else if (A_ThisMenuItemPos = 4) {
	Run, C:\Users\pavel\GitHub\LIbrary\HTML.SCC\SCC\DisplayTools\Position.png
}
else if (A_ThisMenuItemPos = 5) {
	Run, C:\Users\pavel\GitHub\LIbrary\HTML.SCC\SCC\DisplayTools\Grid\Grid.png
}
else if (A_ThisMenuItemPos = 6) {
	Run, C:\Users\pavel\GitHub\LIbrary\Array\ArrayMetods.cs
}
return


SubMenu4Label:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\Prepros\Pug\Pug.png
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\Prepros\Pug\PugBase.cs
}
else if (A_ThisMenuItemPos = 3) {
	Run, C:\Users\pavel\GitHub\LIbrary\Prepros\Scss\Scss.cs
}
return


SubMenu5Label:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\Other\JSON\Json.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\LogicOperators\&.cs
}
return

SubMenu6Label:
If (A_ThisMenuItemPos = 1) {
	Run  C:\Users\pavel\GitHub\LIbrary\HTML.SCC\HTML\Elemnts\Elements.png
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\CommandPrompt\NodeJS.cs
}
return

SubMenu7Label:
If (A_ThisMenuItemPos = 1) {
	Run  C:\Users\pavel\GitHub\LIbrary\GIT\GIT.mp4
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\GIT\GItPrompt.cs
}
return

SubMenu8Label:
If (A_ThisMenuItemPos = 1) {
	Run  C:\Users\pavel\GitHub\LIbrary\HTML.SCC\SCC\CssLifeHack\VerticalIline.png
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\GIT\GItPrompt.cs
} else if (A_ThisMenuItemPos = 3) {
	Run, C:\Users\pavel\GitHub\LIbrary\HTML.SCC\Verstka\DifferentUsefulthings\things.png
}
return

SubMenu9Label:
If (A_ThisMenuItemPos = 1) {
	Run  C:\Users\pavel\GitHub\LIbrary\HTML.SCC\Verstka\Laborghini\Laborghini.png
} else if (A_ThisMenuItemPos = 2) {
	Run C:\Users\pavel\GitHub\LIbrary\HTML.SCC\Verstka\Laborghini\
}
return
;---------------------------------------

MainMenuStudio1:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\WebLibraries\HtmlElementsRules\form.input\form.png
} else if (A_ThisMenuItemPos = 2) {
	Run G:\GlobalLibrary\ShaderLibrary\AutumnHouse\BlueCode\Road\BP_RoadSpline-UserConstructionScript.png
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
	Run	C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\Ref.Value.Stack\Ref.Value.Stack.cs
} else if (A_ThisMenuItemPos = 2) {
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\Ref.Value.Stack\Null.cs
} else if (A_ThisMenuItemPos = 3) {
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\Ref.Value.Stack\InParam.cs
}
return

MainMenuStudio4:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\Object\Object.cs
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuStudio5:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\DataType\Convert.cs
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
	Run C:\Users\pavel\GitHub\LIbrary\DataType\string\String.cs
} else if (A_ThisMenuItemPos = 2) {
	Run G:\GlobalLibrary\ShaderLibrary\AutumnHouse\BlueCode\Road\BP_RoadSpline-UserConstructionScript.png
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
	Run C:\Users\pavel\GitHub\LIbrary\DataType\Convert.cs
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


;________________________________JavaScript_____________________________________________