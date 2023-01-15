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





;________________________________String_____________________________________________


Menu, VScde, Add, Class.Object.Function, MainMenuStudio

Menu, Three Menu, Add, Function, MainMenuStudio
Menu, Three Menu, Add, Class Konstructor, MainMenuStudio
Menu, Three Menu, Add, ValueRefType, MainMenuStudio
Menu, Three Menu, Add, Object, MainMenuStudio
Menu, Three Menu, Add, Convert, MainMenuStudio

Menu, Function Menu, Add, Type of Function, MainMenuStudio1
Menu, Function Menu, Add, CallBack, MainMenuStudio1
Menu, Function Menu, Add, Closure, MainMenuStudio1

Menu, Three Menu, Add, Function, :Function Menu

Menu, Class Three Menu, Add, Basic Class.Konstructor, MainMenuStudio2
Menu, Class Three Menu, Add, ClassPrClass 2, MainMenuStudio2
Menu, Class Three Menu, Add, ClassPrClass 3, MainMenuStudio2

Menu, Three Menu, Add, Class Konstructor, :Class Three Menu

Menu, ValueRefType Three Menu, Add, Ref. Value. Stack. Heap, MainMenuStudio3
Menu, ValueRefType Three Menu, Add, Null Ref Out, MainMenuStudio3
Menu, ValueRefType Three Menu, Add, In Param, MainMenuStudio3

Menu, Three Menu, Add, ValueRefType, :ValueRefType Three Menu

Menu, Object Three Menu, Add, Object Concept, MainMenuStudio4
Menu, Object Three Menu, Add, Metods.This.For(in), MainMenuStudio4
Menu, Object Three Menu, Add, This, MainMenuStudio4
Menu, Object Three Menu, Add, Descturction|Spread|Rest, MainMenuStudio4

Menu, Three Menu, Add, Object, :Object Three Menu

Menu, Convert Three Menu, Add, ConvertPrint 1, MainMenuStudio5
Menu, Convert Three Menu, Add, ConvertPrint 2, MainMenuStudio5
Menu, Convert Three Menu, Add, ConvertPrint 3, MainMenuStudio5

Menu, Three Menu, Add, Convert, :Convert Three Menu

Menu, VScde, Add, Class.Object.Function, :Three Menu
;-------------------------------------------------------

Menu, VScde, Add, DOM, MenuHandler
Menu, MySubMenu6, Add, DOM Element, SubMenu6Label
Menu, MySubMenu6, Add, Element's Property , SubMenu6Label
Menu, MySubMenu6, Add, getValue fr EL  , SubMenu6Label
Menu, MySubMenu6, Add, Window/element  , SubMenu6Label

Menu, VScde, Add, DOM, :MySubMenu6

Menu, VScde, Add, If|El|?|?.|???, MainMenuLabel

Menu, VScde, Add, Array , MenuHandler
Menu, MySubMenu3, Add, BaseArray, SubMenu3Label
Menu, MySubMenu3, Add, LoopMethod, SubMenu3Label
Menu, MySubMenu3, Add, Array2D+Foreach, SubMenu3Label
Menu, MySubMenu3, Add, SharpArray, SubMenu3Label
Menu, MySubMenu3, Add, Array3D, SubMenu3Label
Menu, MySubMenu3, Add, Basic Method, SubMenu3Label
Menu, VScde, Add, Array , :MySubMenu3

Menu, VScde, Add, Recursia + Algoritm, MainMenuLabel
Menu, VScde, Add, Export/Import, MainMenuLabel

Menu, VScde, Add, Async, MenuHandler
Menu, MySubMenu7, Add, Promise/Fetch, SubMenu7Label
Menu, MySubMenu7, Add, XHR Ajax, SubMenu7Label
Menu, VScde, Add, Async, :MySubMenu7

Menu, VScde, Add, JSON, MenuHandler
Menu, MySubMenu5, Add, BasicJSON, SubMenu5Label
Menu, MySubMenu5, Add, Frees, SubMenu5Label
Menu, VScde, Add, JSON, :MySubMenu5


Menu, VScde, Add, JavaScriptcookie, MenuHandler
Menu, MySubMenu4, Add, FileSystem, SubMenu4Label
Menu, MySubMenu4, Add, CommandPrompt, SubMenu4Label
Menu, VScde, Add, JavaScriptcookie, :MySubMenu4



