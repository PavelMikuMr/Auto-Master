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

;----------------------------------Glabal Setting--------------------------------





#IfWinActive ahk_exe UnrealEditor.exe

Menu, Shader, Add, ShaderLibrary, MainMenuLabel
Menu, Shader, Add, ShaderVertex, MainMenuLabel
Menu, Shader, Add, Parralax, MainMenuLabel
Menu, Shader, Add, AfinaS+DecalDamage, MainMenuLabel
Menu, Shader, Add, WinterSlopeMask, MainMenuLabel
Menu, Shader, Add, AfinaTriplanarM, MainMenuLabel
Menu, Shader, Add, CheapObjRadius, MainMenuLabel
Menu, Shader, Add, AdvChannel, MainMenuLabel
Menu, Shader, Add, Envira(Clouds+reflect), MainMenuLabel
Menu, Shader, Add, MathFunct(Smooth), MainMenuLabel

Menu, Shader, Add, MiniAsset, MenuHandler
Menu, MySubMenu1, Add, BumpOF&Other, SubMenu1Label
Menu, MySubMenu1, Add, Height, SubMenu1Label
Menu, MySubMenu1, Add, WorldAline, SubMenu1Label
Menu, Shader, Add, MiniAsset, :MySubMenu1

Menu, Shader, Add, Presets, MenuHandler
Menu, MySubMenu2, Add, Glass, SubMenu2Label
Menu, MySubMenu2, Add, Boulder, SubMenu2Label
Menu, Shader, Add, Presets, :MySubMenu2

Menu, Shader, Add, BluePrint, MainMenuBlueBprint

Menu, Two Menu, Add, AutumnHouse, MainMenuBlueBprint
Menu, Two Menu, Add, Afina, MainMenuBlueBprint
Menu, Two Menu, Add, Winter, MainMenuBlueBprint
Menu, Two Menu, Add, Wolfenstein, MainMenuBlueBprint

Menu, Autumn Two Menu, Add, BoardInstansing, MainMenuBlueBprint1
Menu, Autumn Two Menu, Add, RoadVerPaint 2, MainMenuBlueBprint1
Menu, Autumn Two Menu, Add, HousePrint 3, MainMenuBlueBprint1

Menu, Two Menu, Add, AutumnHouse, :Autumn Two Menu

Menu, Afina Two Menu, Add, AfinaPrint 1, MainMenuBlueBprint2
Menu, Afina Two Menu, Add, AfinaPrint 2, MainMenuBlueBprint2
Menu, Afina Two Menu, Add, AfinaPrint 3, MainMenuBlueBprint2

Menu, Two Menu, Add, Afina, :Afina Two Menu

Menu, Winter Two Menu, Add, WinterPrint 1, MainMenuBlueBprint3
Menu, Winter Two Menu, Add, WinterPrint 2, MainMenuBlueBprint3
Menu, Winter Two Menu, Add, WinterPrint 3, MainMenuBlueBprint3

Menu, Two Menu, Add, Winter, :Winter Two Menu

Menu, Wolfenstein Two Menu, Add, WolfensteinPrint 1, MainMenuBlueBprint4
Menu, Wolfenstein Two Menu, Add, WolfensteinPrint 2, MainMenuBlueBprint4
Menu, Wolfenstein Two Menu, Add, WolfensteinPrint 3, MainMenuBlueBprint4

Menu, Two Menu, Add, Wolfenstein, :Wolfenstein Two Menu

Menu, Shader, Add, BluePrint, :Two Menu

return

Menu, Shader, Add, Close, MainMenu2Label

return

^!p::
Menu, Shader, Show
return


MainMenuLabel:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\ShaderLibrary\
} else if (A_ThisMenuItemPos = 2) {
	Run E:\GlobalLibrary\ShaderLibrary\AutumnHouse\VetexShader\A001.png
	
}else if (A_ThisMenuItemPos = 3) {
	 Run E:\GlobalLibrary\ShaderLibrary\Afina\Paralax\paralax.png
}else if (A_ThisMenuItemPos = 4) {
	 Run E:\GlobalLibrary\ShaderLibrary\Afina\ShaderAfina+DecalDamage\Stand_stone_master-MaterialGraph_1.png
}else if (A_ThisMenuItemPos = 5) {
	 Run E:\GlobalLibrary\ShaderLibrary\WinterIsHere\SlopeMask\SlopeMask.png
}else if (A_ThisMenuItemPos = 6) {
	 Run E:\GlobalLibrary\ShaderLibrary\Afina\TriPlanarMaterial\TRIPLANAR.png
}else if (A_ThisMenuItemPos = 7) {
	 Run E:\GlobalLibrary\ShaderLibrary\Afina\TriPlanarMaterial\Radius.png
}else if (A_ThisMenuItemPos = 8) {
	 Run E:\GlobalLibrary\ShaderLibrary\Other\ChanellPacking\AdvanceWorkChannel.png
}else if (A_ThisMenuItemPos = 9) {
	 Run E:\GlobalLibrary\ShaderLibrary\Environment\WorkEnvironment.png
}else if (A_ThisMenuItemPos = 10) {
	 Run E:\GlobalLibrary\ShaderLibrary\Other\MathFunction\Math.png
}
return


MenuHandler:
return

SubMenu1Label:
If (A_ThisMenuItemPos = 1) {
	Run, E:\GlobalLibrary\ShaderLibrary\Other\Tools\MovePixel\movePixel.png
} else if (A_ThisMenuItemPos = 2) {
	Run, E:\GlobalLibrary\ShaderLibrary\Other\Tools\Height\Height.png
}else if (A_ThisMenuItemPos = 3) {
	Run, E:\GlobalLibrary\ShaderLibrary\Other\Tools\WorldAline\WorldAline.png
}
return

SubMenu2Label:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\ShaderLibrary\Presets\Glass\FakeGlass.png
} else if (A_ThisMenuItemPos = 2) {
	Run, E:\GlobalLibrary\ShaderLibrary\Presets\Boulder\boulder.png
}
return



