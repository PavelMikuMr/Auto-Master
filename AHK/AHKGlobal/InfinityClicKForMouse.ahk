#SingleInstance,Force

~RButton & LButton:: 
While GetKeyState ("RButton","P")
{
	If GetKeyState("LButton","P") {
		KeyPressCount += 1
                tooltip, % KeyPressCount
                Sleep 200
                }
}

KeyWait, RButton
SetTimer, KeyPressMonitor , 300

return


KeyPressMonitor: 
if (KeyPressCount = 1)   
{ 	
	msgbox single press 	
	;Run, calc.exe 
}  else if (KeyPressCount = 2)  { 	
	msgbox double press 	
        ;Run, cmd.exe
        ;send,^+n 
} else  if (KeyPressCount > 2)	{ 	
	msgbox triple or more presses 	
	;Run, notepad.exe 
} 
KeyPressCount := 0 
SetTimer, KeyPressMonitor, Off 

tooltip
Return


ESC::ExitApp 
return