Menu, VScde, Add, PureCode, MainMenuLabel
Menu, VScde, Add, JSsnip, MainMenuLabel
Menu, VScde, Add, Loop Operators, MenuHandler
Menu, MySubMenu1, Add, While, SubMenu1Label
Menu, MySubMenu1, Add, DoWhile, SubMenu1Label
Menu, MySubMenu1, Add, For, SubMenu1Label
Menu, MySubMenu1, Add, NestedLoop, SubMenu1Label
Menu, VScde, Add, Loop Operators, :MySubMenu1

Menu, VScde, Add,Math|LogicOperators, MenuHandler
Menu, MySubMenu2, Add, Swith, SubMenu2Label
Menu, MySubMenu2, Add, BasicLogic and Math, SubMenu2Label
Menu, VScde, Add, Math|LogicOperators, :MySubMenu2

;-------------------------------------------------

Menu, VScde, Add, DataType, MainMenuVisual

Menu, Two Menu, Add, Data, MainMenuVisual
Menu, Two Menu, Add, String, MainMenuVisual
Menu, Two Menu, Add, Double, MainMenuVisual
Menu, Two Menu, Add, Dynamic, MainMenuVisual
Menu, Two Menu, Add, Convert, MainMenuVisual

Menu, ADataTwo Menu, Add, Data Basic, MainMenuVisual1
Menu, ADataTwo Menu, Add, Cast, MainMenuVisual1
Menu, ADataTwo Menu, Add, HousePrint 3, MainMenuVisual1

Menu, Two Menu, Add, Data, :ADataTwo Menu

Menu, String Two Menu, Add, Work with String, MainMenuVisual2
Menu, String Two Menu, Add, StringPrString 2, MainMenuVisual2
Menu, String Two Menu, Add, StringPrString 3, MainMenuVisual2

Menu, Two Menu, Add, String, :String Two Menu

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


Menu, VScde, Add,English, MenuHandler
Menu, MySubMenu8, Add, Irregular, SubMenu8Label
Menu, MySubMenu8, Add, Regullar, SubMenu8Label
Menu, VScde, Add, English, :MySubMenu8


Menu, VScde, Add, Close, MainMenu2Label

return

; ^!p::
!-::
Menu, VScde, Show
return


MainMenuLabel:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\BasicPart\String.Operatros.Metods\String.Operatros.Metods.png
} else if (A_ThisMenuItemPos = 2) {
	Run C:\Users\pavel\GitHub\LIbrary\BasicPart\LogicOperators\LogicOperators.pngх
	
}else if (A_ThisMenuItemPos = 3) {
	Run C:\Users\pavel\GitHub\LIbrary\LogicOperators\Ifelse.cs
}else if (A_ThisMenuItemPos = 4) {
	 Run C:\Users\pavel\GitHub\LIbrary\Array\Array.cs
}else if (A_ThisMenuItemPos = 5) {
	 Run C:\Users\pavel\GitHub\LIbrary\Other\Recursia\Recursia.cs
}else if (A_ThisMenuItemPos = 6) {
	 Run C:\Users\pavel\GitHub\LIbrary\Other\export.import\export.import.cs
	 

}else if (A_ThisMenuItemPos = 7) {
	 Run C:\Users\pavel\GitHub\LIbrary\Other\Recursia\Radius.png
}else if (A_ThisMenuItemPos = 8) {
	 Run C:\Users\pavel\GitHub\LIbrary\Other\Snip\Snippets.png
}else if (A_ThisMenuItemPos = 9) {
	run chrome.exe
	sleep,200
	Run https://github.com/BoryaMogila/clean-code-javascript-ru#%D0%A4%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
	sleep, 100
}else if (A_ThisMenuItemPos = 10) {
	;  Run C:\Users\pavel\GitHub\LIbrary\Other\Console\Console.cs
	run chrome.exe
	sleep,200
	Run https://github.com/BoryaMogila/clean-code-javascript-ru#%D0%A4%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
	sleep, 100
}else if (A_ThisMenuItemPos = 11) {
	 Run C:\Users\pavel\GitHub\LIbrary\Other\Snip\Snippets.png
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
	Run C:\Users\pavel\GitHub\LIbrary\Array\Array.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\Array\ArrayLoop.cs
}
else if (A_ThisMenuItemPos = 3) {
	Run, C:\Users\pavel\GitHub\LIbrary\Array\Array2D.cs
}
else if (A_ThisMenuItemPos = 4) {
	Run, C:\Users\pavel\GitHub\LIbrary\Array\SharpArray.cs
}
else if (A_ThisMenuItemPos = 5) {
	Run, C:\Users\pavel\GitHub\LIbrary\Array\Array3D.cs
}
else if (A_ThisMenuItemPos = 6) {
	Run, C:\Users\pavel\GitHub\LIbrary\Array\ArrayMetods.cs
}
return


