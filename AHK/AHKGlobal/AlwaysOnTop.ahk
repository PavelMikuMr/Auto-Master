#SingleInstance, Force
;~ If !A_IsAdmin
 ;~ Run *RunAs "%A_ScriptFullPath%"

f3:: Gosub, Alwaysontop

AlwaysonTop:
WinGet, ExStyle, ExStyle, A
if (ExStyle & 0x8) {
 Winset, Alwaysontop, Off , A
} else {
 Winset, Alwaysontop, , A
}
return