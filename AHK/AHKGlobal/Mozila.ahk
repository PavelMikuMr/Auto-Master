#IfWinActive ahk_exe firefox.exe 
^+WheelDown::
Send, ^{PGDN}
^+WheelUp::
Send, ^{PGUP}
	; ^CapsLock::Send, ^{PGUP}
	; ^Tab::Send, ^{PGDN}
#IfWinActive