SubMenu4Label:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\Other\JavaScriptCokie\FileSystem.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\CommandPrompt\commandShell.cs
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
	Run C:\Users\pavel\GitHub\LIbrary\DOM\DOMelement.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\DOM\Propertyelement.cs

} else if (A_ThisMenuItemPos = 3) {
	Run, C:\Users\pavel\GitHub\LIbrary\DOM\getValue.jpg
}
 else if (A_ThisMenuItemPos = 4) {
	Run, C:\Users\pavel\GitHub\LIbrary\DOM\window.png
}
return
SubMenu7Label:
If (A_ThisMenuItemPos = 1) {
	Run, C:\Users\pavel\GitHub\LIbrary\Async\Promise&Fetch.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\Async\XHR&Ajax.cs
}
return

SubMenu8Label:
If (A_ThisMenuItemPos = 1) {
	Run, C:\Users\pavel\GitHub\LIbrary\English\Verb\IRRegular.pdf
} else if (A_ThisMenuItemPos = 2) {
	Run, C:\Users\pavel\GitHub\LIbrary\English\Verb\Regular.pdf
}
return
;---------------------------------------

MainMenuStudio1:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\ConceptOfMetods.cs
} else if (A_ThisMenuItemPos = 2) {
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\CallBack.cs
} else if (A_ThisMenuItemPos = 3) {
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\function\Замыкание.cs
}
return

MainMenuStudio2:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\Class\ClassKonstructor.cs
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
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\Object\MetodsObject.cs
} else if (A_ThisMenuItemPos = 3) {
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\Object\This.cs
} else if (A_ThisMenuItemPos = 4) {
	Run C:\Users\pavel\GitHub\LIbrary\Class.Object.Metods\Object\destruction.cs
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
	Run C:\Users\pavel\GitHub\LIbrary\DataType\cast\Cast.cs
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuVisual2:
If (A_ThisMenuItemPos = 1) {
	Run C:\Users\pavel\GitHub\LIbrary\DataType\string\BasicString.cs
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


;________________________________String_____________________________________________








#IfWinActive ahk_exe Reverso.exe

f1::
send,^+s
sleep,50
send,^+s
return

#IfWinActive 

#IfWinActive ahk_exe Code.exe

>^a::
send,^+3
return
>^s::
send,^+4
return


!space::
send,+!q
return

+Esc::
send,^+x
return


!e::
send,{+}
return


!x::
send,{_}
return

!d::
send,{-}
return

!f::
send,{&}
return



!r::
send,{`%}
return

!v::
send,#v
return

!2::
send,{f2}
return

#IfWinActive

#IfWinActive ahk_exe chrome.exe

^/::
send,{f7}
return

\::AppsKey
return

^,::
send,^f
return

!k::
send,^k
return

!BackSpace::
send,{AltDown}{left}{AltUp}
return

!s::
send,^+y
return

!f::
send,^+h
return




#IfWinActive 


#IfWinActive ahk_exe Code.exe




XButton1::
Menu MyMenu, Add,OpenExplore, item1handler
Menu MyMenu, Add,ExploreFiles, item2handler
Menu MyMenu, Add,FastFiles, item3handler
Menu MyMenu, Add,Find Files, item4handler
Menu MyMenu, Add,Find, item5handler
Menu MyMenu, Add,Picture, item6handler
Menu MyMenu, Add,New File, item7handler
Menu MyMenu, Add,Rename, item8handler
Menu MyMenu, Add,CodeOpen, item9handler
Menu MyMenu, Add,Bufer, item10handler
Menu MyMenu, Add,Extentions, item11handler
Menu MyMenu, Add,SurseControl, item12handler
Menu MyMenu, Add,Close, item13handler
Menu MyMenu, Show
Return

item1handler:
Send,^b
Return

item2handler:
send,!a
Return

item3handler:
send,^k
Return

item4handler:
send,!q
Return

item5handler:
send,!i
Return
item6handler:
Run C:\Users\pavel\Documents\ShareX\Screenshots\2022-12
Return

item7handler:
send,^n
Return

item8handler:
send,^h
return
item9handler:
Run https://codepen.io/PavelMikuMr/pen/MWXNeQM
Return
item10handler:
send,#v
Return


item11handler:
send,!z
Return
item12handler:
send,!y
Return
item13handler:
Return


#IfWinActive