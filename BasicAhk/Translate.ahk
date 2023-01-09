#NoEnv
#SingleInstance, force
DetectHiddenWindows, On
SetBatchLines, -1
Menu, Tray, Icon, % "HICON:" . ExtractIcon("Google16", 16)
SendMessage, WM_SETICON := 0x80, ICON_BIG := 1, ExtractIcon("Google32", 32),, ahk_id %A_ScriptHwnd%

global Info := { PID: DllCall("GetCurrentProcessId")
					, ini: A_ScriptDir . "\GoogleTranslator.ini"
					, GUIs: [], Streams: [], MediaSessions: []
					, Sizing: {}, LangArray: CreateLangArray() }

CreateTrayMenu()
SetHotkey()

Hook := new WinEventHook(EVENT_SYSTEM_MOVESIZEEND := 0xB, 0xB, "GetPos", 0, Info.PID)
OnMessage(0x201, "WM_LBUTTONDOWN")
OnMessage(0x20A, "WM_MOUSEWHEEL")
OnMessage(0x111, "WM_COMMAND")
OnMessage(0x100, "WM_KEYDOWN")
OnMessage(0x214, "WM_SIZING")
Return

CreateTrayMenu() {
	Menu, Tray, NoStandard
	Handler := Func("CreateNewGui").Bind("", "", "en", "ru")
	Menu, Tray, Add, Open New Window, % Handler
	Menu, Tray, Default, Open New Window
	Menu, Tray, Icon, Open New Window, % "HICON:" . ExtractIcon("Google16", 16)
	
	Menu, Tray, Add
	Menu, Tray, Add, Use Ctrl + Ins + Ins, SetHotkey ;+ Ins
	Menu, Tray, Add, Use Ctrl + C + C, SetHotkey
	IniRead, CtrlC  , % Info.ini, Hotkeys, CtrlC  , % " "
	IniRead, CtrlIns, % Info.ini, Hotkeys, CtrlIns, % " "
	if !(CtrlC || CtrlIns)
		CtrlC := true
	if CtrlC
		Menu, Tray, Check, Use Ctrl + C + C
	if CtrlIns
		Menu, Tray, Check, Use Ctrl + Ins + Ins
	Menu, Tray, Add
	if !A_IsCompiled {
		Menu, Tray, Add, Edit This Script, ScriptCommands
		Menu, Tray, Add
	}
	Menu, Tray, Add, Reload, ScriptCommands
	Menu, Tray, Add, Exit, ScriptCommands
}

SetHotkey() {
	if A_ThisMenuItem
		Menu, Tray, ToggleCheck, % A_ThisMenuItem
	CtrlC   := IsMenuChecked("Tray", "Use Ctrl + C + C")
	CtrlIns := IsMenuChecked("Tray", "Use Ctrl + Ins + Ins")
	for k, v in ["CtrlC", "CtrlIns"] {
		IniWrite, % %v%, % Info.ini, Hotkeys, % v
		hk := "~^" . SubStr(v, 5)
		if %v%
			Hotkey, % hk, Translate, On
		else
			try Hotkey, % hk, Off
	}
}

IsMenuChecked(menuName, itemNumberOrText) {
   static MIIM_STATE := 1, MFS_CHECKED := 0x8, MF_BYPOSITION := 0x400
   hMenu := MenuGetHandle(menuName)
   if itemNumberOrText is number
      itemNumber := itemNumberOrText - 1
   else {
      Loop % DllCall("GetMenuItemCount", "Ptr", hMenu) {
         itemNumber := A_Index - 1
         len := DllCall("GetMenuString", "Ptr", hMenu, "UInt", itemNumber, "Ptr", 0, "Int", 0, "UInt", MF_BYPOSITION) + 1
         VarSetCapacity(buff, len << !!A_IsUnicode)
         DllCall("GetMenuString", "Ptr", hMenu, "UInt", itemNumber, "Ptr", &buff, "Int", len, "UInt", MF_BYPOSITION)
      } until StrGet(&buff) = itemNumberOrText
   }
   VarSetCapacity(MENUITEMINFO, size := 4*4 + A_PtrSize*8, 0)
   NumPut(size, MENUITEMINFO)
   NumPut(MIIM_STATE, MENUITEMINFO, 4)
   DllCall("GetMenuItemInfo", "Ptr", hMenu, "UInt", itemNumber, "UInt", true, "Ptr", &MENUITEMINFO)
   Return !!(NumGet(MENUITEMINFO, 4*3, "UInt") & MFS_CHECKED)
}

Translate() {
	if A_Gui {
		for k, v in ["from", "to"] {
			GuiControlGet, lang,, ComboBox%k%
			%v% := Info.LangArray[lang]
		}
		GuiControlGet, sourceText,, Edit1
		GuiControl,, Edit2, % GoogleTranslate(sourceText, from, to)
	}
	else if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 400) {
		sourceText := Clipboard
		from := RegExMatch(sourceText, "[А-Яа-я]") ? "ru" : "auto"
		to := from = "ru" ? "en" : "ru"
		transText := GoogleTranslate(sourceText, from, to)
		CreateNewGui(sourceText, transText, from, to)
	}
}

ScriptCommands() {
	if (A_ThisMenuItem = "Edit This Script")
		Edit
	if (A_ThisMenuItem = "Reload")
		Reload
	if (A_ThisMenuItem = "Exit")
		ExitApp
}

CreateNewGui(sourceText := "", transText := "", from := "en", to := "ru") {
	static ES_NOHIDESEL := 0x100, BS_ICON := 0x40, IMAGE_ICON := 1, BM_SETIMAGE := 0xF7, Icons
	( !Icons && Icons := [ ExtractIcon("Swap"     , 16)
					         , ExtractIcon("PlayPause", 25)
					         , ExtractIcon("Stop"     , 12)
					         , ExtractIcon("Translate", 16) ] )
	for k, v in Info.LangArray
		sourceLangNames .= (A_Index = 1 ? "" : "|") . k . (v = from ? "|" : "")
	 , targetLangNames .= (A_Index = 1 ? "" : "|") . k . (v = to   ? "|" : "")
	sourceLangNames := RegExReplace(sourceLangNames, "\|$", "||")
	targetLangNames := RegExReplace(targetLangNames, "\|$", "||")

	Gui, New, +AlwaysOnTop +LastFound +Resize +hwndhGui +Owner +MinSize199x237 -MaximizeBox, Google Translate
	Loop 2 {
		i := A_Index, b := i = 1
		Gui, Font, q5 s8, Verdana
		Gui, Add, Text, % "x10 y+15", % b ? "Default Lenguage:" : "Translate:"
		Gui, Add, DDL, x112 yp-4 w182, % b ? sourceLangNames : targetLangNames
		Gui, Add, Button, x297 yp-1 w23 h23 gSwapLang %BS_ICON%
		
		IniRead, edit%i%_fontSize, % Info.ini, Settings, Edit%i% FontSize, 8
		Gui, Font, % "q5 s" . edit%i%_fontSize, Verdana
		Info["edit" . i . "_fontSize"] := edit%i%_fontSize
		Gui, Add, Edit, x10 y+9 w310 Multi %ES_NOHIDESEL%, % b ? sourceText : transText
		GuiControlGet, Edit%i%, Pos
		( (Edit%i%H < 45 || (i = 1 && sourceText = "") || (i = 2 && transText = "")) && Edit%i%H := 45 )
		( Edit%i%H > 250 && Edit%i%H := 250 )
		GuiControl, Move, Edit%i%, % "h" . Edit%i%H

		Gui, Font, q5 s8, Verdana
		Gui, Add, Button, % "x10 w52 h23 gPlayPause y" (Edit%i%Y + Edit%i%H + 5) . " " . BS_ICON
		Gui, Add, Button, x+3 yp wp hp Disabled %BS_ICON%
		Gui, Add, Button, % "x250 yp w70 hp g" . (b ? "Translate Default " . BS_ICON : "GuiClose"), % b ? "" : "OK"
	}
	Loop 7
		PostMessage, BM_SETIMAGE, IMAGE_ICON, Icons[ mod(A_Index - 1, 4) + 1 ], Button%A_Index%
	Sizing := Info["Sizing", hGui] := {}
	GuiControlGet, Edit2, Pos
	height := Sizing.height := Edit2Y + Edit2H + 34
	GetPos()
	if Info.GUIs[1] {
		WinGetPos, X, Y,,, % "ahk_id" . Info.GUIs[1]
		X += 50, Y += 30
	}
	else {
		IniRead, X, % Info.ini, Coords, X, % " "
		IniRead, Y, % Info.ini, Coords, Y, % " "
	}
	if b := (X != "" && Y != "") {
		Gui, Show, % "Hide x" . X . " y" . Y . " h" . height
		WinGetPos,,, W, H, ahk_id %hGui%
		(X + W > A_ScreenWidth  && X := 0)
		(Y + H > A_ScreenHeight && Y := 0)
	}
	Info.GUIs.InsertAt(1, hGui)
	GuiControl, Focus, Edit1
	Gui, Show, % (b ? "x" . X . " y" . Y : "") . " h" . height
}

WM_KEYDOWN(wp, lp, msg, hwnd) {
	static VK_TAB := 0x9, VK_ENTER := 0xD, EN_SETFOCUS := 0x100
	if ( wp = VK_TAB && GetKeyState("Ctrl", "P") ) {
		SwapLang()
		WM_COMMAND(EN_SETFOCUS << 16)
		Return 0
	}
	if ( wp = VK_ENTER && !(GetKeyState("Shift", "P") || GetKeyState("Ctrl", "P")) ) {
		WinGetClass, winClass, ahk_id %hwnd%
		if (winClass = "Edit") {
			Translate()
			Return 0
		}
	}
}

