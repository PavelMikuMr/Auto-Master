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
MEGA:= "C:\Users\pavel\Documents\MEGAsync\library\Redux\"
;----------------------------------Glabal Setting--------------------------------


;________________________________JavaScript_____________________________________________
; #IfWinActive ahk_exe Code.exe

Menu, VScde, Add, Framework, MainMenuStudio

Menu, Three Menu, Add, React, MainMenuStudio
Menu, Three Menu, Add, TailWind, MainMenuStudio
Menu, Three Menu, Add, ValueRefType, MainMenuStudio
Menu, Three Menu, Add, Object, MainMenuStudio
Menu, Three Menu, Add, Convert, MainMenuStudio

Menu, ReactThree Menu, Add, Form/Input/Label , MainMenuStudio1
Menu, ReactThree Menu, Add, freese, MainMenuStudio1
Menu, ReactThree Menu, Add, freeks, MainMenuStudio1

Menu, Three Menu, Add, React, :ReactThree Menu

Menu, TailWind Three Menu, Add, CssSheet, MainMenuStudio2
Menu, TailWind Three Menu, Add, TailWindPrTailWind 2, MainMenuStudio2
Menu, TailWind Three Menu, Add, TailWindPrTailWind 3, MainMenuStudio2

Menu, Three Menu, Add, TailWind, :TailWind Three Menu

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

Menu, VScde, Add, Framework, :Three Menu





;-------------------------------------------------------
Menu, VScde, Add, HTML, MenuHandler
Menu, MySubMenu6, Add,HTML/Css, SubMenu6Label
Menu, MySubMenu6, Add, Freese, SubMenu6Label
Menu, VScde, Add, HTML, :MySubMenu6

Menu, VScde, Add, Css LifeHack, MenuHandler
Menu, MySubMenu8, Add, Vertical Iline, SubMenu8Label
Menu, MySubMenu8, Add, Reset Value, SubMenu8Label
Menu, MySubMenu8, Add, Useful things, SubMenu8Label
Menu, MySubMenu8, Add, ListStyle, SubMenu8Label
Menu, MySubMenu8, Add, fee, SubMenu8Label
Menu, MySubMenu8, Add, foo, SubMenu8Label
Menu, MySubMenu8, Add, faa, SubMenu8Label
Menu, MySubMenu8, Add, fii, SubMenu8Label
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
Menu, MySubMenu9, Add, StrayHTML, SubMenu9Label
Menu, MySubMenu9, Add, StrayJS, SubMenu9Label
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



Menu, VScde, Add, Rem, MainMenuLabel
Menu, VScde, Add, KValue, MainMenuLabel
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
	MsgBox, folder is free
} else if (A_ThisMenuItemPos = 2) {
	Run %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\HTML\Basic\Basic.xml
	
}else if (A_ThisMenuItemPos = 3) {
	Run %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\Basic\CssBasic.xml
}else if (A_ThisMenuItemPos = 4) {
	 Run %MEGA%JavaScript\Array\Array.cs
}else if (A_ThisMenuItemPos = 5) {
	 Run %MEGA%JavaScript\Other\Recursia\Recursia.cs
}else if (A_ThisMenuItemPos = 6) {
	 Run %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\googleSeach\google.cs
}else if (A_ThisMenuItemPos = 7) {
	 Run G:\GlobalLibrary\ShaderLibrary\Afina\TriPlanarMaterial\Radius.png
}else if (A_ThisMenuItemPos = 8) {
	 Run G:\GlobalLibrary\ShaderLibrary\JavaScript\Other\ChanellPacking\AdvanceWorkChannel.png
}else if (A_ThisMenuItemPos = 9) {
	 Run %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\ones$tens\Rem.txt
}else if (A_ThisMenuItemPos = 10) {
	Run %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\ones$tens\Rem.txt
}
else if (A_ThisMenuItemPos = 11) {
	Run %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\CssLifeHack\goodvalue.cs
}
return



MenuHandler:
return

SubMenu1Label:
If (A_ThisMenuItemPos = 1) {
	Run, %MEGA%JavaScript\Loop\While\Whilel.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, %MEGA%JavaScript\Loop\DoWhile\DoWhile.cs
}else if (A_ThisMenuItemPos = 3) {
	Run, %MEGA%JavaScript\Loop\For\For.cs
}else if (A_ThisMenuItemPos = 4) {
	Run, %MEGA%JavaScript\Loop\InsertLoop\Nestedloop.cpp
}
return

SubMenu2Label:
If (A_ThisMenuItemPos = 1) {
	Run %MEGA%JavaScript\LogicOperators\Switch.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, %MEGA%JavaScript\LogicOperators\&.cs
}
return

