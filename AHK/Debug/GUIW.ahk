GUIW := 600, GUIH := 400
Menu, SB_ContextMenu, Add, Here I am, MenuHandler ; the context menu
Gui, +LastFound +Resize
;Gui, Color, FFFFFF
Gui, Margin, 10, 10
 
Gui, Add, Button, % " x" 10 " y" 10 " w" 73 " h" 26, % "Button1"
 
Gui, Add, StatusBar, gStatusbarLabel
SB_SetParts(200, 200, 200)
SB_SetText("`tTEXT", 3)
 
Gui, Show, % " w" GUIW " h" GUIH, % "Application"
return ; End automatic execution

GuiEscape:
GuiClose:
ExitApp
return

StatusbarLabel:
if (A_GuiEvent="RightClick" || A_GuiEvent="Normal") && (A_EventInfo=3){ ; clicking or right clicking the 3th part of the stausbar to change the player
	StatusBarGetText, txt, %A_EventInfo%
	Menu, SB_ContextMenu, Show, %A_GuiX%, %A_GuiY%
}
return
MenuHandler:
MsgBox, ,text, the 3rd part text is:`n"%txt%"
return