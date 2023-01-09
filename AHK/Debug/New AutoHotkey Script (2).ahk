Gui,+AlwaysOnTop
Gui, Color, 444444

Gui, Add, Progress, x62 y36 w90 h90 Disabled BackgroundFF0000 vProgress
Gui, Add, Text, xp yp wp hp cFFFFFF BackgroundTrans 0x201 vText gMayaPlay, MayaPlay
Gui, Show, x436 y230 h162 w200, MAYA test
Return

MayaPlay:

Return

GuiClose:
ExitApp