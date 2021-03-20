Suspend
Gui, Add, Hotkey, x72 y19 w80 h20 vZeus, 
Gui, Add, Text, x22 y19 w40 h20 , Zeus:
Gui, Add, Hotkey, x72 y49 w80 h20 voffon, 
Gui, Add, Text, x22 y49 w40 h20 , Off/On
Gui, Add, Button, x162 y19 w90 h50 gStart, Start
Gui, Show, w271 h88, FlashSwitch
return


start:
Hotkey, %Zeus%, Off, UseErrorLevel
Hotkey, %offon%, Off, UseErrorLevel
Gui, Submit, NoHide,
Hotkey, %Zeus%, Zeus, On, UseErrorLevel
Hotkey, %offon%, offon, On, UseErrorLevel
return

offon: 
Suspend
return

LButton::
send, {LButton}
Send, {%Zeus%}
Sleep, 100
Send, {l}
return

GuiClose:
ExitApp