WM_LBUTTONDOWN() {
	PostMessage, WM_NCLBUTTONDOWN := 0xA1, HTCAPTION := 2
}

WM_MOUSEWHEEL(wp, lp, msg, hwnd) {
	static MK_CONTROL := 0x8, EM_GETSEL := 0xB0, Timer
	if !( wp & MK_CONTROL )
		Return
	
	Loop 2
		GuiControlGet, hEdit%A_Index%, hwnd, Edit%A_Index%
	if !hEdit := hEdit1 = hwnd ? hEdit1 : hEdit2 = hwnd ? hEdit2 : 0
		Return
	
	nn := (hEdit = hEdit2) + 1
	key := "edit" . nn . "_fontSize"
	turn := wp >> 16
	Info[key] += (turn > 0 && turn <= 0x7FFF ? 1 : -1)
	(Info[key] < 8 && Info[key] := 8)
	fontSize := Info[key]
	Gui, Font, s%fontSize%
	GuiControl, Font, %hEdit%
	if !Info.prevText {
		Info.prevText := {}
		GuiControlGet, prevText,, %hEdit%
		Info.prevText.text := prevText
		SendMessage, EM_GETSEL,,,, ahk_id %hEdit%
		Info.prevText.start := ErrorLevel & 0xFFFF
		Info.prevText.end   := ErrorLevel >> 16
	}
	GuiControl,, %hEdit%, %fontSize% размер шрифта
   DllCall("HideCaret", "Ptr", hEdit)
	try SetTimer, % Timer, Delete
	Timer := Func("SaveFontSize").Bind(fontSize, hEdit, nn)
	SetTimer, % Timer, -800
}

SaveFontSize(fontSize, hEdit, nn) {
	static EM_SETSEL := 0xB1, EM_SCROLLCARET := 0xB7
	GuiControl,, %hEdit%, % Info.prevText.text
	DllCall("ShowCaret", "Ptr", hEdit)
	SendMessage, EM_SETSEL, Info.prevText.start, Info.prevText.end,, ahk_id %hEdit%
	SendMessage, EM_SCROLLCARET,,,, ahk_id %hEdit%
	Info.Delete("prevText")
	IniWrite, % fontSize, % Info.ini, Settings, % "Edit" . nn . " FontSize"
}

WM_COMMAND(wp) {
	static EN_SETFOCUS := 0x100, CBN_SETFOCUS := 3, WM_INPUTLANGCHANGEREQUEST := 0x50
	notify := wp >> 16
	if (notify = CBN_SETFOCUS)
		PostMessage, WM_INPUTLANGCHANGEREQUEST,, 0x419,, ahk_id %A_ScriptHwnd%
	if (notify = EN_SETFOCUS) {
		GuiControlGet, focus, Focus
		n := SubStr(focus, 0)
		GuiControlGet, lang,, ComboBox%n%
		PostMessage, WM_INPUTLANGCHANGEREQUEST,, lang = "Russian" ? 0x419 : 0x409,, ahk_id %A_ScriptHwnd%
	}
}

WM_SIZING(wp) {
	Info.Sizing.edge := ["left", "right", "top", "topLeft", "topRight", "bottom", "bottomLeft", "bottomRight"][wp]
}

GuiSize(hwnd, eventInfo, width, height) {
	if (eventInfo = 1)
		Return
	Critical
	if (Info.Sizing.edge ~= "i)right|left") {
		Loop 2 {
			d := (width - 330)/2
			if (width > 330) {
				GuiControl, Move, %   "Static" . A_Index      , % "x"  10 + d
				GuiControl, Move, % "ComboBox" . A_Index      , % "x" 112 + d
				GuiControl, Move, %   "Button" . A_Index*4 - 3, % "x" 297 + d
			}
			GuiControl, Move, %   "Edit" . A_Index  , % "w" width - 20
			GuiControl, Move, % "Button" . A_Index*4, % "x" width - 80
		}
	}
	dH := height - Info["Sizing", hwnd, "prevHeight"]
	if (Info.Sizing.edge ~= "bottom")
		ResizeBottom(hwnd, height, dH)
	if (Info.Sizing.edge ~= "top")
		ResizeTop(hwnd, height, dH)
	Info["Sizing", hwnd, "height"] := height
	CorrectEditHeight(hwnd)
}

ResizeTop(hwnd, height, dH, fromBottom := false) {
	Sizing := Info["Sizing", hwnd]
	if ( (edit1H := Sizing.edit1H + dH) < 45 ) {
		if !Info.Sizing.flag
			GetPos(), Info.Sizing.flag := true
		if !fromBottom
			ResizeBottom(hwnd, height, dH, true)
	}
	else {
		GuiControl, Move, Edit1, h%edit1H%
		edit2Y := Sizing.edit2Y
		Loop 3 {
			GuiControl, Move, % "Button" . A_Index + 1, % "y" edit2Y - 65 + dH
			GuiControl, MoveDraw, % "Button" . A_Index + 5, % "y" height - 30
		}
		GuiControl, MoveDraw,   Static2, % "y" edit2Y - 27 + dH
		GuiControl, Move    , ComboBox2, % "y" edit2Y - 31 + dH
		GuiControl, MoveDraw,   Button5, % "y" edit2Y - 32 + dH
		GuiControl, Move    ,     Edit2, % "y" edit2Y + dH
	}
}

ResizeBottom(hwnd, height, dH, fromTop := false) {
	Sizing := Info["Sizing", hwnd]
	if ( (edit2H := Sizing.edit2H + dH) < 45 ) {
		if !Info.Sizing.flag
			GetPos(), Info.Sizing.flag := true
		if !fromTop
			ResizeTop(hwnd, height, dH, true)
	}
	else {
		GuiControl, Move, Edit2, h%edit2H%
		Loop 3
			GuiControl, MoveDraw, % "Button" . A_Index + 5, % "y" height - 30
	}
}

GetPos() {
	Info.Sizing.flag := false
	WinGet, list, List, % "Google Translate ahk_class AutoHotkeyGUI ahk_pid " . Info.PID
	Loop % List {
		hGui := List%A_Index%, Sizing := Info["Sizing", hGui]
		Loop 2 {
			GuiControlGet, Pos, %hGui%: Pos, Edit%A_Index%
			Sizing["edit" . A_Index . "Y"] := PosY
			Sizing["edit" . A_Index . "H"] := PosH
		}
		Sizing.prevHeight := Sizing.height
	}
}

CorrectEditHeight(hGui) {
	GuiControlGet,   editPos, %hGui%: Pos, Edit2
	GuiControlGet, buttonPos, %hGui%: Pos, Button6
	H := buttonPosY - editPosY - 5
	if (H != editPosH)
		GuiControl, %hGui%: Move, Edit2, h%H%
}

SwapLang() {
	GuiControlGet, from,, ComboBox1
	GuiControlGet,   to,, ComboBox2
	GuiControl, Choose, ComboBox1, % to
	GuiControl, Choose, ComboBox2, % from
	GuiControlGet, focus, Focus
	GuiControl, Focus, % "Edit" . !(focus ~= "Button[1-4]|Edit1") + 1
}

PlayPause() {
	GuiControlGet, buttonNN, Focus
	GuiControlGet, hButton, hwnd, % buttonNN
	if !Info.MediaSessions[hButton]
		PlayText(buttonNN, hButton)
	else
		Info.MediaSessions[hButton].Pause()
}

PlayText(buttonNN, key) {
	static MFCLOCK_STATE_RUNNING := 1
	Gui, +OwnDialogs
	textToSpeach := GetTextToSpeach(buttonNN, lng)
	if (textToSpeach = "")
		Return
	if !pIStream := GetStream(textToSpeach, lng)
		Return
	Session := Info.MediaSessions[key] := new MediaSession()
	Session.InitializeWithStream(pIStream)
	(lng = "ru" && Session.SetRate(1.3))
	start := false, Session.Start()
	Loop
		Sleep, 50
	until A_Index = 20 || (Session.GetState() = MFCLOCK_STATE_RUNNING && start := true)
	if !start {
		Info.MediaSessions.Delete(key)
		MsgBox, 48, Warning, Can't start media session, try again
		Return
	}
	stopNN := "Button" . SubStr(buttonNN, 0) + 1
	GuiControl, -g, % stopNN
	StopHandler := Func("Stop").Bind(key, stopNN)
	GuiControl, +g, % stopNN, % StopHandler
	GuiControl, Enable, % stopNN
	Timer := Func("DeleteSession").Bind(key, A_Gui, stopNN)
	SetTimer, % Timer, 300
}

DeleteSession(key, hGui, stopNN) {
   static MFCLOCK_STATE_INVALID := 0
        , MFCLOCK_STATE_STOPPED := 2
	state := Info.MediaSessions[key].GetState()
	if (!state || state = MFCLOCK_STATE_STOPPED) {
		SetTimer,, Delete
		GuiControl, %hGui%: Disable, % stopNN
		Info.MediaSessions.Delete(key)
	}
}

GetTextToSpeach(buttonNN, ByRef lng) {
	editNN := "Edit" . !(buttonNN ~= "2") + 1
	GuiControlGet, hEdit, hwnd, % editNN
	ControlGet, textToSpeach, Selected,,, ahk_id %hEdit%
	if (textToSpeach = "")
		GuiControlGet, textToSpeach,, % editNN
	GuiControlGet, lang,, % "ComboBox" . SubStr(editNN, 0)
	lng := Info.LangArray[lang]
	textToSpeach := Trim(textToSpeach, " `t`n`r")
	if (textToSpeach = "")
		MsgBox, 48, Warning, Text to speach is empty
	Return textToSpeach
}

