!^+c::
Menu, MainMenu, Add
Menu, MainMenu, deleteAll
 
Menu, MainMenu, Add, 1 CLIP1 = %ClipSave1%, GoClipSave1
Menu, MainMenu, Add, 2 CLIP2 = %ClipSave2%, GoClipSave2
Menu, MainMenu, Add, 3 CLIP3 = %ClipSave3%, GoClipSave3
Menu, MainMenu, Add, 4 CLIP4 = %ClipSave4%, GoClipSave4
Menu, MainMenu, Add, 5 CLIP5 = %ClipSave5%, GoClipSave5
Menu, MainMenu, Add, 
Menu, MainMenu, Add, 6 Clear All, GoClipClearAll
 
Menu, MainMenu, Show
Return

GoClipSave1:
HotKey, !^+c, Off
send ^c
HotKey, !^+c, on
ClipSave1=%Clipboard%
Return
 
GoClipSave2:
HotKey, !^+c, Off
send ^c
HotKey, !^+c, on
ClipSave2=%Clipboard%
Return
 
GoClipSave3:
HotKey, !^+c, Off
send ^c
HotKey, !^+c, on
ClipSave3=%Clipboard%
Return
 
GoClipSave4:
HotKey, !^+c, Off
send ^c
HotKey, !^+c, on
ClipSave4=%Clipboard%
Return
 
GoClipSave5:
HotKey, !^+c, Off
send ^c
HotKey, !^+c, on
ClipSave5=%Clipboard%
Return
 
GoClipClearAll:
ClipSave1=
ClipSave2=
ClipSave3=
ClipSave4=
ClipSave5=
Return
 
!^+v::
Menu, MainMenu, Add
Menu, MainMenu, deleteAll
 
Menu, MainMenu, Add, 1 Paste1 = %ClipSave1%, GoClipPaste1
Menu, MainMenu, Add, 2 Paste2 = %ClipSave2%, GoClipPaste2
Menu, MainMenu, Add, 3 Paste3 = %ClipSave3%, GoClipPaste3
Menu, MainMenu, Add, 4 Paste4 = %ClipSave4%, GoClipPaste4
Menu, MainMenu, Add, 5 Paste5 = %ClipSave5%, GoClipPaste5
Menu, MainMenu, Add, 
Menu, MainMenu, Add, 6 Script, Goscript
 
Menu, MainMenu, Show
Return
 
 
GoClipPaste1:
clipboard=%ClipSave1%
HotKey, !^+v, Off
send ^v
HotKey, !^+v, on
ClipSave1=
Return
 
GoClipPaste2:
clipboard=%ClipSave2%
HotKey, !^+v, Off
send ^v
HotKey, !^+v, on
Return
 
GoClipPaste3:
clipboard=%ClipSave3%
HotKey, !^+v, Off
send ^v
HotKey, !^+v, on
Return
 
GoClipPaste4:
clipboard=%ClipSave4%
HotKey, !^+v, Off
send ^v
HotKey, !^+v, on
Return
 
GoClipPaste5:
clipboard=%ClipSave5%
HotKey, !^+v, Off
send ^v
HotKey, !^+v, on
Return
 
Goscript:
clipboard=
(
Hello %ClipSave1%
 
You owe %ClipSave2% due on the %ClipSave3%
Pay me now or else %ClipSave4% will beat you!
 
From %ClipSave5%
)
HotKey, !^+v, Off
send ^v
HotKey, !^+v, on
Return