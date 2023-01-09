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
Menu, MySubMenu2, Add, Free, SubMenu2Label
Menu, Shader, Add, Presets, :MySubMenu2

Menu, Shader, Add, BluePrint, MainMenuBlueBprint ; chaild menu

Menu, Two Menu, Add, AutumnHouse, MainMenuBlueBprint
Menu, Two Menu, Add, Afina, MainMenuBlueBprint
Menu, Two Menu, Add, Winter, MainMenuBlueBprint
Menu, Two Menu, Add, Wolfenstein, MainMenuBlueBprint

Menu, Autumn Two Menu, Add, HousePrint 1, MainMenuBlueBprint1
Menu, Autumn Two Menu, Add, HousePrint 2, MainMenuBlueBprint1
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

f2::
Menu, Shader, Show
return


MainMenuLabel:
If (A_ThisMenuItemPos = 1) {
	Run E:\GlobalLibrary\ShaderLibrary\ShaderLibrary.txt
} else if (A_ThisMenuItemPos = 2) {
	Run E:\GlobalLibrary\ShaderLibrary\AutumnHouse\VetexShader\A001.png
	Run E:\GlobalLibrary\ShaderLibrary\AutumnHouse\VetexShader
}else if (A_ThisMenuItemPos = 3) {
	 Run E:\GlobalLibrary\ShaderLibrary\Afina\Paralax\paralax.png
}else if (A_ThisMenuItemPos = 4) {
	 Run E:\GlobalLibrary\ShaderLibrary\Afina\ShaderAfina+DecalDamage\Stand_stone_master-MaterialGraph_1.png
	 Run E:\GlobalLibrary\ShaderLibrary\Afina\ShaderAfina+DecalDamage
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
	Run, Chrome.exe
}
return



MainMenuBlueBprint1:
If (A_ThisMenuItemPos = 1) {
	MsgBox, you press button 1
} else if (A_ThisMenuItemPos = 2) {
	MsgBox, you press button 2
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

