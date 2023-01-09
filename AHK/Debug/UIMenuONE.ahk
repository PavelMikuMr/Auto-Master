f5::
CoordMode, Mouse, Screen
MouseGetPos, XposA, YposA ; получение координаты мыши
XposA-=+80
YposA-=+80 ; подгонка под курсор мыши
gui, 50:destroy
Gui, 50:Color, EEAA99 ; 16 код цвета может быть любым-
Gui, 50:Add, Button, x2 y0 w50 h50 BackgroundTrans gdothis1, do semething
Gui, 50:Add, Button, x2 y60 w50 h50 BackgroundTrans gdothis2, and this
Gui, 50:Add, Button, x122 y60 w50 h50 BackgroundTrans gdothis3, Opener
Gui, 50:Add, Button, x62 y120 w50 h50 BackgroundTrans gdothis4, Hello
Gui, 50:Add, Button, x122 y120 w50 h50 BackgroundTrans gclosewanrmenu, Close
Gui, 50:Add, Button, x122 y0 w50 h50  BackgroundTrans gdothis5, Hello
Gui, 50:Add, Button, x2 y120 w50 h50  BackgroundTrans gdothis6, Hello
Gui, 50:Add, Button, x62 y0 w50 h50 BackgroundTrans gdothis7, Thom
Gui 50:+LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, EEAA99 ; - главное чтобы он совпадал вотдесь
Gui 50:-Caption
Gui, 50:Show, x%XposA% y%YposA% h176 w179, menus
Return

closewanrmenu:
Gui, 50:Destroy
return
dothis1:
Gui, 50:Destroy
msgbox, button 1
Return
dothis2:
Gui, 50:Destroy
msgbox, button 2
Return
dothis3:
Gui, 50:Destroy
msgbox, button 3
Return
dothis4:
Gui, 50:Destroy
msgbox, button 4
Return
dothis5:
Gui, 50:Destroy
msgbox, button 5
Return

dothis6:
Gui, 50:Destroy
msgbox, button 5
Return

dothis7:
Gui, 50:Destroy
msgbox, button 5
Return
