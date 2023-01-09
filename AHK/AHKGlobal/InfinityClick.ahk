#SingleInstance,Force

~RButton & LButton:: 
;hotkey - You can also use mouse clicks such as ~LButton 


if (KeyPressCount > 0)   { 	
	KeyPressCount += 1  
}  else { 	
	KeyPressCount := 1 
} 

tooltip, % KeyPressCount 

SetTimer, KeyPressMonitor, 300 
return 

KeyPressMonitor: 
if (KeyPressCount = 1)   { 	
	;msgbox single press 	
	Run, calc.exe 
}  else if (KeyPressCount = 2)  { 	
	;msgbox double press 	
        ;Run, cmd.exe
        send,^+n 
} else  if (KeyPressCount = 3)	{ 	
	;msgbox triple or more presses 	
	Run, notepad.exe 
} else  if (KeyPressCount > 4)	{ 	
	;msgbox triple or more presses 	
	Send, !{f4}
} 
KeyPressCount := 0 
SetTimer, KeyPressMonitor, Off 

tooltip
Return


ESC::ExitApp 
return



