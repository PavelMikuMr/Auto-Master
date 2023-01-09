/*
[icon folders]
folder_1 = 
folder_2 = 
*/

script_icon(ahk_filepath="") {
    if (ahk_filepath = "")
        {
        icon_name := subStr(a_scriptName, 1, strLen(a_scriptName) - 4)
        icon_dir  := a_scriptDir
        }
    else splitPath, ahk_filepath, , icon_dir, , icon_name

        ;# check in the script directory
    if fileExist(a_scriptDir "\" icon_name ".ico")
         icon_path := a_scriptDir "\" icon_name ".ico"
        ;# a_scriptDir\icons
    else if fileExist(a_scriptDir "\icons\" icon_name ".ico")
         icon_path := a_scriptDir "\icons\" icon_name ".ico"
        ;# a_scriptDir\icon
    else if fileExist(a_scriptDir "\icon\"  icon_name ".ico")
         icon_path := a_scriptDir "\icon\"  icon_name ".ico"

        ;# search through icon folders 
    if (icon_path = "")
        {           ; also look for an icon that matches the first letter
        stringLeft, first_character, % regExReplace(icon_name, "[\W]"), 1
        loop,
            {
            iniRead, icon_folder, % a_lineFile, icon folders, folder_%a_index%
            if (icon_folder = "")
                continue ; to next folder

            loop, files, % rTrim(icon_folder, "\") . "\*.ico", R
                {
                splitPath, a_loopFileFullPath, , , , this_icon
                if (this_icon = icon_name)
                    {
                    icon_match := a_loopFileFullPath
                    break 2
                    }
                if (this_icon = first_character) and (letter_match = "")
                    letter_match := a_loopFileFullPath    ; save the first match
                }
            }
        until (icon_folder = "ERROR")

        if (icon_match = "")
             icon_path := letter_match  ; the icon that matched the first letter
        else icon_path := icon_match
        }

        ;# if nothing has been found then use the default H icon
    if (icon_path = "")
        icon_path := a_ahkPath

    return icon_path
}


/*
[script info]
version     = 1.1
description = automagically find an icon
author      = davebrny
source      = https://gist.github.com/davebrny/2d2bc026efd177c41de1e5482b137fa2
*/