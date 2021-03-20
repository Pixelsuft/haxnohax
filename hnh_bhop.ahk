#SingleInstance force
#InstallKeybdHook
#InstallMouseHook
#NoEnv
*~$Space::
Loop
{
GetKeyState, SpaceState, Space, P
If SpaceState = U
	break
Send, {Blind}{Space}
Sleep 1
}