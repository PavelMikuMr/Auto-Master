;q::
;Sleep 3000

;Send, ^c

;tooltip, copied!
 
;sleep 3000

;Send, ^v
;задержка и подскаска


;send,{LShift down}c{LShift down} разделить команды

;SetKeyDelay, -1
;Send, sadfsdfadfasdfasfasdfasdfasdfasfafdffdfadfasf
;мгновенная отправка


ControlSend; отправляет горячки непросредственно внутри этого же приложения

ControlSend,Edit1,programmatically sent text, Dele – Блокнот
           ------;может быть пустым находишь в виндовс спай
ControlSend, ,programmatically sent text, Dele – Блокнот
SetTitleMathMode, 2;частичное совпадение с заголовком(Например в блокноте постояянно обновляется заголовок)

SetTitleMatchMode, 2
#MaxHotkeyPerInterval 200
MyString =
( 
line 1
line 2
line 3
)

ControlSend, Edit1,%MyString%, Dele
ControlSend, RICHEDIT50W2, %MyString%, Новый документ в формате RTF - WordPad
; отправка в нужное приложение -edit 1 ищешь в вин спай разделе class nn, а 3 -это заголовок


^q::
ControlSend, , {space}, ahk_exe firefox.exe
return ; нажатие нужой клавиши в приложении даже еси оно не активно

!WheelUp::send {Volume_Up}
!WheelDown::send {Volume_Down}

#MaxHotkeyPerInterval 200
#If MouseIsOveR ("ahk_class Shell_TrayWnd")

WheelUp::send {Volume_Up}
WheelDown::send {Volume_Down}
#If 
MouseIsOveR(WinTitle)
{
	MouseGetPose,,, ID
	return WinExist (WinTitle " ahk_id" ID)
}
;увелечение громкости при наведении на трей

; не буду сюда коды вставлять просто опишу видосы, найдешь в его библиотеке
; 1- instnce of windows\group прикольная штука переключения между окнами любых приложений например для проводника
; 2-temporary hotkey - тоже копирование папки в проводнике-Регистр папок в виндовс
; 3-submunu to repl- добавление к менюхам еще менюхи
; 4-frameles notepad , блокнот без кепки
; 5- контекст сенситив - хоткей по положении мыши на окне 
; 6 посмотри про контрол клик