/*
[script info]
version     = 0.8
description = reload running scripts from a context menu
author      = davebrny
source      = https://gist.github.com/davebrny/4f14e1edb4fac2fc2459c3d87fa537f7

[settings]
hotkey_menu    = ^+`
hotkey_default = ^`
hotkey_last    = !`
icon_size = 32
sort_by_recent = true
default_script = C:\Users\PavelTrud\Documents\AHK\AHKGlobal\library\Reloader.ahk 

[ini end]
*/

#noEnv
#singleInstance, force
SetWorkingDir %A_MyDocuments%\AutoHotkey\Lib\  ; User library.
detectHiddenWindows, on
setTitleMatchMode 2
onExit, save_exit

iniRead, section, % a_lineFile, settings  ; load ini settings
loop, parse, % section, `n, `r
    {
    stringGetPos, pos, a_loopField, =, L1
    stringMid, ini_key, a_loopField, pos, , L
    stringMid, ini_value, a_loopField, pos + 2
    %ini_key% := ini_value
    }
sort_type := (sort_by_recent = "true") ? "recent" : "alphabetical"

menu, tray, add
menu_add_options("tray")
if (default_script)
    {
    filename := filename(default_script)
    menu, tray, add,     % filename, script_reload_tray
    menu, tray, default, % filename
    menu, tray, tip, % "reloadr  (" filename ")"
    }
menu, tray, click, 1    ; reload the default script with 1 click

; tray_icon := script_icon(a_lineFile)   ; [ search for an icon: git.io/vyBcQ ]
if (tray_icon)
     menu, tray, icon, % tray_icon
else menu, tray, icon, % a_winDir "\System32\shell32.dll", 239  ; 239 = reload icon on windows 10

hotkey, % hotkey_menu,    create_menu
hotkey, % hotkey_default, default_script
hotkey, % hotkey_last,    last_script

return ; end of auto-execute ---------------------------------------------------









create_menu:
setBatchLines, -1
script_paths := running_scripts()
if (sort_type = "alphabetical")
    sort, script_paths

menu, main_menu, useErrorLevel
    ; put default at the top
if (default_script) and (sort_type = "recent")
    {
    menu_add(default_script)
    if (inStr(script_paths, "`n"))
        menu, main_menu, add
    }
    ; add the rest
loop, parse, % script_paths, `n
    {
    if (sort_type = "recent") and (a_loopField = a_lineFile)
        continue
    else menu_add(a_loopField)
    }
    ; put reloadr.ahk at the end
if (sort_type = "recent")
    menu_add(a_lineFile)

menu, main_menu, add
menu, main_menu, default, % item_name(default_script)
menu, main_menu, useErrorLevel, off
menu_add_options("main_menu")
toolTip,
menu, main_menu, show
menu, main_menu, delete
try menu, startup_scripts, delete
setBatchLines, 10
return



default_script:   ; (hotkey labels)
last_script:
script_paths := running_scripts()
if (last_script = "") ; switch to the last script that was reloaded
    {
    loop, parse, % script_paths, `n
        last_script := a_loopField
    until (a_loopField != default_script) and (a_loopField != a_lineFile)
    }

if (%a_thisLabel% = "")
    msg_tool(strReplace(a_thisLabel, "_script") " reload not set")
else
    {
    reload_script(%a_thisLabel%)
    msg_tool(filename(%a_thisLabel%) "`n`nreloaded")
    }
return



reload_script(script_path) {
    global
    if (script_path)
        {
        if (script_path != default_script)
            last_script := script_path
        run, "%script_path%" /restart
        }
}


running_scripts() {
    global default_script, last_script

    winGet, running, list, ahk_class AutoHotkey
    loop % running
        {
        winGetTitle, title, % "ahk_id " running%a_index%
        path := regExReplace(title,"\s-\sAutoHotkey\s.*")
        script_paths .= (script_paths ? "`n" : "") . path
        }
        ; reset defaults if they dont exist
    if !inStr(script_paths, default_script)
        default_script := ""
    if !inStr(script_paths, last_script)
        last_script := ""

    return script_paths
}