MainMenuBlueBprint1:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\ShaderLibrary\AutumnHouse\BluePrint\Instnsing\BP_InstanceSpline-UserConstructionScript.png
} else if (A_ThisMenuItemPos = 2) {
	Run E:\GlobalLibrary\ShaderLibrary\AutumnHouse\BluePrint\Road\BP_RoadSpline-UserConstructionScript.png
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuBlueBprint2:
If (A_ThisMenuItemPos = 1) {
	MsgBox, you press button 1
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuBlueBprint3:
If (A_ThisMenuItemPos = 1) {
	MsgBox, you press button 1
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return

MainMenuBlueBprint4:
If (A_ThisMenuItemPos = 1) {
	MsgBox, you press button 1
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
} else if (A_ThisMenuItemPos = 3) {
	MsgBox, you press button 3
}
return


MainMenuBlueBprint:
return

MainMenu2Label:

return

#IfWinActive


;-------------------SelectWindows--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~f3::
if (KeyPressCountWindows > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountWindows += 1 ;add a count to existing key press count
} else {
	KeyPressCountWindows := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

if (KeyPressCountWindows = 1) ; The key was pressed only once
{
    tooltip, PlaceActor
	
}
else if (KeyPressCountWindows = 2) ; The key was pressed twice
{

	tooltip, MergeActors
    
}
else if (KeyPressCountWindows = 3)	; The key was pressed more than twice
{
		
	tooltip, FindActors
    
}


SetTimer, KeyPressMonitorWindows, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorWindows:
if (KeyPressCountWindows = 1) ; The key was pressed only once
{
    Send,!+x
}
else if (KeyPressCountWindows = 2) ; The key was pressed twice
{
	Send, ^+m
}
else if (KeyPressCountWindows = 3)	; The key was pressed more than twice
{
	Send, +!u	
}


KeyPressCountWindows := 0 ;reset the count to zero
SetTimer, KeyPressMonitorWindows, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------SelectWindows--------------------------------







;-------------------Realtime--------------------------------
~Esc::
    If (A_TimeSincePriorHotkey < 250) && (A_TimeSincePriorHotkey <> -1) {
        Send, ^r	
    }
return
;-------------------Realtime--------------------------------


;-------------------Mirror--------------------------------

#IfWinActive ahk_exe UnrealEditor.exe
!2::
CoordMode, Mouse, Screen
MouseGetPos, XposA, YposA ; получение координаты мыши
XposA-=+80
YposA-=+80 ; подгонка под курсор мыши
gui, 65:destroy
Gui, 65:Color, 111111 ; 16 код цвета может быть любым-

Gui, 65:Add, Button, x2 y60 w50 h20 BackgroundTrans gMir1, MirrorX
Gui, 65:Add, Button, x122 y60 w50 h20 BackgroundTrans gMir2, MirrorY
Gui, 65:Add, Button, x62 y120 w50 h20 BackgroundTrans gMir3, Lock
Gui, 65:Add, Button, x122 y120 w50 h20 BackgroundTrans gMenuCl, Close
Gui, 65:Add, Button, x62 y0 w50 h20BackgroundTrans gMir4, MirrorZ
Gui, 65:Add, Button, x62 y60 w50 h20BackgroundTrans gMir5, Free
Gui 65:+LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, 111111 ; - главное чтобы он совпадал вотдесь
Gui 65:-Caption
Gui, 65:Show, x%XposA% y%YposA% h176 w179, menus
Return

MenuCl:
Gui, 65:Destroy
return

Mir1:
Gui, 65:Destroy
Send,+^x
Return

Mir2:
Gui, 65:Destroy
Send,+^y
Return

Mir3:
Gui, 65:Destroy
Send,+^u
Return

Mir4:
Gui, 65:Destroy
Send,+^z
Return

Mir5:
Gui, 65:Destroy
Send,+^l
Return

#IfWinActive


;-------------------Mirror--------------------------------




; normal
#IfWinActive ahk_exe UnrealEditor.exe
; ~n::
    ; If (A_TimeSincePriorHotkey < 170) && (A_TimeSincePriorHotkey <> -1) {
        ; Send, ^!o	
    ; }
; return
; -----------------old version--------

~n:: ;hotkey - You can also use mouse clicks such as ~LButton

if (KeyPressCount > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCount += 1 ;add a count to existing key press count
} else {
	KeyPressCount := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitor, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitor:
if (KeyPressCount = 2) ; The key was pressed only once
{
	Send, ^!o	
}

KeyPressCount := 0 ;reset the count to zero
SetTimer, KeyPressMonitor, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return

#IfWinActive

; normal


;-------------------BColor--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~b:: ;hotkey - You can also use mouse clicks such as ~LButton
if (KeyPressCountBColor > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountBColor += 1 ;add a count to existing key press count
} else {
	KeyPressCountBColor := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorBColor, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorBColor:
if (KeyPressCountBColor = 2) ; The key was pressed only once
{
	Send, !9
}
KeyPressCountBColor := 0 ;reset the count to zero
SetTimer, KeyPressMonitorBColor, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------BColor--------------------------------

; -------------------Reset--------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~+e:: ;hotkey - You can also use mouse clicks such as ~LButton
if (KeyPressCountReset > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountReset += 1 ;add a count to existing key press count
} else {
	KeyPressCountReset := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorReset, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorReset:
if (KeyPressCountReset = 2) ; The key was pressed only once
{
	Send, !4
}
KeyPressCountReset := 0 ;reset the count to zero
SetTimer, KeyPressMonitorReset, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;------------------------- Reset-----------------------------------

;------------------------- WireFrame-------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~3:: ;hotkey - You can also use mouse clicks such as ~LButton
if (KeyPressCountWireFrame > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountWireFrame += 1 ;add a count to existing key press count
} else {
	KeyPressCountWireFrame := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorWireFrame, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorWireFrame:
if (KeyPressCountWireFrame = 2) ; The key was pressed only once
{
	Send, !2
}
else if (KeyPressCountWireFrame = 3) ; The key was pressed twice
{

	Send, +!.
    
}
KeyPressCountWireFrame := 0 ;reset the count to zero
SetTimer, KeyPressMonitorWireFrame, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 

;------------------- WireFrame--------------------------------

;-------------------SelectMode--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~f1::
if (KeyPressCountSelect > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountSelect += 1 ;add a count to existing key press count
} else {
	KeyPressCountSelect := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

if (KeyPressCountSelect = 1) ; The key was pressed only once
{
    tooltip, DefaulMode
	
}
else if (KeyPressCountSelect = 2) ; The key was pressed twice
{

	tooltip, PaintMode
    
}
else if (KeyPressCountSelect = 3)	; The key was pressed more than twice
{
		
	tooltip, BrushEdit
    
}
else if (KeyPressCountSelect = 4)	; The key was pressed more than twice
{
	tooltip, ModelingMode
    
}
else if (KeyPressCountSelect = 5)	; The key was pressed more than twice
{	
	tooltip, LandscapeMode
    
}
else if (KeyPressCountSelect = 6)	; The key was pressed more than twice
{
	tooltip, FoliageMode
    
}
else if (KeyPressCountSelect = 7)	; The key was pressed more than twice
{
	tooltip, FractureMode
    
}
; tooltip, % KeyPressCountSelect ;tooltip to show key press count

SetTimer, KeyPressMonitorA, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorA:
if (KeyPressCountSelect = 1) ; The key was pressed only once
{
    Send, ^+1	
	tooltip, DefaulMode
	
}
else if (KeyPressCountSelect = 2) ; The key was pressed twice
{
	Send, +^4	
	tooltip, PaintMode
}
else if (KeyPressCountSelect = 3)	; The key was pressed more than twice
{
	Send, !+7
}
else if (KeyPressCountSelect = 4)	; The key was pressed more than twice
{
	Send, +^5	
	tooltip, ModelingMode
}
else if (KeyPressCountSelect = 5)	; The key was pressed more than twice
{
	Send, +^2
	tooltip, LandscapeMode
}
else if (KeyPressCountSelect = 6)	; The key was pressed more than twice
{
	Send, +^3
	tooltip, FoliageMode
}
else if (KeyPressCountSelect = 7)	; The key was pressed more than twice
{
	Send, +^6
	tooltip, FractureMode
}
KeyPressCountSelect := 0 ;reset the count to zero
SetTimer, KeyPressMonitorA, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------SelectMode--------------------------------

;-------------------ShaderComplexty--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~c:: ;hotkey - You can also use mouse clicks such as ~LButton
if (KeyPressCountComplex > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountComplex += 1 ;add a count to existing key press count
} else {
	KeyPressCountComplex := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorComplex, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorComplex:
if (KeyPressCountComplex = 2) ; The key was pressed only once
{
	Send, !3
}
KeyPressCountComplex := 0 ;reset the count to zero
SetTimer, KeyPressMonitorComplex, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------ShaderComplexty--------------------------------


;-------------------Metallic--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~m:: ;hotkey - You can also use mouse clicks such as ~LButton
if (KeyPressCountMetallic > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountMetallic += 1 ;add a count to existing key press count
} else {
	KeyPressCountMetallic := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorMetallic, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorMetallic:
if (KeyPressCountMetallic = 2) ; The key was pressed only once
{
	Send, ^!8
}
KeyPressCountMetallic := 0 ;reset the count to zero
SetTimer, KeyPressMonitorMetallic, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------Metallic--------------------------------

;-------------------Roughness--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~r:: ;hotkey - You can also use mouse clicks such as ~LButton
if (KeyPressCountRoughness > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountRoughness += 1 ;add a count to existing key press count
} else {
	KeyPressCountRoughness := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorRoughness, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorRoughness:
if (KeyPressCountRoughness = 2) ; The key was pressed only once
{
	Send, ^!9
}
KeyPressCountRoughness := 0 ;reset the count to zero
SetTimer, KeyPressMonitorRoughness, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------Roughness--------------------------------

;-------------------SelectActors--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
^1::
if (KeyPressCountSelActor > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountSelActor += 1 ;add a count to existing key press count
} else {
	KeyPressCountSelActor := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

if (KeyPressCountSelActor = 1) ; The key was pressed only once
{
    tooltip, Solo
	
}
else if (KeyPressCountSelActor = 2) ; The key was pressed twice
{

	tooltip, ShowAllActors
    
}
else if (KeyPressCountSelActor = 3)	; The key was pressed more than twice
{
		
	tooltip, HideActors
    
}
else if (KeyPressCountSelActor = 4)	; The key was pressed more than twice
{
		
	tooltip, SameMaterial
    
}

SetTimer, KeyPressMonitorSelActor, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorSelActor:
if (KeyPressCountSelActor = 1) ; The key was pressed only once
{
    Send,^!i
}
else if (KeyPressCountSelActor = 2) ; The key was pressed twice
{
	Send, ^!h
}
else if (KeyPressCountSelActor = 3)	; The key was pressed more than twice
{
	Send, ^!k	
}
else if (KeyPressCountSelActor = 4)	; The key was pressed more than twice
{
	Send, +!s	
}

KeyPressCountSelActor := 0 ;reset the count to zero
SetTimer, KeyPressMonitorSelActor, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------SelectActors--------------------------------



;-------------------Overdraw--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~o:: ;hotkey - You can also use mouse clicks such as ~LButton
if (KeyPressCountOverdraw > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountOverdraw += 1 ;add a count to existing key press count
} else {
	KeyPressCountOverdraw := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorOverdraw, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorOverdraw:
if (KeyPressCountOverdraw = 2) ; The key was pressed only once
{
	Send, ^+6
}
KeyPressCountOverdraw := 0 ;reset the count to zero
SetTimer, KeyPressMonitorOverdraw, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------Overdraw--------------------------------


;-------------------LevelOfDetail--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
~l:: ;hotkey - You can also use mouse clicks such as ~LButton
if (KeyPressCountLDetail > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountLDetail += 1 ;add a count to existing key press count
} else {
	KeyPressCountLDetail := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

SetTimer, KeyPressMonitorLDetail, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorLDetail:
if (KeyPressCountLDetail = 2) ; The key was pressed only once
{
	Send, ^+7
}
KeyPressCountLDetail := 0 ;reset the count to zero
SetTimer, KeyPressMonitorLDetail, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------LevelOfDetail--------------------------------







;-------------------Light--------------------------------
#IfWinActive ahk_exe UnrealEditor.exe
^7::
if (KeyPressCountLight > 0) ;if key press count is greater than zero because you have run this hotkey just before
{
	KeyPressCountLight += 1 ;add a count to existing key press count
} else {
	KeyPressCountLight := 1 ;otherwise this is your first time running the hotkey so set press count to one
}

if (KeyPressCountLight = 1) ; The key was pressed only once
{
    tooltip, Ligth
	
}
else if (KeyPressCountLight = 2) ; The key was pressed twice
{

	tooltip, DefaultLigth
    
}
else if (KeyPressCountLight = 3)	; The key was pressed more than twice
{
		
	tooltip, LightComplex
    
}

SetTimer, KeyPressMonitorLight, 300 ; start label to monitor subsequent key stroke within the next 300 milliseconds

return

KeyPressMonitorLight:
if (KeyPressCountLight = 1) ; The key was pressed only once
{
    Send,!7
}
else if (KeyPressCountLight = 2) ; The key was pressed twice
{
	Send, !5
}
else if (KeyPressCountLight = 3)	; The key was pressed more than twice
{
	Send, !8
}

KeyPressCountLight := 0 ;reset the count to zero
SetTimer, KeyPressMonitorLight, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return
#IfWinActive 
;-------------------Light--------------------------------

#IfWinActive Viewport ahk_class UnrealWindow

^t::
; MouseGetPos, x,y
; MouseClick, left, %x%, %y%, 1, 0
WinGetPos, , , Width,Height, A
if (Width=477) and  (Height=976)
	; MsgBox Folow window size eqel x:%Width% y:%Height%
WinMove, A, , 376, 80 , 1540, 976
	; WinGetPos ,,, NewWidth,NewHeight, A
	; MsgBox windows has been move x:%NewWidth% y:%NewHeight%
else
WinMove, A, , 1438, 80 , 477, 976	
	; WinGetPos ,,, NewWidth,NewHeight, A
; MsgBox Folow window size is x:%Width% y:%Height%
return
#IfWinActive

; #IfWinActive ahk_exe UnrealEditor.exe
; 
; ~Right::
   ;  If (A_TimeSincePriorHotkey < 400) && (A_TimeSincePriorHotkey <> -1) {
      ;   MouseGetPos, x,y
      ;   MouseClick, left, %x%, %y%, 1, 0
      ;   WinGetPos, , , Width,Height, A
      ;   if (Width=436) and  (Height=972)
	   ;   WinMove, A, , 3, 105 , 1159, 972
      ;   else
      ;   WinMove, A, , 1, 79 , 436, 972	
      ; }
; Return
; 
; #IfWinActive
; 


#IfWinActive ahk_exe UnrealEditor.exe

!^t::
CoordMode, Mouse, Screen
MouseGetPos, XposA, YposA ; получение координаты мыши
XposA-=+80
YposA-=+80 ; подгонка под курсор мыши
gui, MainOut:destroy
Gui, MainOut:Color, 111111 ; 16 код цвета может быть любым-
Gui, MainOut:Add, Button, x2 y0 w50 h20 BackgroundTrans gdothis21, Merge
Gui, MainOut:Add, Button, x2 y60 w50 h20 BackgroundTrans gdothis22, Left
Gui, MainOut:Add, Button, x122 y60 w50 h20 BackgroundTrans gdothis23, Right
Gui, MainOut:Add, Button, x62 y120 w50 h20 BackgroundTrans gdothis24, Down
Gui, MainOut:Add, Button, x122 y120 w50 h20 BackgroundTrans gclose, Close
Gui, MainOut:Add, Button, x122 y0 w50 h20 BackgroundTrans gdothis25, Camera
Gui, MainOut:Add, Button, x2 y120 w50 h20 BackgroundTrans gdothis26, Pref
Gui, MainOut:Add, Button, x62 y0 w50 h20 BackgroundTrans gdothis27, Full
Gui, MainOut:Add, Button, x62 y60 w50 h20 BackgroundTrans gdothis28, Outline
Gui, MainOut:Add, Button, x2 y30 w50 h20 BackgroundTrans gdothis29, PlaceA
Gui, MainOut:Add, Button, x2 y90 w50 h20 BackgroundTrans gdothis30, Cin
Gui, MainOut:Add, Button, x122 y30 w50 h20 BackgroundTrans gdothis31, Cinema
Gui, MainOut:Add, Button, x122 y90 w50 h20 BackgroundTrans gdothis32, Realtime
Gui MainOut:+LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, 111111 ; - главное чтобы он совпадал вотдесь
Gui MainOut:-Caption
Gui, MainOut:Show, x%XposA% y%YposA% h176 w179, menus
Return

close:
Gui, MainOut:Destroy
return

dothis21:
Gui, MainOut:Destroy
  send, ^+m
Return

dothis22:
Gui, MainOut:Destroy
Click 77 , 94
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {enter}
Return

dothis23:
Gui, MainOut:Destroy
Send , Click 77 , 94
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {down}
Send , {enter}
Return

dothis24:
Gui, MainOut:Destroy
send, {f11}
Sleep,25
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
Sleep,25
send, {enter}
Sleep,25
send, ^{f4}

Return

dothis25:
Gui, MainOut:Destroy
Send , ^!+c
Return

dothis26:
Gui, MainOut:Destroy
; Click 100 ,10
; Click 154 ,230
MouseClick, left, 99, 12, 1, 0
Sleep,200
MouseClick, left, 151, 228, 1, 0
Return

dothis27:
Gui, MainOut:Destroy
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
Sleep,25
send, {enter}

send, ^{f4}

send, {f11}
Return

dothis28:
Gui, MainOut:Destroy
MouseClick, left, 145, 10, 1, 0
Sleep,200
MouseClick, left, 193, 212, 1, 0
Return

dothis29:
Gui, MainOut:Destroy
Send , !+x
Return

dothis30:
Gui, MainOut:Destroy
Send , !c
Return

dothis31:
Gui, MainOut:Destroy
Send , ^!+s
Return

dothis32:
Gui, MainOut:Destroy
Send , ^r
Return

#IfWinActive



#IfWinActive ahk_exe UnrealEditor.exe

!^f5::
Menu MyMenu, Add,Multiplay, item1handler
Menu MyMenu, Add,Power, item2handler
Menu MyMenu, Add, Parametr, item3handler
Menu MyMenu, Add,Scalar, item4handler
Menu MyMenu, Add,Vector3, item5handler
Menu MyMenu, Add,Minus, item6handler
Menu MyMenu, Add,Divide, item7handler
Menu MyMenu, Add,Lerp, item8handler
Menu MyMenu, Add,Add, item9handler
Menu MyMenu, Add,Component, item10handler
Menu MyMenu, Add,Append, item11handler
Menu MyMenu, Add,TextureSample, item12handler
Menu MyMenu, Add,Coordinate, item13handler
Menu MyMenu, Add,IntenceGr, item14handler
Menu MyMenu, Add,FunctionIN, item15handler
Menu MyMenu, Add,NormalIntense, item16handler
Menu MyMenu, Show
Return

item1handler:
clipboard=
(
   Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_138"
   Begin Object Class=/Script/Engine.MaterialExpressionMultiply Name="MaterialExpressionMultiply_26"
   End Object
   Begin Object Name="MaterialExpressionMultiply_26"
      MaterialExpressionEditorX=1497
      MaterialExpressionEditorY=-176
      MaterialExpressionGuid=B41094224278D01230BD97B0E0537801
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionMultiply'"MaterialExpressionMultiply_26"'
   NodePosX=1497
   NodePosY=-176
   NodeGuid=B3523CA5497B601A1F49439E959F9151
   CustomProperties Pin (PinId=C3C548894F6E1BC3BA60ECB1DC363FB7,PinName="A",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=052DC5274AF160023B67D09AC271F161,PinName="B",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=C34AF39A44EC463B6873F996485686E0,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object 
)
Send,^v
Return


item2handler:
clipboard=
(
   Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_151"
   Begin Object Class=/Script/Engine.MaterialExpressionPower Name="MaterialExpressionPower_11"
   End Object
   Begin Object Name="MaterialExpressionPower_11"
      Exponent=(Expression=MaterialExpressionScalarParameter'"MaterialGraphNode_152.MaterialExpressionScalarParameter_1"')
      MaterialExpressionEditorX=-640
      MaterialExpressionEditorY=368
      MaterialExpressionGuid=3B01C3D04243B101B66222AD26542AB2
      Material=PreviewMaterial'"/Engine/Transient.MM_FakeGlass"'
   End Object
   MaterialExpression=MaterialExpressionPower'"MaterialExpressionPower_11"'
   NodePosX=-640
   NodePosY=368
   NodeGuid=F585C37649858942F4527D92497AD8D4
   CustomProperties Pin (PinId=4DEC40894D9201391AEED7BFA5A63182,PinName="Base",PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=DF89B7B741166C2EE71D9F9395030DB3,PinName="Exp",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_152 C200004C4EDCBC7F2D672D865766BEF6,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=3B440CEB4A1C20FEB9FBC29A41FF4D1E,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_152"
   Begin Object Class=/Script/Engine.MaterialExpressionScalarParameter Name="MaterialExpressionScalarParameter_1"
   End Object
   Begin Object Name="MaterialExpressionScalarParameter_1"
      ParameterName="Power"
      ExpressionGUID=BE561B34416DF6363F96788DED5ADC77
      MaterialExpressionEditorX=-816
      MaterialExpressionEditorY=432
      MaterialExpressionGuid=119CAB6F46C55414F8678C943524E111
      Material=PreviewMaterial'"/Engine/Transient.MM_FakeGlass"'
   End Object
   MaterialExpression=MaterialExpressionScalarParameter'"MaterialExpressionScalarParameter_1"'
   NodePosX=-816
   NodePosY=432
   bCanRenameNode=True
   NodeGuid=4730989C4129F4D201414A80F49790F4
   CustomProperties Pin (PinId=C200004C4EDCBC7F2D672D865766BEF6,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_151 DF89B7B741166C2EE71D9F9395030DB3,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object

)
Send,^v
Return

item3handler:
clipboard=
(
   Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_152"
   Begin Object Class=/Script/Engine.MaterialExpressionScalarParameter Name="MaterialExpressionScalarParameter_53"
   End Object
   Begin Object Name="MaterialExpressionScalarParameter_53"
      ParameterName="s"
      ExpressionGUID=C06D79E346D70D4E9B4CD996E4E795D4
      MaterialExpressionEditorX=1723
      MaterialExpressionEditorY=-1788
      MaterialExpressionGuid=119CAB6F46C55414F8678C943524E111
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionScalarParameter'"MaterialExpressionScalarParameter_53"'
   NodePosX=1723
   NodePosY=-1788
   bCanRenameNode=True
   NodeGuid=4817A87147708033178E88AC707C3093
   CustomProperties Pin (PinId=C200004C4EDCBC7F2D672D865766BEF6,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
)
Send,^v
Return

item4handler:
clipboard=
(
    Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_153"
   Begin Object Class=/Script/Engine.MaterialExpressionConstant Name="MaterialExpressionConstant_3"
   End Object
   Begin Object Name="MaterialExpressionConstant_3"
      MaterialExpressionEditorX=1436
      MaterialExpressionEditorY=-1640
      MaterialExpressionGuid=C10013064F9AFF815A81F287626E0CB7
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionConstant'"MaterialExpressionConstant_3"'
   NodePosX=1436
   NodePosY=-1640
   NodeGuid=E7EE39174A3724FC5B94C19BC45AB8D9
   CustomProperties Pin (PinId=1AEC31A54E4B1ABA1C6B9CB27E5B4767,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object

)
Send,^v
Return

item5handler:
clipboard=
(
  Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_154"
   Begin Object Class=/Script/Engine.MaterialExpressionConstant3Vector Name="MaterialExpressionConstant3Vector_1"
   End Object
   Begin Object Name="MaterialExpressionConstant3Vector_1"
      MaterialExpressionEditorX=1411
      MaterialExpressionEditorY=-1757
      MaterialExpressionGuid=AB8DAE6847AEC653B427F0BB34C10508
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionConstant3Vector'"MaterialExpressionConstant3Vector_1"'
   NodePosX=1411
   NodePosY=-1757
   NodeGuid=404E10094BF235C12AAE8199F96F8293
   CustomProperties Pin (PinId=C9CE975B462E04E1436DF59239534AF1,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
  
)
Send,^v
Return

item6handler:
clipboard=
(
    Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_155"
   Begin Object Class=/Script/Engine.MaterialExpressionOneMinus Name="MaterialExpressionOneMinus_0"
   End Object
   Begin Object Name="MaterialExpressionOneMinus_0"
      MaterialExpressionEditorX=1714
      MaterialExpressionEditorY=-1686
      MaterialExpressionGuid=D8C642694C44B363502130A293293B9A
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionOneMinus'"MaterialExpressionOneMinus_0"'
   NodePosX=1714
   NodePosY=-1686
   NodeGuid=A60576B0452FA051F682C8A8DE1AC9E6
   CustomProperties Pin (PinId=9A7E35FF4EAC7B7EA236109E7FCA1280,PinName="Input",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=5C5B58694E7BA16E1CD6EFA5442D6EF5,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object

)
Send,^v
Return

item7handler:
clipboard=
(
 Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_156"
   Begin Object Class=/Script/Engine.MaterialExpressionDivide Name="MaterialExpressionDivide_1"
   End Object
   Begin Object Name="MaterialExpressionDivide_1"
      MaterialExpressionEditorX=1952
      MaterialExpressionEditorY=-1636
      MaterialExpressionGuid=33F46D0D48EB1F0426BBFD8B9F2FF85A
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionDivide'"MaterialExpressionDivide_1"'
   NodePosX=1952
   NodePosY=-1636
   NodeGuid=BE3F70F045A00B809AF4758A9C9C54C6
   CustomProperties Pin (PinId=044BFF43429D006BCB9D7DB14FD93644,PinName="A",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=12D560A14B75EC159307C18DBF277E78,PinName="B",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=24D05E9F4EF5BCD28D8E10BF3DAD50CE,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
   
)
Send,^v
Return

item8handler:
clipboard=
(
    Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_157"
   Begin Object Class=/Script/Engine.MaterialExpressionLinearInterpolate Name="MaterialExpressionLinearInterpolate_2"
   End Object
   Begin Object Name="MaterialExpressionLinearInterpolate_2"
      MaterialExpressionEditorX=828
      MaterialExpressionEditorY=-1641
      MaterialExpressionGuid=719A408F497D0771DC111E9CE21A5F2A
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionLinearInterpolate'"MaterialExpressionLinearInterpolate_2"'
   NodePosX=828
   NodePosY=-1641
   NodeGuid=EAFFA2C5482299E7B94A53BA0EBBB5B8
   CustomProperties Pin (PinId=DE19EFAC4C48AD028A76828CE2DA7B3D,PinName="A",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=F910C2D94C3EF205B62267A5CEFCC6AE,PinName="B",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=C9DA67A8475E2DDD08B729944BA4D435,PinName="Alpha",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=861402C744DBD0574FB9AFA5F47BB6AF,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object

)
Send,^v
Return


item9handler:
clipboard=
(
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_48"
   Begin Object Class=/Script/Engine.MaterialExpressionAdd Name="MaterialExpressionAdd_1"
   End Object
   Begin Object Name="MaterialExpressionAdd_1"
      MaterialExpressionEditorX=1024
      MaterialExpressionEditorY=432
      MaterialExpressionGuid=6489CB7E4B628863CAA35C9F0A6F751A
      Material=PreviewMaterial'"/Engine/Transient.MM_WallMaster"'
   End Object
   MaterialExpression=MaterialExpressionAdd'"MaterialExpressionAdd_1"'
   NodePosX=1024
   NodePosY=432
   NodeGuid=8FAEEF4F43B281D724D6C0A98FE892B4
   CustomProperties Pin (PinId=4ECCC8DF45AB5E9A2CBBC78D4F09AEB7,PinName="A",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=9F37FC87469B75C42548B5964BF8AA3D,PinName="B",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=4F24DDAA461551B73C1DDBAB25643579,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object

)
Send,^v
Return


item10handler:
clipboard=
(
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_51"
   Begin Object Class=/Script/Engine.MaterialExpressionComponentMask Name="MaterialExpressionComponentMask_0"
   End Object
   Begin Object Name="MaterialExpressionComponentMask_0"
      R=True
      G=True
      MaterialExpressionEditorX=1024
      MaterialExpressionEditorY=320
      MaterialExpressionGuid=A303DB8D48B086D6DAEEBD8C29E79DC5
      Material=PreviewMaterial'"/Engine/Transient.MM_WallMaster"'
   End Object
   MaterialExpression=MaterialExpressionComponentMask'"MaterialExpressionComponentMask_0"'
   NodePosX=1024
   NodePosY=320
   NodeGuid=BFC0A57842527DBA6D4C25811D3EFBE8
   CustomProperties Pin (PinId=2CF057C94912C0BD085DE0914CDE92C1,PinName="Input",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=90DCEBF54623ABE2EBB1AEB48D1A62A5,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object

)
Send,^v
Return


item11handler:
clipboard=
(
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_49"
   Begin Object Class=/Script/Engine.MaterialExpressionAppendVector Name="MaterialExpressionAppendVector_0"
   End Object
   Begin Object Name="MaterialExpressionAppendVector_0"
      MaterialExpressionEditorX=1024
      MaterialExpressionEditorY=192
      MaterialExpressionGuid=4CAAD8BC4108583021888AB1691B1573
      Material=PreviewMaterial'"/Engine/Transient.MM_WallMaster"'
   End Object
   MaterialExpression=MaterialExpressionAppendVector'"MaterialExpressionAppendVector_0"'
   NodePosX=1024
   NodePosY=192
   NodeGuid=84F7FFBA435ADB688FF06B90B07EC31D
   CustomProperties Pin (PinId=A7E6B2854D820BED9103B7B43187A859,PinName="A",PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=F362B0CD4D9F6FAA15CEAA840602ADE1,PinName="B",PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=C29F1AE74284296A02830CA3FE429C74,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object

)
Send,^v
Return


item12handler:
clipboard=
(
    Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_158"
   Begin Object Class=/Script/Engine.MaterialExpressionTextureSample Name="MaterialExpressionTextureSample_2"
   End Object
   Begin Object Name="MaterialExpressionTextureSample_2"
      MaterialExpressionEditorX=1552
      MaterialExpressionEditorY=-1616
      MaterialExpressionGuid=E1B74C1A4CBAC105223DE4A7F07D8528
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionTextureSample'"MaterialExpressionTextureSample_2"'
   NodePosX=1552
   NodePosY=-1616
   NodeGuid=AF7880A943A3BD22ECADCA8D66776CD4
   CustomProperties Pin (PinId=D2C38F304C58D76806C36394C535D324,PinName="UVs",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=8059A1ED414973EE7F5EE1B1844C39F0,PinName="Tex",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=AA7B22C14FF584BBBEFBA18CF1A9A9EC,PinName="Apply View MipBias",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=AC4496B7453EA08EA93A8F83C27297E0,PinName="RGB",Direction="EGPD_Output",PinType.PinCategory="mask",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=DA7D4E1148A9350F5F3EC7BFE7DCC4DA,PinName="R",Direction="EGPD_Output",PinType.PinCategory="mask",PinType.PinSubCategory="red",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=3CCDB3FF44DEAB34D3BA089763D30EE3,PinName="G",Direction="EGPD_Output",PinType.PinCategory="mask",PinType.PinSubCategory="green",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=DC495A074C804BC3C4463F9732BBDD3C,PinName="B",Direction="EGPD_Output",PinType.PinCategory="mask",PinType.PinSubCategory="blue",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=BF6A900448D9727CD17B2A9929544DBF,PinName="A",Direction="EGPD_Output",PinType.PinCategory="mask",PinType.PinSubCategory="alpha",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=DC5DA54F4F57189B4A802296C135674C,PinName="RGBA",Direction="EGPD_Output",PinType.PinCategory="mask",PinType.PinSubCategory="rgba",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object

)
Send,^v
Return

item13handler:
clipboard=
(
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_159"
   Begin Object Class=/Script/Engine.MaterialExpressionTextureCoordinate Name="MaterialExpressionTextureCoordinate_0"
   End Object
   Begin Object Name="MaterialExpressionTextureCoordinate_0"
      MaterialExpressionEditorX=-784
      MaterialExpressionEditorY=-64
      MaterialExpressionGuid=79164D894209E30C1E6FE7AA467F8695
      Material=PreviewMaterial'"/Engine/Transient.TX_WindowMask_Mat"'
   End Object
   MaterialExpression=MaterialExpressionTextureCoordinate'"MaterialExpressionTextureCoordinate_0"'
   NodePosX=-784
   NodePosY=-64
   NodeGuid=52DFE02349E3C6AEE0AFB6821A738DBB
   CustomProperties Pin (PinId=5BE309994F1775D01AC553A9C62DE2F4,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_138 C3C548894F6E1BC3BA60ECB1DC363FB7,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_138"
   Begin Object Class=/Script/Engine.MaterialExpressionMultiply Name="MaterialExpressionMultiply_9"
   End Object
   Begin Object Name="MaterialExpressionMultiply_9"
      A=(Expression=MaterialExpressionTextureCoordinate'"MaterialGraphNode_159.MaterialExpressionTextureCoordinate_0"')
      B=(Expression=MaterialExpressionScalarParameter'"MaterialGraphNode_152.MaterialExpressionScalarParameter_15"')
      MaterialExpressionEditorX=-608
      MaterialExpressionEditorY=-64
      MaterialExpressionGuid=B41094224278D01230BD97B0E0537801
      Material=PreviewMaterial'"/Engine/Transient.TX_WindowMask_Mat"'
   End Object
   MaterialExpression=MaterialExpressionMultiply'"MaterialExpressionMultiply_9"'
   NodePosX=-608
   NodePosY=-64
   NodeGuid=57CFD7F2413F267AEFCD56A2E81C868B
   CustomProperties Pin (PinId=C3C548894F6E1BC3BA60ECB1DC363FB7,PinName="A",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_159 5BE309994F1775D01AC553A9C62DE2F4,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=052DC5274AF160023B67D09AC271F161,PinName="B",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_152 C200004C4EDCBC7F2D672D865766BEF6,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=C34AF39A44EC463B6873F996485686E0,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_152"
   Begin Object Class=/Script/Engine.MaterialExpressionScalarParameter Name="MaterialExpressionScalarParameter_15"
   End Object
   Begin Object Name="MaterialExpressionScalarParameter_15"
      ParameterName="Tiling"
      ExpressionGUID=4870342749A7539F53738D984C4F3A11
      MaterialExpressionEditorX=-784
      MaterialExpressionEditorY=32
      MaterialExpressionGuid=119CAB6F46C55414F8678C943524E111
      Material=PreviewMaterial'"/Engine/Transient.TX_WindowMask_Mat"'
   End Object
   MaterialExpression=MaterialExpressionScalarParameter'"MaterialExpressionScalarParameter_15"'
   NodePosX=-784
   NodePosY=32
   bCanRenameNode=True
   NodeGuid=B6598D7F482B39AEFCA4C1AEA33E1D2D
   CustomProperties Pin (PinId=C200004C4EDCBC7F2D672D865766BEF6,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_138 052DC5274AF160023B67D09AC271F161,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object

   
)
Send,^v
Return



item14handler:
clipboard= 
(
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_141"
   Begin Object Class=/Script/Engine.MaterialExpressionMultiply Name="MaterialExpressionMultiply_26"
   End Object
   Begin Object Name="MaterialExpressionMultiply_26"
      B=(Expression=MaterialExpressionScalarParameter'"MaterialGraphNode_144.MaterialExpressionScalarParameter_48"')
      MaterialExpressionEditorX=1449
      MaterialExpressionEditorY=-1376
      MaterialExpressionGuid=B41094224278D01230BD97B0E0537801
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionMultiply'"MaterialExpressionMultiply_26"'
   NodePosX=1449
   NodePosY=-1376
   NodeGuid=B3523CA5497B601A1F49439E959F9151
   CustomProperties Pin (PinId=C3C548894F6E1BC3BA60ECB1DC363FB7,PinName="A",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=052DC5274AF160023B67D09AC271F161,PinName="B",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_144 A6389BA94BA80A7D71FC46AF02D1CF00,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=C34AF39A44EC463B6873F996485686E0,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_139 303F173840BEFD20FAB43AAF8133F54A,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_139"
   Begin Object Class=/Script/Engine.MaterialExpressionPower Name="MaterialExpressionPower_9"
   End Object
   Begin Object Name="MaterialExpressionPower_9"
      Base=(Expression=MaterialExpressionMultiply'"MaterialGraphNode_141.MaterialExpressionMultiply_26"')
      Exponent=(Expression=MaterialExpressionScalarParameter'"MaterialGraphNode_143.MaterialExpressionScalarParameter_49"')
      MaterialExpressionEditorX=1637
      MaterialExpressionEditorY=-1376
      MaterialExpressionGuid=3D9D798F49CC27E3725DA6B1975F7C9F
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionPower'"MaterialExpressionPower_9"'
   NodePosX=1637
   NodePosY=-1376
   NodeGuid=5090A8B44CC8D11A10D0EFB5A39DB9B7
   CustomProperties Pin (PinId=303F173840BEFD20FAB43AAF8133F54A,PinName="Base",PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_141 C34AF39A44EC463B6873F996485686E0,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=6353354D4072B9AD1731AE963ABBEA46,PinName="Exp",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_143 A6389BA94BA80A7D71FC46AF02D1CF00,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=6BF3F90C4F1B2F7DB14992BE640C7DA1,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_140 2F40DFE54B08CDBA3FD4569A775A6CB0,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_140"
   Begin Object Class=/Script/Engine.MaterialExpressionSaturate Name="MaterialExpressionSaturate_2"
   End Object
   Begin Object Name="MaterialExpressionSaturate_2"
      Input=(Expression=MaterialExpressionPower'"MaterialGraphNode_139.MaterialExpressionPower_9"')
      MaterialExpressionEditorX=1824
      MaterialExpressionEditorY=-1376
      MaterialExpressionGuid=BAA4BBD645EB0B5E6937F1B31DA70514
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionSaturate'"MaterialExpressionSaturate_2"'
   NodePosX=1824
   NodePosY=-1376
   NodeGuid=F20B863844E87509993FCD9FBAB50EAF
   CustomProperties Pin (PinId=2F40DFE54B08CDBA3FD4569A775A6CB0,PinName="Input",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_139 6BF3F90C4F1B2F7DB14992BE640C7DA1,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=BC8FB0D4490BBA042999F286D0395DD1,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_144"
   Begin Object Class=/Script/Engine.MaterialExpressionScalarParameter Name="MaterialExpressionScalarParameter_48"
   End Object
   Begin Object Name="MaterialExpressionScalarParameter_48"
      ParameterName="Multi"
      ExpressionGUID=F240CB8D40D51C2AA45ECE9D824EC08B
      MaterialExpressionEditorX=1216
      MaterialExpressionEditorY=-1280
      MaterialExpressionGuid=010F17A1403B07E3019E2980F98085C0
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionScalarParameter'"MaterialExpressionScalarParameter_48"'
   NodePosX=1216
   NodePosY=-1280
   bCanRenameNode=True
   NodeGuid=78FEA2BB4B1662D632010FB42A45705A
   CustomProperties Pin (PinId=A6389BA94BA80A7D71FC46AF02D1CF00,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_141 052DC5274AF160023B67D09AC271F161,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_143"
   Begin Object Class=/Script/Engine.MaterialExpressionScalarParameter Name="MaterialExpressionScalarParameter_49"
   End Object
   Begin Object Name="MaterialExpressionScalarParameter_49"
      ParameterName="Power"
      ExpressionGUID=2C5EA08846823996CBE37EB8599C9906
      MaterialExpressionEditorX=1440
      MaterialExpressionEditorY=-1264
      MaterialExpressionGuid=010F17A1403B07E3019E2980F98085C0
      Material=PreviewMaterial'"/Engine/Transient.MM_MasterRoad"'
   End Object
   MaterialExpression=MaterialExpressionScalarParameter'"MaterialExpressionScalarParameter_49"'
   NodePosX=1440
   NodePosY=-1264
   bCanRenameNode=True
   NodeGuid=3953B2EF49933DB46F6B3D8F3DC8F491
   CustomProperties Pin (PinId=A6389BA94BA80A7D71FC46AF02D1CF00,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_139 6353354D4072B9AD1731AE963ABBEA46,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
)
Send,^v
Return

item15handler:
clipboard= 
(
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_54"
   Begin Object Class=/Script/Engine.MaterialExpressionFunctionInput Name="MaterialExpressionFunctionInput_15"
   End Object
   Begin Object Name="MaterialExpressionFunctionInput_15"
      Id=2E69CD77495108523E116EBD17FF4DB4
      InputType=FunctionInput_Scalar
      MaterialExpressionEditorX=-1984
      MaterialExpressionEditorY=-720
      MaterialExpressionGuid=69CED22E41B2897FE2A527AEF0C99B42
      Material=Material'"/Engine/Transient.Material_0"'
   End Object
   MaterialExpression=MaterialExpressionFunctionInput'"MaterialExpressionFunctionInput_15"'
   NodePosX=-1984
   NodePosY=-720
   NodeGuid=33E0A3C54705B2C0D530C6B3FC3449D5
   CustomProperties Pin (PinId=95FD4E6A42D78A286F231181321DD487,PinName="Preview",PinType.PinCategory="optional",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=0ED4E0F1468FB8BA9B7214991587872B,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_53 6CA456924258BA9AF64D60AA604EE82D,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
)
Send,^v
Return


item16handler:
clipboard= 
(
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_10"
   Begin Object Class=/Script/Engine.MaterialExpressionMaterialFunctionCall Name="MaterialExpressionMaterialFunctionCall_1"
   End Object
   Begin Object Name="MaterialExpressionMaterialFunctionCall_1"
      MaterialFunction=MaterialFunction'"/Engine/Functions/Engine_MaterialFunctions01/Texturing/FlattenNormal.FlattenNormal"'
      FunctionInputs(0)=(ExpressionInputId=28AAF19044840619BEBDFC824A64C7A0,Input=(Expression=MaterialExpressionTextureSample'"MaterialExpressionTextureSample_2"',InputName="Normal",Mask=1,MaskR=1,MaskG=1,MaskB=1))
      FunctionInputs(1)=(ExpressionInputId=03CE862F4BD8BFCC0550048115A40E71,Input=(Expression=MaterialExpressionOneMinus'"MaterialGraphNode_11.MaterialExpressionOneMinus_4"',InputName="Flatness"))
      FunctionOutputs(0)=(ExpressionOutputId=CF2DF7CD446736F3FF50B0A17088C5A7,Output=(OutputName="Result"))
      MaterialExpressionEditorX=96
      MaterialExpressionEditorY=48
      MaterialExpressionGuid=284A5D57446D21307EB138BC040D63CD
      Material=PreviewMaterial'"/Engine/Transient.TX_WindowMask_Mat"'
      Outputs(0)=(OutputName="Result")
   End Object
   MaterialExpression=MaterialExpressionMaterialFunctionCall'"MaterialExpressionMaterialFunctionCall_1"'
   NodePosX=96
   NodePosY=48
   NodeGuid=6B3892D24DD4EC79F691269DC567E366
   CustomProperties Pin (PinId=794B93F2404F058B713816B1D80BA556,PinName="Normal",PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_57 AC4496B7453EA08EA93A8F83C27297E0,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=98E5357540665E6BB3CAF8BFF452350B,PinName="Flatness",PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_11 220B5650434E95EB9F63E19237F4364F,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=15373FD8473C63F8E9EC0FB712A063DD,PinName="Result",Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_Root_0 334445A542FEA49C943846BDA18E650A,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_11"
   Begin Object Class=/Script/Engine.MaterialExpressionOneMinus Name="MaterialExpressionOneMinus_4"
   End Object
   Begin Object Name="MaterialExpressionOneMinus_4"
      Input=(Expression=MaterialExpressionScalarParameter'"MaterialGraphNode_60.MaterialExpressionScalarParameter_14"')
      MaterialExpressionEditorX=-48
      MaterialExpressionEditorY=176
      MaterialExpressionGuid=27A63EB64C10588D412A36AEA5258DF6
      Material=PreviewMaterial'"/Engine/Transient.TX_WindowMask_Mat"'
   End Object
   MaterialExpression=MaterialExpressionOneMinus'"MaterialExpressionOneMinus_4"'
   NodePosX=-48
   NodePosY=176
   NodeGuid=3725354F452404E4F3C7668DC0CAC374
   CustomProperties Pin (PinId=5CCA65BA4C3ED6BE49EB8DB222629BEC,PinName="Input",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),PinType.PinCategory="required",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_60 C200004C4EDCBC7F2D672D865766BEF6,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
   CustomProperties Pin (PinId=220B5650434E95EB9F63E19237F4364F,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_10 98E5357540665E6BB3CAF8BFF452350B,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object
Begin Object Class=/Script/UnrealEd.MaterialGraphNode Name="MaterialGraphNode_60"
   Begin Object Class=/Script/Engine.MaterialExpressionScalarParameter Name="MaterialExpressionScalarParameter_14"
   End Object
   Begin Object Name="MaterialExpressionScalarParameter_14"
      ParameterName="NormalIntence"
      ExpressionGUID=41EADC5643494A59812CF9ADA458DCB4
      MaterialExpressionEditorX=-224
      MaterialExpressionEditorY=176
      MaterialExpressionGuid=119CAB6F46C55414F8678C943524E111
      Material=PreviewMaterial'"/Engine/Transient.TX_WindowMask_Mat"'
   End Object
   MaterialExpression=MaterialExpressionScalarParameter'"MaterialExpressionScalarParameter_14"'
   NodePosX=-224
   NodePosY=176
   bCanRenameNode=True
   NodeGuid=D7B5D0CC46165C5837936B988510BC94
   CustomProperties Pin (PinId=C200004C4EDCBC7F2D672D865766BEF6,PinName="Output",PinFriendlyName=NSLOCTEXT("MaterialGraphNode", "Space", " "),Direction="EGPD_Output",PinType.PinCategory="",PinType.PinSubCategory="",PinType.PinSubCategoryObject=None,PinType.PinSubCategoryMemberReference=(),PinType.PinValueType=(),PinType.ContainerType=None,PinType.bIsReference=False,PinType.bIsConst=False,PinType.bIsWeakPointer=False,PinType.bIsUObjectWrapper=False,PinType.bSerializeAsSinglePrecisionFloat=False,LinkedTo=(MaterialGraphNode_11 5CCA65BA4C3ED6BE49EB8DB222629BEC,),PersistentGuid=00000000000000000000000000000000,bHidden=False,bNotConnectable=False,bDefaultValueIsReadOnly=False,bDefaultValueIsIgnored=False,bAdvancedView=False,bOrphanedPin=False,)
End Object


)
Send,^v
Return
#IfWinActive






