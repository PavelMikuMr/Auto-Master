#SingleInstance, Forse


IniRead, lastFolder, folderpath.ini, LastInfo, path


SelectedDir2:= lastFolder ;for method 2

;Method 2 (workaround for folders with same name)

F4::	
	KeyWait, F4			; wait release
	KeyWait, F4, D T0.2	; and pressed again within 0.2 seconds
	if ErrorLevel { ; timed-out (only a single press)
		Run, %SelectedDir2%
	} else {
	hWnd := WinExist("A")
	Send !d{ESC}
	WinGet, cList, ControlList, ahk_id %hWnd%
	ControlGet, SelectedDir2, Line, 1, Edit1, ahk_id %hWnd%
	StringGetPos, FolderNameStart, SelectedDir2, \, R1
	FolderName := SubStr(SelectedDir2, FolderNameStart + 2, StrLen(SelectedDir2))
	Tooltip, %FolderName%
	Sleep 1000
	Tooltip,
	} 
return