menu_add_options(parent_menu) {
    global sort_type, script_paths
    try menu, % "main_menu_options", delete
    options := parent_menu "_options"

    if (parent_menu != "tray")
        {
        menu, % options, add, Help      , script_help
        menu, % options, add, Window Spy, script_window_spy
        menu, % options, add

        menu, startup_scripts, add,     Select to run a shortcut:, run_shortcut
        menu, startup_scripts, disable, Select to run a shortcut:
        menu, startup_scripts, add
        loop, files, % a_startup "\*.lnk", F   ; add any ahk shortcuts
            {
            fileGetShortcut, % a_loopFileFullPath, target
            splitPath, % target, filename, , file_ext
            if (file_ext = "ahk")
                {
                menu, startup_scripts, add, % filename, run_shortcut  
                if inStr(script_paths, "\" filename)     
                    menu, startup_scripts, check, % filename       
                }
            }
        if (file_ext = "ahk")
            menu, startup_scripts, add
        menu, startup_scripts, add, Reload Startup Folder, reload_startup_folder
        menu, startup_scripts, add, Reload .ahk Only     , reload_startup_ahk
        
        menu, main_menu_options, add, Startup Scripts, :startup_scripts
        }
    menu, % options, add, Sort By Recent, change_sort_type
    menu, % options, % (sort_type = "recent") ? "check" : "unCheck", Sort By Recent
    menu, % options, add
    menu, % options, add, Compile All, Compile_All_Scripts
    menu, % options, add, Reload All, reload_all
    menu, % options, add, Exit All, exit_all
    menu, % parent_menu, add, Options, % ":" options
}


item_name(script_path) {    ; add (s)(p) to item text
    global is_paused, is_suspended
    script_state(script_path, is_paused, is_suspended)
    state .= (is_suspended) ? "(s)" : ""
    state .= (is_paused)    ? "(p)" : ""
    if (state)
        state := a_tab . state
    script_name := filename(script_path)
    return script_name . state
}


script_state(script_path, byRef is_paused, byRef is_suspended) {
    ; by Fanatic Guru ; https://autohotkey.com/board/topic/57245-how-can-i-find-if-other-script-is-pausedsuspended-4-pausing/#entry647835
    winGet, script_id, id, % script_path " ahk_class AutoHotkey"
        ; Force the script to update its Pause/Suspend checkmarks.
    SendMessage, 0x211,,,, ahk_id %script_id%  ; WM_ENTERMENULOOP
    SendMessage, 0x212,,,, ahk_id %script_id%  ; WM_EXITMENULOOP
        ; Get script status from its main menu.
    mainMenu := DllCall("GetMenu", "uint", script_id)
    fileMenu := DllCall("GetSubMenu", "uint", mainMenu, "int", 0)
    is_paused := DllCall("GetMenuState", "uint", fileMenu, "uint", 4, "uint", 0x400) >> 3 & 1
    is_suspended := DllCall("GetMenuState", "uint", fileMenu, "uint", 5, "uint", 0x400) >> 3 & 1
    DllCall("CloseHandle", "uint", fileMenu)
    DllCall("CloseHandle", "uint", mainMenu)
}


menu_add(script_path) {
    global icon_size, is_paused, is_suspended

    menu_text := item_name(script_path)
    menu, main_menu, add, % menu_text, script_reload

    if isFunc("script_icon")
        icon_path := icon_search(script_path)
    menu, main_menu, icon, % menu_text, % icon_path, , % icon_size

    splitPath, script_path, filename, , file_ext, name_no_ext
    try menu, % menu_text, delete
    if (file_ext = "ahk")
        {
        menu, % menu_text, add, Set As Default     , set_as_default
        menu, % menu_text, add
        menu, % menu_text, add, Open               , script_open
        menu, % menu_text, add, Help               , script_help
        menu, % menu_text, add, Window Spy         , script_window_spy
        menu, % menu_text, add
        menu, % menu_text, add, Run At Startup     , run_at_startup
        menu, % menu_text, add, Reload This Script , script_reload
        menu, % menu_text, add, Edit This Script   , script_edit
        menu, % menu_text, add
        menu, % menu_text, add, Compile            , script_compile
        menu, % menu_text, add
        menu, % menu_text, add, Suspend Hotkeys    , script_suspend
        menu, % menu_text, add, Pause Script       , script_pause
        menu, % menu_text, add, Exit               , script_exit
        }
    else if (file_ext = "exe")
        {
        menu, % menu_text, add, Help               , script_help
        menu, % menu_text, add, Window Spy         , script_window_spy
        menu, % menu_text, add
        menu, % menu_text, add, Run At Startup     , run_at_startup
        menu, % menu_text, add, Reload This Script , script_reload
        menu, % menu_text, add, Exit               , script_exit
        }
    else if (inStr(script_path, "\\.\pipe\AHK_"))  ; piped buffer
        {
        menu, % menu_text, add, Open               , script_open
        menu, % menu_text, add, Help               , script_help
        menu, % menu_text, add, Window Spy         , script_window_spy
        menu, % menu_text, add
        menu, % menu_text, add, Suspend Hotkeys    , script_suspend
        menu, % menu_text, add, Pause Script       , script_pause
        menu, % menu_text, add, Exit               , script_exit
        }

    menu, % menu_text, default, Reload This Script
    if (is_paused)
        menu, % menu_text, check, Pause Script
    if (is_suspended)
        menu, % menu_text, check, Suspend Hotkeys

    shortcut := a_startup "\" name_no_ext ".lnk"
    ifExist, % shortcut
         menu, % menu_text, check, Run At Startup
    else menu, % menu_text, unCheck, Run At Startup

    menu, main_menu, add, % menu_text, % ":" menu_text
}


icon_search(script_path) {
    global
    squashed_path := "icon_" regExReplace(script_path, "[\W]")
    stored_in := %squashed_path%
    if (stored_in = "")
        {
        ; icon_path := script_icon(script_path)   ; [ search for an icon: git.io/vyBcQ ]
        if (icon_path)
            %squashed_path% := icon_path    ; store value for next time the menu opens
        }
    else icon_path := stored_in    ; use stored value
    return icon_path
}


full_path(filename) {    ; get the path that matches the filename
    global script_paths
    if (script_paths = "")
        script_paths := running_scripts()
    loop, parse, script_paths, `n
        {
        loop_filename := filename(a_loopField)
        if (filename = loop_filename)
            {
            full_path := a_loopField
            break
            }
        }
    return full_path
}


item_file(menu_item) {    ; get filename from menu text / remove (s)(p)
    if menu_item contains (s),(p)
        {
        if (subStr(menu_item, -2, 3) = "(p)")
            stringTrimRight, menu_item, menu_item, 3
        if (subStr(menu_item, -2, 3) = "(s)")
            stringTrimRight, menu_item, menu_item, 3
        menu_item := trim(menu_item)
        }
    return menu_item
}

filename(path) {
    splitPath, path, filename
    return filename
}

msg_tool(msg, d="1800") {
    toolTip, % msg
    setTimer, msg_timer, % d
}

msg_timer() {
    setTimer, msg_timer, off
    toolTip, ; close 
}

save_exit:
iniRead, saved_default, % a_lineFile, settings, default_script
if (default_script != saved_default)
    iniWrite, % " " default_script, % a_lineFile, settings, default_script
exitApp


; menu actions =================================================================


set_as_default:
item_file := item_file(a_thisMenu)
try menu, tray, delete, % filename(default_script)
menu, tray, add,     % item_file, script_reload_tray
menu, tray, default, % item_file
menu, tray, tip,     % "reloadr  (" item_file ")"
default_script := full_path(item_file)
msg_tool(item_file "`n`nset as default")
return

script_open:    ; open list lines
winGet, hwnd, id, % item_file(a_thisMenu) " ahk_class AutoHotkey"
postMessage, 0x111, 65300, , , % "ahk_id " hwnd  ; ID_TRAY_OPEN := 65300
return

script_help:
splitpath, a_ahkPath, , ahk_dir
run, % ahk_dir "\AutoHotkey.chm"
return

script_window_spy:
splitpath, a_ahkPath, , ahk_dir
run, % ahk_dir "\WindowSpy.ahk"
return

run_at_startup:
filename := item_file(a_thisMenu)
splitPath, filename, , , , name_no_ext
shortcut := a_startup "\" name_no_ext ".lnk"
ifExist, % shortcut
    {
    fileDelete, % shortcut
    msg_tool("shortcut deleted")
    }
else  ; create shortcut
    {
    script_path := full_path(filename)
    if isFunc("script_icon")
        icon_path := icon_search(script_path) 
    fileCreateShortcut, % script_path, % shortcut, , , , % icon_path
    msg_tool("shortcut created")
    }
return


script_reload:
script_reload_tray:
if inStr(a_thisLabel, "tray")
    {
    filename := item_file(a_thisMenuItem)
    script_path := default_script
    }
else
    {
    filename := item_file(a_thisMenu)
    script_path := full_path(filename)
    }

if getKeyState("shift", "P")
    {
    winClose, % script_path " ahk_class AutoHotkey"
    msg_tool(filename "`n`nclosed")
    }
else
    {
    script_state(script_path, is_paused, is_suspended)
    reload_script(script_path)
    state := (is_paused)    ? ",  un-paused"    : ""
    state .= (is_suspended) ? ",  un-suspended" : ""
    msg_tool(filename "`n`nreloaded" . state)
    }
return


script_edit:
run, % "edit " full_path(item_file(a_thisMenu))    ; open in the default note editor
return

script_compile:
script_path := full_path(item_file(a_thisMenu))
compile_this(script_path)
return

script_suspend:
filename := item_file(a_thisMenu)
postMessage, 0x111, 65305, , ,  % filename " - AutoHotkey"
script_state(filename, is_paused, is_suspended)
msg_tool((is_suspended) ? filename "`n`nsuspended" : filename "`n`nun-suspended")
return

script_pause:
filename := item_file(a_thisMenu)
postMessage, 0x111, 65306, , , % filename " - AutoHotkey"
script_state(filename, is_paused, is_suspended)
msg_tool((is_paused) ? filename "`n`npaused" : filename "`n`nun-paused")
return

script_exit:
filename := item_file(a_thisMenu)
winClose, % filename " ahk_class AutoHotkey"
msg_tool(filename "`n`nclosed")
return

run_shortcut:
filename := item_file(a_thisMenuItem)
splitPath, filename, , , , name_no_ext
shortcut := a_startup "\" name_no_ext ".lnk"
run, % shortcut
return

reload_startup_ahk:       ; ahk only
reload_startup_folder:    ; everything in the folder
msg_tool("startup refreshing . . . . ")
script_paths := running_scripts()
loop, files, % a_startup "\*.lnk"
    {
    fileGetShortcut, % a_loopFileFullPath, target
    if (target = "")
        continue
    splitPath, % target, filename, , target_ext,
    process, exist, % filename
    this_PID = %errorLevel%
    if (this_PID = 0)    ; if the specified process did not appear within 5.5 seconds
        {
        if inStr(a_thisLabel, "_ahk") and (target_ext != "ahk")
            continue
        if inStr(script_paths, target)    ; if the ahk script is already running 
            continue
        run, % a_loopFileFullPath
        msg_tool("starting: " a_loopFileName)
        }
    }
msg_tool("`nstartup reload complete")
return


change_sort_type:
if (sort_type = "recent")
    {
    sort_type := "alphabetical"
    menu, %a_thisMenu%, unCheck, Sort By Recent
    }
else    ; if alphabetical
    {
    sort_type := "recent"
    menu, %a_thisMenu%, check, Sort By Recent
    }
iniRead, saved_value, % a_lineFile, settings, sort_by_recent
new_value := (sort_type = "recent") ? "true" : "false"
if (new_value != saved_value)
    iniWrite, % " " new_value, % a_lineFile, settings, sort_by_recent
toolTip, % "sort type set to: " sort_type
sleep 600
reload
return


compile_all_scripts:
msgBox, 4, , % regExReplace(strReplace(a_thisLabel, "_icon"), "[\W_]", a_space) . "?"
ifMsgBox, yes
    {
    if (script_paths = "")
        script_paths := running_scripts()
    loop, parse, script_paths, `n
        {
        if (a_loopField)
            compile_this(a_loopField)
        }
    msg_tool("compile all complete")
    }
return


reload_all:
exit_all:
msgBox, 4, , % regExReplace(a_thisLabel, "[\W_]", a_space) . " Scripts?"
ifMsgBox, yes
    {
    if (script_paths = "")
        script_paths := running_scripts()
    if (a_thisLabel = "reload_all") and (sort_type = "recent")
        {
        loop, parse, script_paths, `n
            temp_list :=  a_loopField "`n" temp_list  ; reverse the order before reload
        script_paths := temp_list
        }

        ;# reload or close scripts
    loop, parse, script_paths, `n
        {
        if (a_loopField = "") or (a_loopField = a_lineFile)  ; skip this script
            continue
        if (a_thisLabel = "reload_all")
            {
            if (inStr(a_loopField, "\\.\pipe\AHK_"))   ; skip piped
                continue
            run, % a_loopField " /restart"
            }
        else winClose, % a_loopField " ahk_class AutoHotkey"
        msg_tool(filename(a_loopField) " . . . .")
        sleep 90
        }

        ;# reload or close this script
    msg_tool("`n" strReplace(a_thisLabel, "_all") . " Complete")
    sleep 300
    if (a_thisLabel = "reload_all")
         reload
    else exitApp
    }
return


compile_this(script_path) {
    splitPath, script_path, filename, file_dir, file_ext, name_no_ext
    if (file_ext = "ahk")
        {
        splitPath, a_ahkPath, , ahk_dir
        ahk2exe := ahk_dir . "\Compiler\Ahk2Exe.exe"
            ; script icon
        if isFunc("script_icon")
            exe_icon := icon_search(script_path)
            ; compile
        if (exe_icon)
             run, "%ahk2exe%" /in "%script_path%" /icon "%exe_icon%", , hide
        else run, "%ahk2exe%" /in "%script_path%", , hide
            ; wait until .exe is compiled
        if inStr(a_thisLabel, "_All")
            {
            loop,
                sleep 500
            until (fileExist(file_dir "\" name_no_ext ".exe"))
               or (a_index = 6)    ; 3 seconds
               or (winExist("Ahk2Exe Error ahk_exe Ahk2Exe.exe"))
            }
        msg_tool(filename "compiling . . . . ")
        }
}
