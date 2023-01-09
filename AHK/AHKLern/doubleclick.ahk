~$LButton::
presses += 1
if presses = 1
{
send {LButton}
}
SetTimer, Start, -400
Return
Start:
if presses = 2
{
****Putyourcodehere****
}
presses = 0
return



XButton1 & WheelUp::
    Send,#{Up}
Return

XButton1 & WheelDown::
    Send,#{Down}
Return