SubMenu3Label:
If (A_ThisMenuItemPos = 1) {
	Run %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\DisplayTools\Flexbox\flexbox.png
} else if (A_ThisMenuItemPos = 2) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\HTML\Form\AtributesTag.xml
}
else if (A_ThisMenuItemPos = 3) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\DisplayTools\Flexbox\basis.png
}
else if (A_ThisMenuItemPos = 4) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\DisplayTools\Position.png
}
else if (A_ThisMenuItemPos = 5) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\DisplayTools\Grid\Grid.png
}
else if (A_ThisMenuItemPos = 6) {
	Run, %MEGA%JavaScript\Array\ArrayMetods.cs
}
return


SubMenu4Label:
If (A_ThisMenuItemPos = 1) {
	Run %MEGA%HTML-CSS-PREPROCESSOR\Prepros\Pug\Pug.png
} else if (A_ThisMenuItemPos = 2) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\Prepros\Pug\PugBase.cs
}
else if (A_ThisMenuItemPos = 3) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\Prepros\Scss\Scss.cs
}
return


SubMenu5Label:
If (A_ThisMenuItemPos = 1) {
	Run %MEGA%JavaScript\Other\JSON\Json.cs
} else if (A_ThisMenuItemPos = 2) {
	Run, %MEGA%JavaScript\LogicOperators\&.cs
}
return

SubMenu6Label:
If (A_ThisMenuItemPos = 1) {
	Run  %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\HTML\Elemnts\Elements.png
} else if (A_ThisMenuItemPos = 2) {
	Run, %MEGA%CommandPrompt\NodeJS.cs
}
return

SubMenu7Label:
If (A_ThisMenuItemPos = 1) {
	Run  %MEGA%GitHub\GIT\GIT.mp4
} else if (A_ThisMenuItemPos = 2) {
	Run, %MEGA%GitHub\GIT\GItPrompt.cs
}
return

SubMenu8Label:
If (A_ThisMenuItemPos = 1) {
	Run  %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\CssLifeHack\VerticalIline.png
} else if (A_ThisMenuItemPos = 2) {
	Run, %MEGA%GitHub\GIT\GItPrompt.cs
} else if (A_ThisMenuItemPos = 3) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\Verstka\DifferentUsefulthings\things.png

} else if (A_ThisMenuItemPos = 4) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\CssLifeHack\Flist.jpg

} else if (A_ThisMenuItemPos = 5) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\CssLifeHack\free.jpg


} else if (A_ThisMenuItemPos = 6) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\CssLifeHack\free.jpg


} else if (A_ThisMenuItemPos = 7) {
	Run, %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\SCC\CssLifeHack\free.jpg
}
return

SubMenu9Label:
If (A_ThisMenuItemPos = 1) {
	Run  %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\Verstka\Laborghini\Laborghini.png
} else if (A_ThisMenuItemPos = 2) {
	Run %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\Verstka\pray\Elements.png
} else if (A_ThisMenuItemPos = 3) {
	Run %MEGA%HTML-CSS-PREPROCESSOR\HTML.SCC\Verstka\pray\js.png
}
return
;---------------------------------------

MainMenuStudio1:
If (A_ThisMenuItemPos = 1) {
	Run %MEGA%HTML-CSS-PREPROCESSOR\WebLibraries\HtmlElementsRules\form.input\form.png
} else if (A_ThisMenuItemPos = 2) {
	Run G:\GlobalLibrary\ShaderLibrary\AutumnHouse\BlueCode\Road\BP_RoadSpline-UserConstructionScript.png
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuStudio2:
If (A_ThisMenuItemPos = 1) {
	run chrome.exe
    sleep,200
	Run https://nerdcave.com/tailwind-cheat-sheet
	WinMove, ahk_exe chrome.exe ,, 10,370, 850, 700
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuStudio3:
If (A_ThisMenuItemPos = 1) {
	Run	%MEGA%JavaScript\Class.Object.Metods\Ref.Value.Stack\Ref.Value.Stack.cs
} else if (A_ThisMenuItemPos = 2) {
	Run %MEGA%JavaScript\Class.Object.Metods\Ref.Value.Stack\Null.cs
} else if (A_ThisMenuItemPos = 3) {
	Run %MEGA%JavaScript\Class.Object.Metods\Ref.Value.Stack\InParam.cs
}
return

MainMenuStudio4:
If (A_ThisMenuItemPos = 1) {
	Run %MEGA%JavaScript\Class.Object.Metods\Object\Object.cs
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuStudio5:
If (A_ThisMenuItemPos = 1) {
	Run %MEGA%DataType\Convert.cs
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
	Run %MEGA%DataType\string\String.cs
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
	Run %MEGA%DataType\Convert.cs
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