#SingleInstance,Force 
a & b::msgbox a ;two-key hotkey 
#if GetKeyState("LCtrl", "P");при нажатой клавише контрол
b & c::msgbox hi ;three-key hotkey 
#if 
ESC::ExitApp
return


GetKeyState, state, Shift
if (state = "D")
    MsgBox At least one Shift key is down.


#if GetKeyState("LShift", "P")
WheelDown::^PgDn

#if GetKeyState("LShift", "P")
WheelUp::^PgUp
; 

