#SingleInstance,Force

~RButton & LButton::

While GetKeyState("RButton", "P")
{
	If GetKeyState("LButton", "P") {
		KeyPressCount += 1
		Sleep 200
	}
}

KeyWait, RButton
SetTimer, KeyPressMonitor, 300

return

KeyPressMonitor:
if (KeyPressCount = 1) ; The key was pressed only once
{
	;msgbox single press
	;Run, calc.exe
}
else if (KeyPressCount = 2) ; The key was pressed twice
{
    Send,^+n
	msgbox double press
	;Run, cmd.exe
}
else if (KeyPressCount > 2)	; The key was pressed more than twice
{
	msgbox triple or more presses
	;Run, Chrome.exe
}
KeyPressCount := 0 ;reset the count to zero
SetTimer, KeyPressMonitor, Off ;turn label off to stop monitoring for key strokes
tooltip, ;turn tooltip off
Return

ESC::ExitApp

return