#MaxHotkeysPerInterval 900000000000000000000000000000
mouseXY(x, y)
{
DllCall("mouse_event",uint,1,int,x,int,y,uint,0,int,0)
}

strafe(left)
{
moveCount := 1
sleepInterval = 4
relativeMove := 600

if (left)
{
key := ""
move := relativeMove
} else
{
key := ""
move := -relativeMove
}
send {%key% down}
DllCall("Sleep", "UInt", 5)
Loop, %moveCount%
{
mouseXY(move, -(move/4))
DllCall("Sleep", "UInt", sleepInterval)
}
send {%key% up}
}

$Z::
while getkeystate("Z","P")
{
strafe(true)
strafe(false)
}
return