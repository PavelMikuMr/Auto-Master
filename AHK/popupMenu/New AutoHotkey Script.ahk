#NoEnv
#Include  %A_ScriptDir%
#Include PUM.ahk
#Include PUM_foos.ahk
#singleinstance force
StartTicks:=A_TickCount
ClipBoardHistory:=Object()
ClipBoardEnabled=1
previousClip=%clipboard%

if A_AhkPath=C:\Program Files\AutoHotkey\AutoHotkey.exe
{
	run "%A_ScriptDir%\AutoHotkey.exe" "%A_ScriptFullPath%"
	exitapp
}

; parameters of the PUM object, the manager of the menus
pumParams := { "SelMethod" : "fill"            ;item selection method, may be frame,fill
                ,"selTColor" : 0x000000         ;selection text color
                ,"selBGColor" : -1              ;selection background color, -1 means invert current color
                ,"oninit"      : "PUM_out"      ;function which will be called when any of this events happen, se it below
                ,"onuninit"    : "PUM_out"
                ,"onselect"    : "PUM_out"
                ,"onrbutton"   : "PUM_out"
                ,"onmbutton"   : "PUM_out"
                ,"onrun"       : "PUM_out" }
                
;PUM_Menu parameters
menuParams1 := { "bgcolor" : 0x36311f   ;background color of the menu R
            , "iconssize" : 0          ;size of icons in the menu
            , "tcolor" : 0xafc9d3 }     ;text color of the menu items

;create an instance of PUM object, it is best to have only one of such in the program
pm := new PUM( pumParams )

PUM_out( msg, obj )
{
  if ( msg = "onselect" )
    tooltip %  obj.tooltip 
;  if ( msg = "oninit" )
;    tooltip % "menu init: " obj.handle
;  if ( msg = "onuninit" )
;    tooltip % "menu uninit: " obj.handle
;  if ( msg = "onrbutton" )
;    tooltip % "Right clicked: " obj.name
;  if ( msg = "onmbutton" )
;    tooltip % "Middle clicked: " obj.name
;  if ( msg = "onrun" )
;    tooltip % "Item runned: " obj.name
}

OnClipboardChange:
	if (ClipBoardEnabled=1) and ((A_TickCount-StartTicks)>1)
	{
	currentClip=%clipboard% 
	currentClipAll=%clipboardall% 
	If (A_EventInfo=1) and (currentClip <> previousClip)
	{
		previousClip=%clipboard% 
		ClipSave(ClipBoardHistory,currentclip, currentclipall,5)	
	}
	}
	
Return

ClipSave(ClipBoardHistory,clip, clipall,maxclips=20)
{
	ClipBoardHistory.insert(Object())
	index:=ClipBoardHistory.MaxIndex()
	ClipBoardHistory[index]["plain"]:=clip
	ClipBoardHistory[index]["All"]:=clipall
	if (index>maxclips)
		ClipBoardHistory.Remove(ClipBoardHistory.MinIndex())
}

^!v::
menu := pm.CreateMenu( menuParams1 )
index:=ClipBoardHistory.maxIndex()
if index=
	return

while Index>=ClipBoardHistory.minIndex()
{
	Description:=ClipBoardHistory[Index]["plain"]
	FullDescription:=Description
	if(StrLen(Description)>35) 
	{ 
		toCut:=StrLen(Description)-18 
		StringMid, itemTemp1, Description, 1, 12 
		StringTrimLeft, itemTemp2, Description, %toCut% 
		Description=%itemTemp1%...%itemTemp2% 
	} 
	if index<10
	MenuString:="&" . (ClipBoardHistory.maxindex()-Index+1) . "-" . Description
	else
	MenuString:= (ClipBoardHistory.maxindex()-Index+1) . "-" . Description
  menu.Add( { "name" : MenuString
            , "bold" : 1
			, "index" : Index
			, "tooltip" : ClipBoardHistory[Index]["plain"]})
			
	index--
}
WinGet, ActiveWindow , ID, A
 item := menu.Show( A_ScreenWidth/3, A_ScreenHeight/3 ) 
tooltip
WinActivate , ahk_id %ActiveWindow%
WinWaitActive, ahk_id %ActiveWindow%
if item
{
ClipBoardEnabled=0
test:=item.index

tempClip:=clipboard
clipboard:=ClipBoardHistory[test]["plain"]
send, ^v
clipboard:=tempClip
ClipBoardEnabled=1
}

Menu.destroy()
return