Threshold = 20
;https://www.youtube.com/channel/UCsqedDo2CxV9NuTyYIsmk1w?view_as=subscriber
*~$t::
MouseGetPos, MouseX, MouseY
PixelGetColor, Color1, (MouseX+2), (MouseY+2)
StringSplit, Colorz, Color1
Color1B = 0x%Colorz3%%Colorz4%
Color1G = 0x%Colorz5%%Colorz6%
Color1R = 0x%Colorz7%%Colorz8%
Color1B += 0
Color1G += 0
Color1R += 0

while (GetKeyState("t", "P"))
    {
        BlockInput, MouseMove
        sleep 1
        MouseGetPos, MouseX, MouseY
        PixelGetColor, Color2, (MouseX+2), (MouseY+2)
        StringSplit, Colorz, Color2
        Color2B = 0x%Colorz3%%Colorz4%
        Color2G = 0x%Colorz5%%Colorz6%
        Color2R = 0x%Colorz7%%Colorz8%
        Color2B += 0
        Color2G += 0
        Color2R += 0
        if (Color1R > (Color2R + Threshold)) or (Color1R < (Color2R - Threshold)) or (Color1G > (Color2G + Threshold)) or (Color1G < (Color2G - Threshold)) or (Color1B > (Color2B + Threshold)) or (Color1B < (Color2B - Threshold))
            {
                send {LButton}
            }
    }
BlockInput, MouseMoveOff
Return