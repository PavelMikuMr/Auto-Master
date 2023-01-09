;----------------------------------Glabal Perfomance--------------------------------
#NoEnv 
#MaxHotkeysPerInterval 99000000 
#HotkeyInterval 99000000 
#KeyHistory 0 
#SingleInstance
ListLines Off 
Process, Priority, , H 
SetWinDelay, 0 
SetMouseDelay, -1 
SetBatchLines, -1 
SetDefaultMouseSpeed, 0 
SetControlDelay, 0
SetKeyDelay, -1, -1, -1 
SendMode Input 
SetTitleMatchMode 2
SetTitleMatchMode Fast





+!i::
list := ["time","year","people","way","day","man","woman","life","child","girl","school","state","family","student","man","country","problem","hand","part","world","place","case","week","company","system","program","program","work","government","number","night","point","home","change","water","room","area","mother","story","fact","person","party","month","lot","right","study","book","eye","job","word","business","issue","side","kind","head","house","service","friend","father","power","hour","game","line","end","member","law","car","name","team","minute","idea","kid","body","information","back","parent","face","office","level","door","person","teacher","education"]
Random, Ran, 1, % List.MaxIndex()
send % List[Ran]
return

f1::
color := ["black","silver","white","maroon","red","man","purple","fuchsia","olive","","yellow","blue","aqua","teal","aliceblue","aqua","azure","beige","blue","brown","coral","cornsilk","cyan","darkkhaki","darkolivegreen","darkred","darkslategray","deeppink","dimgray","forestgreen","gold","lime","green","grey","indigo","lawngreen","lightcyan","lightgray","lightsalmon","linen","mediumorchid","mistyrose","olivedrab","palevioletred","pink","royalblue","seashell","snow","thistle","whitesmoke","yellow","skyblue"]
Random, Ran, 1, % color.MaxIndex()
send % color[Ran]
return


