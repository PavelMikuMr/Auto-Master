^#n::
Menu MyMenu, Add, Folder, item1handler
Menu MyMenu, Add, GOOGLE, item2handler
Menu MyMenu, Add, Screen, item3handler
Menu MyMenu, Add, Startup, item4handler
Menu MyMenu, Add, Trey, item5handler
Menu MyMenu, Add, Picture, item6handler
Menu MyMenu, Add, Drive, item7handler
Menu MyMenu, Add, Book, item8handler
Menu MyMenu, Add, Photoshop, item9handler
Menu MyMenu, Add, Pins, item10handler
Menu MyMenu, Add, Buffer, item11handler
Menu MyMenu, Add, Translate, item12handler
Menu MyMenu, Add, FilePath, item13handler
Menu MyMenu, Show
Return
1774 1021
item1handler:
Send,#e
Return

item2handler:
Send,#1
Return

item3handler:
Send,+^p
Return

item4handler:
Run C:\Users\PavelTrud\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\
Return

item5handler:
Send,#b
Send,{enter}
Return

item6handler:
Run I:\PICTURES\ShareX\Screenshots
Return

item7handler:
Run, https://onedrive.live.com/?id=root&cid=99F902DE73EFB95A
return

item8handler:
Run notepad.exe
Return

item9handler:
Send,#4
Return

item10handler:
Send,^!+{f8}
Return

item11handler:
Send,^!+i
Return

item12handler:
Run C:\Users\PavelTrud\AppData\Local\Reverso\Reverso\Reverso.exe
Return


item13handler:
; Get the Path to the Selected File in Explorer. 
      hwnd := WinExist("A")
      for Window in ComObjCreate("Shell.Application").Windows  
          if (window.hwnd==hwnd) {
              Selection := Window.Document.SelectedItems
              for Items in Selection
                  Path_to_Selection := Items.path
          }

     Clipboard:= Path_to_Selection

return
