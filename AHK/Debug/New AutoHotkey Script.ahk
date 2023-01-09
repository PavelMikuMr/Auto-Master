#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; Пример: отображение выполняемых функций на экране (on-screen display).
; Данный скрипт требует версию 1.0.25.13 или выше.

CustomColor = EEAA99 ; Может быть любого RGB цвета (ниже он будет сделан прозрачным).
Gui, +AlwaysOnTop +LastFound +Owner ; Опция +Owner мешает появлению кнопки на панели задач.
Gui, Color, %CustomColor%
Gui, Font, s24
; XX & YY служит для того, чтобы автоматически задать размер окна.
Gui, Add, Text, vMyText cLime, XXXXX YYYYY
; Делаем все пиксели этого цвета прозрачными, а сам текст - полупрозрачным (150):
WinSet, TransColor, %CustomColor% 150
Gui, -Caption ; Удаляем границы и заголовок окна.
SetTimer, UpdateOSD, 200
Gosub, UpdateOSD ; Не ожидая таймера, делаем сразу первое обновление.
Gui, Show, x0 y400
return

UpdateOSD:
MouseGetPos, MouseX, MouseY
GuiControl,, MyText, X%MouseX%, Y%MouseY%
return