GetStream(textToSpeach, lng) {
	for k, v in Info.Streams {
		if (textToSpeach = v.text && lng = v.lng) {
			pIStream := v.stream
			break
		}
	}
	if !pIStream {
		try pIStream := GetMp3StreamFromGoogle(textToSpeach, lng, dataSize)
		catch e {
			MsgBox, 48, Warning, % e
			Return
		}
		size := 0
		for k, v in Info.Streams
			size += v.size
		if (size + dataSize > 0x100000) {
			Obj := Info.Streams.RemoveAt(1)
			ObjRelease(Obj.stream)
		}
		Info.Streams.Push( {text: textToSpeach, lng: lng, stream: pIStream, size: dataSize} )
	}
	Return pIStream
}

Stop(key, stopNN) {
	Info.MediaSessions[key].Stop()
	Info.MediaSessions.Delete(key)
	GuiControl, Disable, % stopNN
}

GuiClose() {
	RemoveGui()
}

GuiEscape() {
	RemoveGui()
}

RemoveGui() {
	Info.Sizing.Delete(A_Gui)
	for k, v in Info.GUIs
		if (v = A_Gui)
			break
	hGui := Info.GUIs.RemoveAt(k)
	Loop 2 {
		GuiControlGet, hPlayPause, hwnd, % "Button" . A_Index*4 - 2
		Info.MediaSessions[hPlayPause].Stop()
		Info.MediaSessions.Delete(hPlayPause)
	}
	if !Info.GUIs[1] {
		WinGetPos, X, Y,,, ahk_id %hGui%
		IniWrite, % X, % Info.ini, Coords, X
		IniWrite, % Y, % Info.ini, Coords, Y
	}
	Gui, Destroy
	if !Info.GUIs[1]
		DllCall("SetProcessWorkingSetSize", "Ptr", DllCall("GetCurrentProcess"), "Ptr", -1, "Ptr", -1)
}

GoogleTranslate(str, ByRef from, to := "en") {
   static JS := CreateScriptObj()
	
   if !Ping4("translate.google.com")
		Return "Error: Ping4(""translate.google.com"") failed with error: " . ErrorLevel
	
   json := SendRequest(JS, str, to, from)
   try oJSON := JS.JSON.parse(json)
	catch {
		Clipboard := json
		Return "Error: Can't parse json, full error text is in ClipBoard`n`n" . SubStr(json, 1, 500)
	}
   if !IsObject(oJSON[1])  {
      Loop % oJSON[0].length
         trans .= oJSON[0][A_Index - 1][0]
   }
   else  {
      MainTransText := oJSON[0][0][0]
      Loop % oJSON[1].length  {
         trans .= "`n+"
         obj := oJSON[1][A_Index-1][1]
         Loop % obj.length  {
            txt := obj[A_Index - 1]
            trans .= (MainTransText = txt ? "" : "`n" txt)
         }
      }
   }
   if !IsObject(oJSON[1])
      MainTransText := trans := Trim(trans, ",+`n ")
   else
      trans := MainTransText . "`n+`n" . Trim(trans, ",+`n ")

   from := oJSON[2]
   trans := Trim(trans, ",+`n ")
   Return trans
}

SendRequest(JS, str, tl, sl, proxy := "") {
   static Whr, userAgent := "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0"
   ComObjError(false)
   if !Whr {
      Whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
      ( proxy && Whr.SetProxy(2, proxy) )
      Whr.Open("GET", "https://translate.google.com", true)
      Whr.SetRequestHeader("User-Agent", userAgent)
      Whr.Send()
      Whr.WaitForResponse(-1)
   }
   Whr.Open("POST", "https://translate.googleapis.com/translate_a/single?client=gtx"
                ; or https://clients5.google.com/translate_a/t?client=dict-chrome-ex
      . "&sl=" . sl . "&tl=" . tl . "&hl=" . tl
      . "&dt=at&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&ie=UTF-8&oe=UTF-8&otf=0&ssel=0&tsel=0&pc=1&kc=1"
      . "&tk=" . JS.eval("tk").(str), true)

   Whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8")
   Whr.SetRequestHeader("User-Agent", userAgent)
   Whr.Send("q=" . EncodeDecodeURI(str))
   Whr.WaitForResponse(-1)
   Return Whr.responseText
}

Ping4(Addr, ByRef Result := "", Timeout := 1024) {
   Static WSADATAsize := (2 * 2) + 257 + 129 + (2 * 2) + (A_PtrSize - 2) + A_PtrSize
   OrgAddr := Addr
   Result := "" 
   VarSetCapacity(WSADATA, WSADATAsize, 0)
   if (Err := DllCall("Ws2_32\WSAStartup", "UShort", 0x0202, "Ptr", &WSADATA, "Int")) {
      ErrorLevel := "WSAStartup failed with error " . Err
      Return
   }
   if !RegExMatch(Addr, "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$") {
      if !(HOSTENT := DllCall("Ws2_32\gethostbyname", "AStr", Addr, "UPtr")) {
         DllCall("Ws2_32\WSACleanup")
         ErrorLevel := "gethostbyname failed with error " . DllCall("Ws2_32\WSAGetLastError", "Int")
         Return
      }
      PAddrList := NumGet(HOSTENT + 0, (2 * A_PtrSize) + 4 + (A_PtrSize - 4), "UPtr")
      PIPAddr := NumGet(PAddrList + 0, 0, "UPtr")
      Addr := StrGet(DllCall("Ws2_32\inet_ntoa", "UInt", NumGet(PIPAddr + 0, 0, "UInt"), "UPtr"), "CP0")
   }
   INADDR := DllCall("Ws2_32\inet_addr", "AStr", Addr, "UInt")
   if (INADDR = 0xFFFFFFFF) {
      ErrorLevel := "inet_addr failed for address " . Addr
      Return
   }
   DllCall("Ws2_32\WSACleanup")
   HMOD := DllCall("LoadLibrary", "Str", "Iphlpapi.dll", "UPtr")
   Err := ""
   if (HPORT := DllCall("Iphlpapi\IcmpCreateFile", "UPtr")) {
      REPLYsize := 32 + 8
      VarSetCapacity(REPLY, REPLYsize, 0)
      if DllCall("Iphlpapi\IcmpSendEcho", "Ptr", HPORT, "UInt", INADDR, "Ptr", 0, "UShort", 0, "Ptr", 0
													 , "Ptr", &REPLY, "UInt", REPLYsize, "UInt", Timeout, "UInt")
		{
         Result := {}
         Result.InAddr := OrgAddr
         Result.IPAddr := StrGet(DllCall("Ws2_32\inet_ntoa", "UInt", NumGet(Reply, 0, "UInt"), "UPtr"), "CP0")
         Result.RTTime := NumGet(Reply, 8, "UInt")
      }
      else
         Err := "IcmpSendEcho failed with error " . A_LastError
      DllCall("Iphlpapi\IcmpCloseHandle", "Ptr", HPORT)
   }
   else
      Err := "IcmpCreateFile failed to open a port!"
	DllCall("FreeLibrary", "Ptr", HMOD)
   if (Err) {
      ErrorLevel := Err
      Return
   }
   ErrorLevel := 0
   Return Result.RTTime
}

