#SingleInstance, Force
CoordMode, Mouse, Screen
SetWinDelay, -1
;borrowed some commands from https://www.autohotkey.com/boards/viewtopic.php?f=7&t=31764

;to upsize/downsize text size two options are available:
;• manually zoom in/out by ctrl + mouse scroll
;• open notepad from start menu then go to Format > Font > resize font > Exit notepad (new font size will be remembered)
#b::
Run, notepad.exe , , , PID
WinWait, ahk_PID %PID%
WinGet, hWnd, ID, ahk_PID %PID%

ControlGet, scrollHandle, Hwnd,, Edit1, ahk_id %hWnd%
WinSet, Style, -0x200000, ahk_id %scrollHandle%
ControlGet, WordWrap, Style,, Edit1, ahk_id %hWnd%
If (WordWrap & 0x100000)
	WinMenuSelectItem, AHK_ID %hWnd%,,Format, Word Wrap
WinSet, Style, -0xC00000, AHK_ID %hWnd%
WinSet, Alwaysontop, , AHK_ID %hWnd%
DllCall("SetMenu", uint, hWnd, uint, 0)
SendMessage, 0xD3, 0x1, 5, Edit1, % "ahk_id " hWnd
SendMessage, 0xD3, 0x2, 5, Edit1, % "ahk_id " hWnd

SetTimer, AutoSave, 200000

return


AutoSave:
Tooltip, Notepad Autosave in progress..`nPress ESC to Exit
KeyWait, ESC , D T4
Tooltip,

If !ErrorLevel {
	return
}

DetectHiddenWindows, On
WinGet, vWinList, List, ahk_class Notepad
Loop, % vWinList
{
	hWnd := vWinList%A_Index%
	WinGetTitle, vWinTitle, % "ahk_id " hWnd

	vWinTitle := RegExReplace(vWinTitle, " - Notepad$")
	Loop, 31
		vWinTitle := StrReplace(vWinTitle, Chr(A_Index))
	Loop, Parse, % "\/:*?" Chr(34) "<>|"
		vWinTitle := StrReplace(vWinTitle, A_LoopField)
	ControlGetText, vText, Edit1, % "ahk_id " hWnd
	vPath = %A_Desktop%\%vWinTitle% (%hWnd%) %A_Now%.txt
	FileAppend, % vText, % "*" vPath, UTF-8
}
DetectHiddenWindows, Off
return

;scroll
#IfWinActive, ahk_class Notepad
WheelUp::ScrollLines(-5)
WheelDown::ScrollLines(5)

#!Up::
WinGetPos, X, Y, W, H, A
WinMove, A,,, Y - 80
return

#!Down::
WinGetPos, X, Y, W, H, A
WinMove, A,,, Y + 80
return

#!Left::
WinGetPos, X, Y, W, H, A
WinMove, A,, X - 150
return

#!Right::
WinGetPos, X, Y, W, H, A
WinMove, A,, X + 150
return

#IfWinActive

;source: https://autohotkey.com/board/topic/87514-sendmessage-scroll-down-a-certain-number-of-lines/?p=556001
ScrollLines(lines, _hWnd:="") {
    static EM_LINESCROLL := 0xB6
    if (!_hWnd) {
        ControlGetFocus, c, A
        ControlGet, _hWnd, hWnd,, %c%, A
    }
    PostMessage, EM_LINESCROLL, 0, lines, , ahk_id %_hWnd%
return
}

;resize notepad
#If MouseIsOver("ahk_class Notepad")
RButton & LButton::
MouseGetPos, , , TempID
WinGetPos, , , Temp_Width, Temp_Height, ahk_id %TempID%
If (Temp_Width = 100 && Temp_Height = 50) {
  WinMove, ahk_id %TempID%, , , , % %TempID%_Width, % %TempID%_Height
} else {
%TempID%_Width := Temp_Width
%TempID%_Height := Temp_Height
WinMove, ahk_id %TempID%, , , , 100, 50
}

;click anywhere to move
~Alt & LButton::
MouseGetPos, Mouse_Start_X, Mouse_Start_Y, Selected_Window
WinGet, Window_State, MinMax, ahk_id %Selected_Window%
if Window_State = 0
    SetTimer, Label_Loop, 1
return

#If

MouseIsOver(WinTitle)
{
	MouseGetPos,,, ID
	return WinExist(WinTitle " ahk_id " ID)
}

Label_Loop:
MouseGetPos, Mouse_Current_X, Mouse_Current_Y
WinGetPos, Selected_Window_X, Selected_Window_Y,,, ahk_id %Selected_Window%
WinMove, ahk_id %Selected_Window%,, Selected_Window_X + Mouse_Current_X - Mouse_Start_X, Selected_Window_Y + Mouse_Current_Y - Mouse_Start_Y

Mouse_Start_X := Mouse_Current_X 
Mouse_Start_Y := Mouse_Current_Y

GetKeyState, LButton_State, LButton, P 
if LButton_State = U  
{
    SetTimer, Label_Loop, off
    return
}