EncodeDecodeURI(str, encode := true, component := true) {
	static JS
	( !JS && JS := CreateScriptObj() )
   for k, v in [["\", "\\"], ["'", "\'"], ["`r", "\r"], ["`n", "\n"]]
      str := StrReplace(str, v[1], v[2])
   Return JS.eval( (encode ? "en" : "de") . "codeURI" . (component ? "Component" : "") . "('" . str . "')" )
}

GetJScript()
{
   script =
   (
      var TKK = ((function() {
        var a = 561666268;
        var b = 1526272306;
        return 406398 + '.' + (a + b);
      })());

      function b(a, b) {
        for (var d = 0; d < b.length - 2; d += 3) {
            var c = b.charAt(d + 2),
                c = "a" <= c ? c.charCodeAt(0) - 87 : Number(c),
                c = "+" == b.charAt(d + 1) ? a >>> c : a << c;
            a = "+" == b.charAt(d) ? a + c & 4294967295 : a ^ c
        }
        return a
      }

      function tk(a) {
          for (var e = TKK.split("."), h = Number(e[0]) || 0, g = [], d = 0, f = 0; f < a.length; f++) {
              var c = a.charCodeAt(f);
              128 > c ? g[d++] = c : (2048 > c ? g[d++] = c >> 6 | 192 : (55296 == (c & 64512) &&
				  f + 1 < a.length && 56320 == (a.charCodeAt(f + 1) & 64512) ?
              (c = 65536 + ((c & 1023) << 10) + (a.charCodeAt(++f) & 1023), g[d++] = c >> 18 | 240,
              g[d++] = c >> 12 & 63 | 128) : g[d++] = c >> 12 | 224, g[d++] = c >> 6 & 63 | 128), g[d++] = c & 63 | 128)
          }
          a = h;
          for (d = 0; d < g.length; d++) a += g[d], a = b(a, "+-a^+6");
          a = b(a, "+-3^+b+-f");
          a ^= Number(e[1]) || 0;
          0 > a && (a = (a & 2147483647) + 2147483648);
          a `%= 1E6;
          return a.toString() + "." + (a ^ h)
      }
   )
   Return script
}

CreateScriptObj() {
   static doc, JS
   if !doc {
      doc := ComObjCreate("htmlfile")
      doc.write("<meta http-equiv='X-UA-Compatible' content='IE=9'>")
      JS := doc.parentWindow
      (doc.documentMode < 9 && JS.execScript())
		JS.eval("delete ActiveXObject; delete GetObject;")
		JS.eval( GetJScript() )
   }
   Return JS
}

ExtractIcon(name, size) {
	Base64 := GetBase64String(name)
	Return hIcon := CreateIconFromBase64(Base64, size)
}

CreateIconFromBase64(StringBASE64, Size) {
   CryptStringToBinary(StringBASE64, IconData)
   Return DllCall("CreateIconFromResourceEx", "Ptr", &IconData + 4
      , "UInt", NumGet(&IconData, "UInt"), "UInt", true, "UInt", 0x30000, "Int", Size, "Int", Size, "UInt", 0)
}

CryptStringToBinary(string, ByRef outData, formatName := "CRYPT_STRING_BASE64") {
   static formats := { CRYPT_STRING_BASE64: 0x1
                     , CRYPT_STRING_HEX:    0x4
                     , CRYPT_STRING_HEXRAW: 0xC }
   fmt := formats[formatName]
   chars := StrLen(string)
   if !DllCall("Crypt32\CryptStringToBinary", "Ptr", &string, "UInt", chars, "UInt", fmt
                                            , "Ptr", 0, "UIntP", bytes, "UIntP", 0, "UIntP", 0)
      throw "CryptStringToBinary failed. LastError: " . A_LastError
   VarSetCapacity(outData, bytes)
   DllCall("Crypt32\CryptStringToBinary", "Ptr", &string, "UInt", chars, "UInt", fmt
                                        , "Str", outData, "UIntP", bytes, "UIntP", 0, "UIntP", 0)
   Return bytes
}

class WinEventHook
{
   __New(eventMin, eventMax, hookProc, eventInfo := 0, idProcess := 0, idThread := 0, dwFlags := 0) {
      this.pCallback := RegisterCallback(hookProc, "F",, eventInfo)
      this.hHook := DllCall("SetWinEventHook", "UInt", eventMin, "UInt", eventMax, "Ptr", 0, "Ptr", this.pCallback
                                             , "UInt", idProcess, "UInt", idThread, "UInt", dwFlags, "Ptr")
   }
   __Delete() {
      DllCall("UnhookWinEvent", "Ptr", this.hHook)
      DllCall("GlobalFree", "Ptr", this.pCallback, "Ptr")
   }
}

class MediaSession {
   __New() {
      static MF_VERSION := 0x2, MFSTARTUP_NOSOCKET := 0x1
      DllCall("Mfplat\MFStartup", "UInt", MF_VERSION, "UInt", MFSTARTUP_NOSOCKET, "UInt")
      this.MFSession := IMFMediaSession.Create()
   }
   __Delete() {
      this.Topology := ""
      this.PresentationDescriptor := ""
      this.MediaSource := ""

      this.MFSession.Shutdown()
      this.MFSession := ""
      DllCall("Mfplat\MFShutdown")
   }
   InitializeWithStream(pIStream, fileType := "mp3") {
      static MF_RESOLUTION_MEDIASOURCE := 1
      SourceResolver := IMFSourceResolver.Create()
      ByteStream := IMFByteStream.CreateFromStream(pIStream)

      this.MediaSource := SourceResolver.CreateObjectFromByteStream( ByteStream.ptr, "file." . fileType
                                                                   , MF_RESOLUTION_MEDIASOURCE, 0, MF_OBJECT_TYPE )
      SourceResolver := ByteStream := ""

      this.PresentationDescriptor := this.MediaSource.CreatePresentationDescriptor()
      this.Topology := IMFTopology.Create()
      descriptorCount := this.PresentationDescriptor.GetStreamDescriptorCount()
      Loop % descriptorCount
         this._AddBranchToPartialTopology(A_Index - 1)
      this.MFSession.SetTopology(0, this.Topology.ptr)
   }
   Start(atBeginning := true) {
      VarSetCapacity(GUID_NULL, 16, 0)
      VarSetCapacity(PROPVARIANT, 8 + A_PtrSize*2, 0)
      if atBeginning
         NumPut(VT_I8 := 0x14, PROPVARIANT, "UShort")
      this.MFSession.Start(&GUID_NULL, &PROPVARIANT)
   }
   Pause() {
      state := this.GetState()
      if (state != 1)
         this.Start(false)
      else
         this.MFSession.Pause()
   }
   Stop() {
      this.MFSession.Stop()
   }
   GetState() {
      static MFCLOCK_STATE_INVALID := 0
           , MFCLOCK_STATE_RUNNING := 1
           , MFCLOCK_STATE_STOPPED := 2
           , MFCLOCK_STATE_PAUSED  := 3
      Clock := this.MFSession.GetClock()
      Return Clock.GetState()
   }
   SetRate(rate) {
      RateControl := this.MFSession.GetRateControl()
      RateControl.SetRate(rate)
   }
   _AddBranchToPartialTopology(i) {
      static MFMediaType_Audio := "{73647561-0000-0010-8000-00AA00389B71}"
      StreamDescriptor := this.PresentationDescriptor.GetStreamDescriptorByIndex(i, selected)
      if selected {
         MediaTypeHandler := StreamDescriptor.GetMediaTypeHandler()
         VarSetCapacity(GUID, 16, 0)
         MediaTypeHandler.GetMajorType(GUID)
         if StringFromGUID(GUID) = MFMediaType_Audio
            MFActivate := IMFActivate.Create()
         SourceTopologyNode := this._AddSourceNode(StreamDescriptor)
         OutputTopologyNode := this._AddOutputNode(MFActivate)
         SourceTopologyNode.ConnectOutput(0, OutputTopologyNode.ptr, 0)
      }
   }
   _AddSourceNode(StreamDescriptor) {
      static MF_TOPOLOGY_SOURCESTREAM_NODE := 1
           , MF_TOPONODE_SOURCE                  := "{835C58EC-E075-4BC7-BCBA-4DE000DF9AE6}"
           , MF_TOPONODE_PRESENTATION_DESCRIPTOR := "{835C58ED-E075-4BC7-BCBA-4DE000DF9AE6}"
           , MF_TOPONODE_STREAM_DESCRIPTOR       := "{835C58EE-E075-4BC7-BCBA-4DE000DF9AE6}"
      SourceTopologyNode := IMFTopologyNode.Create(MF_TOPOLOGY_SOURCESTREAM_NODE)
      SourceTopologyNode.SetUnknown( CLSIDFromString(MF_TOPONODE_SOURCE                 , GUID), this.MediaSource.ptr )
      SourceTopologyNode.SetUnknown( CLSIDFromString(MF_TOPONODE_PRESENTATION_DESCRIPTOR, GUID), this.PresentationDescriptor.ptr )
      SourceTopologyNode.SetUnknown( CLSIDFromString(MF_TOPONODE_STREAM_DESCRIPTOR      , GUID), StreamDescriptor.ptr )
      this.Topology.AddNode(SourceTopologyNode.ptr)
      Return SourceTopologyNode
   }
   _AddOutputNode(MFActivate) {
      static MF_TOPOLOGY_OUTPUT_NODE := 0
           , MF_TOPONODE_STREAMID             := "{14932F9B-9087-4BB4-8412-5167145CBE04}"
           , MF_TOPONODE_NOSHUTDOWN_ON_REMOVE := "{14932F9C-9087-4BB4-8412-5167145CBE04}"
      OutputTopologyNode := IMFTopologyNode.Create(MF_TOPOLOGY_OUTPUT_NODE)
      OutputTopologyNode.SetObject(MFActivate.ptr)
      OutputTopologyNode.SetUINT32( CLSIDFromString(MF_TOPONODE_STREAMID            , GUID), 0 )
      OutputTopologyNode.SetUINT32( CLSIDFromString(MF_TOPONODE_NOSHUTDOWN_ON_REMOVE, GUID), 0 )
      this.Topology.AddNode(OutputTopologyNode.ptr)
      Return OutputTopologyNode
   }
}

class IMFMediaSession extends InterfaceBase {
   Create() {
      DllCall("Mf\MFCreateMediaSession", "Ptr", 0, "PtrP", pIMFMediaSession)
      Return new IMFMediaSession(pIMFMediaSession)
   }
   GetRateControl() {
      static MF_RATE_CONTROL_SERVICE := "{866FA297-B802-4BF8-9DC9-5E3B6A9F53C9}"
           , IID_IMFRateControl      := "{88DDCD21-03C3-4275-91ED-55EE3929328F}"
      hr := DllCall("Mf\MFGetService", "Ptr", this.ptr, "Ptr", CLSIDFromString(MF_RATE_CONTROL_SERVICE, _)
                                                      , "Ptr", CLSIDFromString(IID_IMFRateControl, __)
                                                      , "PtrP", pIMFRateControl)
      this.IsError("IMFMediaSession::GetRateControl", hr)
      Return new IMFRateControl(pIMFRateControl)
   }
   SetTopology(flags, pIMFTopology) {
      hr := DllCall(this.VTable(7), "Ptr", this.ptr, "UInt", flags, "Ptr", pIMFTopology)
      this.IsError("IMFMediaSession::SetTopology", hr)
   }
   Start(pGUID, pVariant) {
      hr := DllCall(this.VTable(9), "Ptr", this.ptr, "Ptr", pGUID, "Ptr", pVariant)
      this.IsError("IMFMediaSession::Start", hr)
   }
   Pause() {
      hr := DllCall(this.VTable(10), "Ptr", this.ptr)
      this.IsError("IMFMediaSession::Pause", hr)
   }
   Stop() {
      hr := DllCall(this.VTable(11), "Ptr", this.ptr)
      this.IsError("IMFMediaSession::Stop", hr)
   }
   Shutdown() {
      hr := DllCall(this.VTable(13), "Ptr", this.ptr)
      this.IsError("IMFMediaSession::Shutdown", hr)
   }
   GetClock() {
      hr := DllCall(this.VTable(14), "Ptr", this.ptr, "PtrP", pIMFClock)
      this.IsError("IMFMediaSession::GetClock", hr)
      Return new IMFClock(pIMFClock)
   }
}

class IMFClock extends InterfaceBase {
   GetState() {
      hr := DllCall(this.VTable(6), "Ptr", this.ptr, "UInt", 0, "UIntP", state)
      this.IsError("IMFClock::GetState", hr)
      Return state
   }
}

class IMFSourceResolver extends InterfaceBase {
   Create() {
      DllCall("Mfplat\MFCreateSourceResolver", "PtrP", pIMFSourceResolver)
      Return new IMFSourceResolver(pIMFSourceResolver)
   }
   CreateObjectFromByteStream(pIMFByteStream, URL, flags, pIPropertyStore, ByRef MF_OBJECT_TYPE) {
      static IID_IMFMediaSource := "{279A808D-AEC7-40C8-9C6B-A6B492C78A66}"
      hr := DllCall(this.VTable(4), "Ptr", this.ptr, "Ptr", pIMFByteStream, "WStr", URL, "UInt", flags
                                  , "Ptr", pIPropertyStore, "UIntP", MF_OBJECT_TYPE, "PtrP", pIUnknown)
      this.IsError("IMFSourceResolver::CreateObjectFromByteStream", hr)
      pIMFMediaSource := ComObjQuery(pIUnknown, IID_IMFMediaSource)
      ObjRelease(pIUnknown)
      Return new IMFMediaSource(pIMFMediaSource)
   }
}

class IMFByteStream extends InterfaceBase {
   CreateFromStream(pIStream) {
      hr := DllCall("Mfplat\MFCreateMFByteStreamOnStream", "Ptr", pIStream, "PtrP", pIMFByteStream)
      IMFByteStream.IsError("IMFByteStream::MFCreateMFByteStreamOnStream", hr)
      Return new IMFByteStream(pIMFByteStream)
   }
}

class IMFMediaSource extends InterfaceBase {
   CreatePresentationDescriptor() {
      hr := DllCall(this.VTable(8), "Ptr", this.ptr, "PtrP", pIMFPresentationDescriptor)
      this.IsError("IMFMediaSource::CreatePresentationDescriptor", hr)
      Return new IMFPresentationDescriptor(pIMFPresentationDescriptor)
   }
}

class IMFPresentationDescriptor extends InterfaceBase {
   GetStreamDescriptorCount() {
      hr := DllCall(this.VTable(33), "Ptr", this.ptr, "UIntP", descriptorCount)
      this.IsError("IMFPresentationDescriptor::GetStreamDescriptorCount", hr)
      Return descriptorCount
   }
   GetStreamDescriptorByIndex(idx, ByRef selected) {
      hr := DllCall(this.VTable(34), "Ptr", this.ptr, "UInt", idx, "UIntP", selected, "PtrP", pIMFStreamDescriptor)
      this.IsError("IMFPresentationDescriptor::GetStreamDescriptorByIndex", hr)
      Return new IMFStreamDescriptor(pIMFStreamDescriptor)
   }
}

class IMFTopology extends InterfaceBase {
   Create() {
      DllCall("Mf\MFCreateTopology", "PtrP", pIMFTopology)
      Return new IMFTopology(pIMFTopology)
   }
   AddNode(pNode) {
      hr := DllCall(this.VTable(34), "Ptr", this.ptr, "Ptr", pNode)
      this.IsError("IMFTopology::AddNode", hr)
   }
}

class IMFStreamDescriptor extends InterfaceBase {
   GetMediaTypeHandler() {
      hr := DllCall(this.VTable(34), "Ptr", this.ptr, "PtrP", pIMFMediaTypeHandler)
      this.IsError("IMFStreamDescriptor::GetMediaTypeHandler", hr)
      Return new IMFMediaTypeHandler(pIMFMediaTypeHandler)
   }
}

class IMFMediaTypeHandler extends InterfaceBase {
   GetMajorType(ByRef GUID) {
      hr := DllCall(this.VTable(8), "Ptr", this.ptr, "Ptr", &GUID)
      this.IsError("IMFMediaTypeHandler::GetMajorType", hr)
   }
}

class IMFActivate extends InterfaceBase {
   Create() {
      hr := DllCall("Mf\MFCreateAudioRendererActivate", "PtrP", pIMFActivate)
      Return new IMFActivate(pIMFActivate)
   }
}

class IMFTopologyNode extends InterfaceBase {
   Create(type) {
      hr := DllCall("Mf\MFCreateTopologyNode", "UInt", type, "PtrP", pIMFTopologyNode)
      IMFTopologyNode.IsError("IMFTopologyNode::Create", hr)
      Return new IMFTopologyNode(pIMFTopologyNode)
   }
   SetUINT32(riid, value) {
      hr := DllCall(this.VTable(21), "Ptr", this.ptr, "Ptr", riid, "UInt", value)
      this.IsError("IMFTopologyNode::SetUINT32", hr)
   }
   SetUnknown(riid, pi) {
      hr := DllCall(this.VTable(27), "Ptr", this.ptr, "Ptr", riid, "Ptr", pi)
      this.IsError("IMFTopologyNode::SetUnknown", hr)
   }
   SetObject(pi) {
      hr := DllCall(this.VTable(33), "Ptr", this.ptr, "Ptr", pi)
      this.IsError("IMFTopologyNode::SetObject", hr)
   }
   ConnectOutput(OutputIndex, pDownstreamNode, dwInputIndexOnDownstreamNode) {
      hr := DllCall(this.VTable(40), "Ptr", this.ptr, "UInt", OutputIndex
                                   , "Ptr", pDownstreamNode, "UInt", dwInputIndexOnDownstreamNode)
      this.IsError("IMFTopologyNode::ConnectOutput", hr)
   }
}

class IMFRateControl extends InterfaceBase {
   SetRate(rate, fThin := true) {
      hr := DllCall(this.VTable(3), "Ptr", this.ptr, "UInt", fThin, "Float", rate)
      this.IsError("IMFRateControl::SetRate", hr)
   }
}

class InterfaceBase {
   __New(ptr) {
      this.ptr := ptr
   }
   __Delete() {
      ObjRelease(this.ptr)
   }
   VTable(idx) {
      Return NumGet(NumGet(this.ptr + 0) + A_PtrSize*idx)
   }
   IsError(method, result, exc := true) {
      if (result = 0)
         Return 0
      this.error := method . " failed. Result: " . ( result = "" ? "No result" : Format("{:#x}", result & 0xFFFFFFFF) )
                              . "`nErrorLevel: " . ErrorLevel
      if !exc
         Return this.error
      throw Exception(this.error)
   }
}

StringFromGUID(ByRef VarOrAddress) {
   pGuid := IsByRef(VarOrAddress) ? &VarOrAddress : VarOrAddress
   VarSetCapacity(sGuid, 78) ; (38 + 1) * 2
   if !DllCall("ole32\StringFromGUID2", "Ptr", pGuid, "Ptr", &sGuid, "Int", 39)
      throw Exception("Invalid GUID", -1, Format("<at {1:p}>", pGuid))
   return StrGet(&sGuid, "UTF-16")
}

CLSIDFromString(IID, ByRef CLSID) {
   VarSetCapacity(CLSID, 16, 0)
   if res := DllCall("ole32\CLSIDFromString", "WStr", IID, "Ptr", &CLSID, "UInt")
      throw Exception("CLSIDFromString failed. Error: " . Format("{:#x}", res))
   Return &CLSID
}

GetMp3StreamFromGoogle(text, lng, ByRef dataSize) {
   static hHeap := DllCall("GetProcessHeap", "Ptr")
        , flags := (HEAP_NO_SERIALIZE := 0x1) | (HEAP_ZERO_MEMORY := 0x8)
   if ( (text := Trim(text, " `t`n`r")) = "" )
      throw "Text to speach is empty"
	
	if !Ping4("translate.google.com")
		throw "Ping4(""translate.google.com"") failed with error: " . ErrorLevel
	
   chunks := [], text .= ".", pos := 1
   Loop {
      for k, v in ["\.", "!", "\?", ";", ",", ":", "\(", "\)", " ", "$"]
         RegExMatch(SubStr(text, pos, 200), "sO).+" . v . "+", m)
      until m.Len
      chunks.Push(m[0])
      pos += m.Len
   } until pos > StrLen(text)
   last := chunks.Pop()
   chunks.Push( SubStr(last, 1, -1) )

   size := offset := 0
   for k, v in chunks {
      url := CreateUrl(v, lng)
      Arr := SendMsxmlRequest(url)
      pData := NumGet(ComObjValue(Arr) + 8 + A_PtrSize)
      length := Arr.MaxIndex() + 1
      size += length
      if (A_Index = 1)
         pHeap := DllCall("HeapAlloc", "Ptr", hHeap, "UInt", flags, "Ptr", size, "Ptr")
      else
         pHeap := DllCall("HeapReAlloc", "Ptr", hHeap, "UInt", flags, "Ptr", pHeap, "Ptr", size, "Ptr")
      DllCall("RtlMoveMemory", "Ptr", pHeap + offset, "Ptr", pData, "Ptr", length)
      offset := size
   }
   pIStream := DllCall("Shlwapi\SHCreateMemStream", "Ptr", pHeap, "UInt", dataSize := offset, "Ptr")
   DllCall("HeapFree", "Ptr", hHeap, "UInt", 0, "Ptr", pHeap)
   Return pIStream
}

CreateUrl(text, lng) {
   static JS := CreateScriptObj()
   url := "https://translate.google.com/translate_tts?ie=UTF-8&tl="
         . lng . "&total=1&idx=0&client=t&prev=input&textlen="
         . StrLen(text) . "&tk=" . JS.eval("tk").(text) . "&q=" . EncodeDecodeURI(text)
   Return url
}

SendMsxmlRequest(url) {
   Whr := ComObjCreate("Msxml2.XMLHTTP.6.0")
   Whr.Open("GET", url, false)
   Whr.Send()
	status := Whr.Status
   if (status != 200)
      throw "HTTP status: " . status . "`n`n" . Whr.responseBody
   Return Whr.responseBody
}

GetBase64String(name)
{
	IconGoogle16 =
	(
		aAQAACgAAAAQAAAAIAAAAAEAIAAAAAAAQAQAAAAAAAAAAAAAAAAAAAAAAADt5+GR
		/Pr49/78+//p0Ln/sUsA/71iAP+8YQD/vGEA/7xhAP+8YQD/vGEA/7xhAP+8YQD/
		vGEA/7thAPqxawGU/f38+/7+/v7//////Pr4/8yANf/HZwD/y3IQ/8tyEP/Lcg//
		ym8J/8txDv/LchD/y3EP/8puCf/LcQ/+ynMR+v7+/f/////////////////y3cr/
		1XYR/+GLJ//giSf/4Isq/+GPM//fiCX/4Ioo/9+IJP/hjzP/4Iss/96IJv/+/v7/
		/////////////////////+Wnbf/niCD/7ZY1/+mSMP/57eD/8bJr/+h9B//vqVz/
		+/Tu/+uYPP/rki///f7+//7////+/////v/////////37ef/4IQq/++YNP/sjiT/
		9NSx//vn0f/ytHL/+eLI//jiyv/sjiX/7pk6//z9/v/9/v///f7///3+///9/v//
		/////+m5kP/ohR7/8ZYv//CtZP/7+vn/78ab//v7+v/zuXn/75Eq//CbPf/8/P3/
		/v7///7////9/v///f3///7+///7+vv/4o0///GVL//wnD3/+Ora//SxZ//68OT/
		8aFH//GZOP/ynT///f3+//z59//89vH///////7//////////////+/Ruf/nhCD/
		9Zct//XSq////fz/+d2///KULP/0n0D/9J9B//39/v/7+PP/8cmi//PCk//9+vf/
		88WY/+ybS//7+PX/5aBj//KOI//1smj/9uzh//W3dP/2mTT/9qBC//ahQ//7+/3/
		/f7///3////ww5f/6o0y/+uVQv/yxZj//Pjy//Tl2//mhSn/+KA9//ScO//3nz7/
		+KJF//iiRP/4o0X//Pv+//38///+////+e/n/+Z6Ef/0y6T///////3+////////
		6K18//COKf/7pUX/+aNF//mjRv/5o0b/+aRH//v7/f/8/f///v////XWuf/yzqz/
		65VA//3////9/////f7///jx7v/mijb/+qFA//umSP/7pUj/+6VI//ulSf/8/P7/
		+/r7//Xhz//02L7/9+nc/+qcUf/wvYv/+e7i//v9///+////7MGf/+2JJ//9qUv/
		+6ZJ//umSf/7pkr//Pv+//v6/f/59O7/9+3k/+qZSv/58u7/8cqk//nv6P/8/f//
		/P3///r7/f/mk0v/+Jw7//2pS//8p0r//adL//v6/fn8/P/+/P////ny7v/23sr/
		/P3///3////8/v//+/v///v7///+////8tbB/+uKL//+qEn//qhL/v2oTfn69/Sb
		+/v++fr6/v/8///+/v///vv8//77+/7++/v+/vv7/v77/P7++/7+/vv///7nk0/+
		+Jk7//6oTPv5qFOXAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==
	)
	IconGoogle32 =
	(
		qBAAACgAAAAgAAAAQAAAAAEAIAAAAAAAgBAAAAAAAAAAAAAAAAAAAAAAAADn3tQD6OHatvv49P/8+PX8+/j0/vz59f/58ev/t2ER/7daAf+8YgL/umAA/7thAf+7YQH/
		u2EB/7thAf+7YQH/u2EB/7thAf+7YQH/u2EB/7thAf+7YQH/u2EB/7thAf+7YQH/u2EB/7thAf+7YQH+u2AA/LtgAP+sWwHEzogDCfLu6MX+/f38//////////7/////
		/fz6///////Zqn7/tVMA/8RsC//DaAb/w2kG/8NpBv/DaQb/w2kG/8NpBv/DaQb/w2kG/8NpBv/DaQb/w2kG/8NpBv/DaQb/w2kG/8NpBv/DaQb/w2kG/8NpBv/DaQb+
		wmgF/8NpBv64bA7E///+///////////////////////+/f3//v7+//v38//EciX/xGgJ/8x0Ev/KcQ//y3IQ/8tyEP/LchD/y3IQ/8tyEP/LchD/y3IQ/8tyEP/LchD/
		y3IQ/8tyEP/LchD/y3IQ/8tyEP/LchD/y3IQ/8tyEP/Lcg//ynEP/811Ef/+/fz9/////v/////+/v7////////////9/Pv//////+nIqP/DYwb/1H4f/9R8Gv/UfBr/
		1H0b/9R9G//UfRv/1H0b/9R9G//Vfh3/1X4e/9V9HP/UfRv/1H0b/9R9G//UfRv/1H0b/9V+Hf/Vfh7/1X0c/9R8Gv/UfBr+1X8d/f79+/7/////////////////////
		/v7+//7+/v/+/Pv//v79/9eSUf/Sdhb/34so/92HJf/eiCb/3ogm/96IJv/eiCb/3ogm/92DHP/dghr/3oYi/96JJ//eiCb/3ogm/96IJv/eiSf/3YQd/92CGv/dhR//
		3okn/92HJf/eiyn+/v38//////////////////////////////////38+//+////9eLR/9J1Hf/jjS//55Ew/+WQL//nkTD/5pEw/+aRMP/lkC//6qpm/+2xcv/onUj/
		5o8s/+aRMf/nkTD/5pEx/+aQLv/qqF//7bFy/+mjVf/mjiv/5pEw/+eTM//9/f3//v////7////+/////v////7////+/v7//v////38+v//////46l1/9p5G//slzn/
		6pQ0/+uUNf/rlTX/65Y4/+iMKP/w2L7///////XSq//pjSb/65Y4/+uUNf/rkzP/65pB//v28v//////7ruE/+mOKP/rljj/65c4//79/P//////////////////////
		/////////////v7//v38//7+/f/57+b/130t/+WNMP/tmDj/65Y2/+yXN//smDn/7JAo/+qydf/9/fz/++/h/+yXOP/sljT/7Jg5/+uQKv/vtXT//v79//r07f/qnET/
		7JUz/+yWN//smTr//f39//7////+/////v////7////+/////v////7//v/+/////fz7///////pvpn/2Xgd/+yYO//umDj/7Zc3/+2YOf/uljT/6pxG//j07///////
		8a9n/+ySMP/tmj7/65Iu//bXtf/+/v7/9dy//+uRLP/umTv/7Zc3/+6aPP/8/f3//f7///3+///9/v///f7///3+///9/v///f7///3+/v/9/v7//f38//z59v/bi0X/
		44cr/++bPP/umTn/75k5/++aPP/sky//8trA//7+/v/99e7///bu///48f/+9e3//fr2///////xv4f/7pIr/++bPf/umDn/75s9//39/f/+/v///v3///7+///+/v//
		/v7///7+///+/v///v7///7+///8+/r///////DSuv/Zdx//7JY6//CaO//vmTr/8Js9//CULv/tuoH//v////r18P/t3Mr/7dvJ//Dk2P//////+/n2/+6jUP/wlzX/
		75o8//CZOv/wnD7//f39//79///+/P///v3///79///+/f///v3///79///+/f///f3+//39/v/9/Pz//v///+CbYf/gfyP/8Jw///CbPP/wmzz/8Zk3/+yhTv/5+fj/
		/PTq/+uYO//qih//77yD//7+/v/34Mf/75Uy//GcPf/wmzv/8Jo7//GdP//9/f3//v7///79///+/v///v7///7+///+/v///v7///7+///+/v///v7///38/P/+/v7/
		9eTW/9p7J//qkzj/8p0+//GcPf/ynkD/75c1//Pex///////9rl3//GULP/65c7///////LBi//xlTD/8p5A//KcPv/xnD3/8p5B//39/f/9/v///fz+//39/v/9/f7/
		/f3+//39/v/+/v///v7///7+///9/f7//v7///z8+///////5q+A/959I//wmz//850+//KeQf/ylzL/776I//7+/v/506n/8aBH//37+v/8+/j/8adW//OaOf/ynT//
		850+//KcPf/zn0L//P39//79///+/f///v////39///9/Pv//f3+//3+/v/9/f7//f3+//7+///9/P3//fv6//38/P/68+3/3YU5/+iMMv/0nkD/855A//SbOv/vpVP/
		+vz9//3r2P/0voP///////jizP/ymTj/9J9B//SeP//0nj//850+//SgQ//9/f3//f7+//38/f/67uP//v/////////+/////fz8//7+///9/f7//fz9////////////
		/f7////+/v/txaT/3Xog//CZP//1oEH/9aBC//KaOP/15NL//vr2//nkzv/+/v3/9cWR//SZNP/1oUT/9Z9B//WfQf/0nkD/9aFE//z8/f/9/f3//fz8//HStP/sq2z/
		9cme//z38//+/////fz7//3+///+////+OLN/++vcP/21bX///////z6+f/gk1L/5YYt//SfQ//2okX/9Zkz//HFlP////////////3////zq1v/9p08//WgQ//2oEL/
		9qBC//WfQf/2okX/+/39//z+/v/8/P3//v////bn2f/nmk7/6o40//XQq//9////+/j0//C0eP/pii3/6YIe/+qKK//22r3//v////HXwv/ceST/7ZU+//ahRP/2nTz/
		8ahZ/+zXv//t2cL/7syo//WeP//2oEP/9qBC//agQv/2oEL/9Z9B//aiRf/8/P3//f3+//38///8+/v//v////v9/v/pqm3/53wT//C0ef/tpV7/6IId/+mHJ//qlUL/
		7a5w//PQrv/8+/v//v///+Skbv/igSj/851D//eiRP/2n0D/85s5//ObOf/0nDr/96JE//ehQ//3oUP/96FD//ehQ//2oEL/96NG//z7/f/9/P///Pv+//39///8+/z/
		/fz9//r8/f/qqWn/6YMg/+qKLP/qkz7/8cGT//nx6f/9/////v////z7/P/9/v7/9+rg/92BMf/qkDn/96FE//eiRP/4o0b/+aRG//ijRv/4okT/+KJE//iiRP/4okT/
		+KJE//ehQ//4pEj//Pz9//39///9/P///Pz+//39///7+fr//v////Tcxv/piSr/6ogo//PHnP///////P3///z7/P/8+/z//f3///v6+v//////6reM/+B8Iv/ynEL/
		+aRF//iiRP/5o0X/+aNF//mjRf/5o0X/+aNF//mjRf/5o0X/+KJE//mlSf/8/P3//P3///z8///8/f///Pz+//z7/P/9////7axt/+iHKf/piy7/7Z9S//z49f/8/Pz/
		/Pz+//z8/v/8/P7//Pz9//z8/f/79fH/4IpB/+iKMv/2oUT/+aRG//ijRf/5pEb/+aRG//mkRv/5pEb/+aRG//mjRf/4o0X/+aVJ//z7/f/9/P///fv///38///8+/3/
		/f7///js4v/pkDj/9N3H/+mcUP/pgh7/9ti9//3+/f/7+vv//fz+//38///9/f//+/r7///////wzLD/33wl//CZQv/6pUf/+aRH//qlR//6pUf/+qVH//qlR//6pUf/
		+qVH//qkRv/6pkr//Pz9//z8/v/8/P///Pz9//v49//9/fz/8cSa//C7iP//////7beC/+h+F//wtXv//v////v4+P/8+/z//P3///z8/v/8/P7//Pv8//38+//kmFj/
		5oYu//afRf/7pkj/+qRH//ulSP/7pUj/+6VI//ulSP/7pUj/+6RH//umS//8+/3//P3///v7///8/////f////3////wxJn/+/r5//7////z38z/6Ico/+uQNv/35NH/
		/f////z////7/P7//P3///z8///6+vv//f7///Tfzv/ffyv/7ZQ9//mjR//7pkj/+qVI//umSP/7pkj/+6ZI//umSP/7pUf/+6dL//z7/f/7+/3//Pz///fo3P/zz6z/
		8tK0/++/kP/13ML/9uHM//LWuv/njTX/6JpN//HAkP/20rH/9di8//z9///7+/3/+/z+//v8///6+fv//v///+iref/jgCj/85xE//ymSP/6pEj/+6VI//ulSP/7pUj/
		+6VI//ukR//7p0z//Pr9//v7/f/8/P//9+vh//TdyP/14tL/9eTV//Xi0f/rqWn/8MCR//fp2//05tn/6JVF/+d+Fv/007P//P7+//v6/P/8+////Pv+//v6/P/8/f3/
		+O3k/+CDNf/rjzr/+KJG//ynSf/7pUj//KZJ//ymSf/8pkn//KVI//yoTP/8+/3+/Pz///v6///8/////f////z////9////+fLt/+mGJf/slUD//Pz9//3////z38z/
		9NrC//3////7+v3//Pz///z8///7/P7//Pz///r5+//+////7b2X/+J/KP/xmkT//KdJ//ynSv/8p0r//adK//2nSv/9pkn//ahN/vz7/f37+/7+/Pv///v7/f/7+v3/
		+vn6//v9/f/tuYf/6I41//HIoP/7/Pv/+/n7//3////9////+/r9//z8///8+/7/+/z///v8///7+/7/+/v+//v7/P/7+Pb/45BL/+mJM//3n0X//qhL//ymSf/9p0v/
		/adK//2mSf79qE79/Pv9//z8///7+v///Pz///v7/v/7/P//+/v+//ju5v/59fT//P////z7/v/8+/7/+/r8//v6/P/8/P///Pv+//z8///8/P///Pz///z8///8/P//
		+vn7//3////y0rn/4X0l/++WQP/7pUj//ahL//2nSv/+qEv//adK//6pTv/79fLG+/v9+vv7/v/7+/7++/z///v7///7/P///P////z9///7+v3/+/z///v8///7+/7/
		+/z///v8///7/P//+/z///v8///7/P//+/z///v7/v/7+/7/+/r8//3+///noWf/5oUu//ScRP/9qEv//ahL/v6oS//9qUz896lTwPv28Av6+fjD+vv+//r7/vz7+/7+
		+/v+/vv7/v76+/3++vv+/vv7/v77+/7++/v+/vv7/v77+/7++/v+/vv7/v77+/7++/v+/vv7/v77+/7++/v+/vv7/v75+Pr+/P/+/vPTvP7ieCX+75A//vufRv7/pEn8
		/qJI/vylT8z2pE4IgAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAE=
	)
	IconSwap =
	(
		aAQAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAUAAAAQAAAAGQAAABsAAAAS
		AAAACAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHx8fFt
		+Pj4tfj4+LXPz89/AAAAJgAAABMAAAAFAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAADy8vIuyLqzyGI3IP9iNyD/+Pj4tTs7O0MAAAAiAAAADAAAAAIAAAAA
		AAAAAAAAAAAAAAACAAAABAAAAAUAAAAEAAAAAvb29mv4+Pi1fkcq/7GRgNrCwsKI
		AAAANAAAABcAAAAFAAAAAAAAAAAAAAACAAAACQAAABIAAAAYAAAAEgAAAAsAAAAI
		5ubmcr6YhNqUVDH/2MO4yG9vb2UAAAAsAAAAEgAAAAAAAAACAAAACd/f33b4+Pi1
		ysrKggAAADAAAAAgAAAAFsXFxWPNqZPWpmE3/8igh9qzs7OTAAAARAAAACQAAAAC
		AAAACd/f33b4+Pi1sms5//j4+LW5ubmOx8fHhPj4+LX4+Pi1ypt64LJrOf+yazn/
		+Pj4tfj4+LXPz89/AAAABOjo6HH4+Pi1uHE5/7hxOf+4cTn/+Pj4tfj4+LW4cTn/
		uHE5/7hxOf+4cTn/uHE5/7hxOf+4cTn/+Pj4tfPz82z4+Pi1vXg5/714Of+9eDn/
		vXg5/714Of/4+Pi1+Pj4tb14Of+9eDn/vXg5/714Of+9eDn/+Pj4td/f33b4+Pi1
		wn85/8J/Of/Cfzn/wn85/8J/Of/Cfzn/wn85//j4+LX4+Pi1wn85/8J/Of/Cfzn/
		+Pj4td/f33YAAAAJ9vb2a/j4+LX4+Pi1xoc5/8aHOf/Xrnrg+Pj4tfj4+LXm5uZy
		8fHxbfj4+LXGhzn/+Pj4tejo6HEAAAAJAAAAAgAAAAAAAAAA8/PzbN26iNrKjjn/
		4MGU1qenp3UAAAAqAAAAEAAAAAP29vZr+Pj4tfPz82wAAAAEAAAAAgAAAAAAAAAA
		AAAAAPLy8i7q2brIzpc4/9+/iNrHx8eEAAAALQAAABYAAAAFAAAAAQAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB8/PzbOTJhtrVqDX/+Pj4tdTU1HwAAAAZ
		AAAACAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOnp6RH4+Pi1
		2rUz/9q1M//u4rnIw8PDOQAAAAUAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAA9vb2a/j4+LX4+Pi17+/vbgAAAAcAAAADAAAAAQAAAAAAAAAA
		AAAAAAAAAAAAAAAA/gEAAP4AAAD+AAAA4AAAAMAAAACAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAADAAQAAwB8AAMAfAADgHwAA8B8AAA==
	)
	IconPlayPause =
	(
		UAoAACgAAAAZAAAAMgAAAAEAIAAAAAAAxAkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAQAAAAEAAAABAAAAAQAAAAAAAAAA
		AAAAAAAAAAAAAAABAAAAAQAAAAEAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB
		AAAAAQAAAAIAAAACAAAAAgAAAAIAAAABAAAAAQAAAAEAAAABAAAAAQAAAAIAAAACAAAAAQAAAAEAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAIAAAAHAAAADwAAABAAAAAKAAAAAwAAAAIAAAABAAAAAQAAAAIAAAAE
		AAAAAwAAAAIAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKmpqQPJyckTAAAAFgAAABcAAAAX
		AAAAFwAAABUAAAAHAAAAA+zs7Cnn5+cqAAAACQAAAAgAAAACAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAPv7+0D+/PqS9uXTnfHx8W66uro8AAAAFwAAABcAAAAXAAAAF+vr61nsxJ2t7MSdreXl5VcAAAANAAAAAwAAAAEAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wL+/PqS0nQY7s1mAf/Wgi/g9d/Kn9/f31k9PT0dAAAAFwAAABf9/f2P
		zmgE/M5qCPr9/f2LAAAAEQAAAAQAAAACAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///8K+e3hmdBpBP/QaQT/
		0GkE/9FtC/rjpWfD/vz6ks3NzUgAAAAX////kdBpBP/QaQT/////kQAAABEAAAAEAAAAAgAAAAEAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAA////Cfvx55fTbAf/02wH/9NsB//TbAf/02wH/9h9Iury1bam5OTkXv///5HTbAf/02wH/////5EAAAAR
		AAAABAAAAAIAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wn78eeX13AL/9dwC//XcAv/13AL/9dwC//XcAv/
		13EN/uakZMf///+R13AL/9dwC/////+RAAAADQAAAAMAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///8J
		+/Hnl9t0D//bdA//23QP/9t0D//bdA//23QP/9t0D//bdhL8/vz6ktt0D//bdA//////kQAAAAcAAAACAAAAAQAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////Cfzy6JfgeRP/4HkT/+B5E//geRP/4HkT/+B5E//gehX+7Kxsxv///5HgeRP/
		4HkT/////5EAAAADAAAAAgAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wn88uiX5X4Y/+V+GP/lfhj/
		5X4Y/+V+GP/ojjXp+Ny/pP///1T///+R5X4Y/+V+GP////+RAAAAAgAAAAEAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAD///8K/PDkmemCHP/pghz/6YIc/+qFIvryt3zB//37kv///zgAAAAA////kemCHP/pghz/////kQAAAAEAAAAB
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////Av/9+5LvjzHy7och//GeS9/86dWe////Tv///wMAAAAA
		AAAAAP///47uiCT87oon+v///4oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///9E
		/vjylf3n0p////9m////KwAAAAAAAAAAAAAAAAAAAAD///9S+9WvrPvVr6z///9OAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wX///8TAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///yT///8k
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////gP///4D///+A////gP8Hh4D+AAOA/gADgP4AA4D8AAOA+AABgPgAAYD4AAGA
		+AADgPgAA4D4AAOA+AADgPgCB4D4Bh+A/B4fgP5/P4D///+A////gP///4D///+A////gA==
	)
	IconStop =
	(
		aAQAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAANmrlAC4WysAuFsrAL5gLQDBYy4AwWMuAMtqMADLajAA
		y2owANFvMgDRbzIA13Q0ANd0NADtupkAAAAAAAAAAAC0WCoA3HA7AOB6RQDjgU4A
		5YxXAOiVXwDqnGYA7aVuAPCtdgD0t34A976FAPnEiQD5xIkA13Q0AAAAAAAAAAAA
		tFgqAN1sNgDSYSUA1GYoANhtLQDXdDQA4H05AOSEPgDpjkYA7ZdMAPCdUAD0pVYA
		+cSJANd0NAAAAAAAAAAAALRYKgDdbDYA0F0iANJhJQDYbS0A13Q0AOB9OQDkhD4A
		5olCAOqQRwDtl0wA8J1QAPe+hQDRbzIAAAAAAAAAAACyVikA3Ww2ANBdIgDSYSUA
		2G0tANhtLQDddjQA4H05AOSEPgDmiUIA6Y5GAO2XTADztHwA0W8yAAAAAAAAAAAA
		slYpAN1yQQDOWiAA0mElANJhJQDYbS0A13Q0AN12NADgfTkA5IQ+AOaJQgDmiUIA
		8K12AMtqMAAAAAAAAAAAALJWKQDjiV0AzlogANBdIgDSYSUA2G0tANhtLQDXdDQA
		3XY0AOB9OQDgfTkA5IQ+AO2lbgDLajAAAAAAAAAAAACvVCkA5ZRsANd3RQDUZigA
		0F0iANJhJQDVaCkA2G0tAN12NADddjQA4H05AN54NgDqnGYAyGcwAAAAAAAAAAAA
		r1QpAOWZcgDYeUcA2HlHAN1yQQDWbjYA2G0tANVoKQDVaCkA2G0tANhtLQDXdDQA
		6JVfAMFjLgAAAAAAAAAAAK9UKQDlnXgA13hIANd4SADYeUcA2HlHANh5RwDYeUcA
		4HpFANx7QQDbeT4A3HtBAOiVYwDBYy4AAAAAAAAAAACqUScA5qF+ANZ3SADYeUcA
		2HlHANh5RwDYeUcA2HlHANx7QQDYeUcA3H1JANh5RwDolWMAwWMuAAAAAAAAAAAA
		qE8mAOajggDagVUA2oFVANqBVQDagVUA3H1JANqBVQDcfUkA3H1JANh5RwDjgU4A
		44ldALhbKwAAAAAAAAAAAKZNJgDlnXgA5qOCAOahfgDlmXIA5ZlyAOWUbADolWMA
		44ldAOKCUgDjfEoA44FOAOKCUgC4WysAAAAAAAAAAADRpZEApk0mAKhPJgCvVCkA
		r1QpAK9UKQCvVCkAslYpALJWKQC0WCoAtFgqALRYKgC0WCoA2auUAAAAAAAAAAAA
		AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		AAAAAAAAAAAAAAAA//8AAIABAACAAQAAgAEAAIABAACAAQAAgAEAAIABAACAAQAA
		gAEAAIABAACAAQAAgAEAAIABAACAAQAA//8AAA==
	)
	IconTranslate =
	(
		aAQAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAABILAAASCwAAAAAAAAAAAAD///8A
		////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A
		////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A
		////AP///wD///8A////AP///wD///8A////AP///wD///8A////ALJnFgCpXhAA
		olcKAJxRBQCXTAJIl0wCSJxRBQCiVwoAqV4QALJnFgD///8A////AP///wD///8A
		////AP///wCyZxYAqV4QAKJXCgCdUgZcnFEFzJxRBcydUgZcolcKAKleEACyZxYA
		////AP///wD///8A////AP///wD///8AsmcWAKleEACjWAtcolcKzP+8Hv//uxv/
		olcKzKNYC1ypXhAAsmcWAP///wD///8A////AP///wD///8A////ALJnFgCqXxFc
		qV4QzP/DMf//sgD//7IA//++I/+pXhDMql8RXLJnFgD///8A////AP///wD///8A
		////AP///wCzaBdcsmcWzP3JSf/9vSb//bYU//y1Ev/9uh7//cAv/7JnFsyzaBdc
		////AP///wD///8A////AP///wD///8Aum8cmbtwHcy7cB3Mu3AdzPK3OP/ytTX/
		u3AdzLtwHcy7cB3Mum8cmf///wD///8A////AP///wD///8A////ALtwHQC9ch4A
		wHUgAMR5JMznslD/57BN/8R5JMzAdSAAvXIeALtwHQD///8A////AP///wD///8A
		////AP///wC7cB0AwnciAM2CKwDNgivM67pr/+a1Zf/NgivMzYIrAMJ3IgC7cB0A
		////AP///wD///8A////AP///wD///8Ayn8oANaLMQDWizEA1osxzPXIfP/1xnr/
		1osxzNaLMQDWizEAyn8oAP///wD///8A////AP///wD///8A////AN6TNwDekzcA
		3pM3AN6TN8z60YX/+tCE/96TN8zekzcA3pM3AN6TNwD///8A////AP///wD///8A
		////AP///wDkmTwA5Jk8AOSZPADkmTzM/9+T///fk//kmTzM5Jk8AOSZPADkmTwA
		////AP///wD///8A////AP///wD///8A6J0+AOidPgDonT4A6Z4/memeP8zpnj/M
		6Z4/meidPgDonT4A6J0+AP///wD///8A////AP///wD///8A////AP///wD///8A
		////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A
		////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A
		////AP///wD///8A//8AAP//AAD+fwAA/D8AAPgfAADwDwAA4AcAAOAHAAD8PwAA
		/D8AAPw/AAD8PwAA/D8AAPw/AAD//wAA//8AAA==
	)
	Return Icon%name%
}

CreateLangArray()
{
	Languages =
	(LTrim C
		Азербайджанский|az
		Албанский|sq
		English|en
		Арабский|ar
		Армянский|hy
		Африкаанс|af
		Баскский|eu
		Белорусский|be
		Бенгальский|bn
		Бирманский|my
		Болгарский|bg
		Боснийский|bs
		Ваалийский|cy
		Венгерский|hu
		Вьетнамский|vi
		Галисийский|gl
		Греческий|el
		Грузинский|ka
		Гуджарати|gu
		Датский|da
		Зулу|zu
		Иврит|iw
		Игбо|ig
		Идиш|yi
		Индонезийский|id
		Ирландский|ga
		Исландский|is
		Испанский|es
		Итальянский|it
		Йоруба|yo
		Казахский|kk
		Kanada|kn
		Каталанский|ca
		Kitai|zh
		Китайский (Аомынь)|zh-cn
		Китайский (Тайвань)|zh-tw
		Корейский|ko
		Латынь|la
		Латышский|lv
		Литовский|lt
		Македонский|mk
		Малагасийский|mg
		Малайский|ms
		Малайялам|ml
		Мальтийский|mt
		Маори|mi
		Маратхи|mr
		Монгольский|mn
		Немецкий|de
		Непали|ne
		Нидерландский|nl
		Норвежский|no
		Панджаби|pa
		Персидский|fa
		Польский|pl
		Португальский|pt
		Румынский|ro
		Russian|ru
		Себуанский|ceb
		Сербский|sr
		Сесото|st
		Сингальский|si
		Словацкий|sk
		Словенский|sl
		Сомали|so
		Суахили|sw
		Суданский|su
		Тагальский|tl
		Таджикский|tg
		Тайский|th
		Тамильский|ta
		Телугу|te
		Турецкий|tr
		Узбекский|uz
		Украинский|uk
		Урду|ur
		Финский|fi
		Французский|fr
		Хауса|ha
		Хинди|hi
		Хмонг|hmn
		Хорватский|hr
		Чева|ny
		Чешский|cs
		Шведский|sv
		Эсперанто|eo
		Эстонский|et
		Яванский|jw
		Японский|ja
	)
	LangArray := {}
	Loop, parse, Languages, `n, `r
	{
		RegExMatch(A_LoopField, "(.+)\|(.+)", m)
		LangArray[m1] := m2
	}
	Return LangArray
}