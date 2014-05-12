;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;
; http://www.howtogeek.com/howto/keyboard-ninja/keyboard-ninja-toggle-hidden-files-with-a-shortcut-key-in-windows/


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; WINDOWS KEY + H TOGGLES HIDDEN FILES
#IfWinActive, ahk_class CabinetWClass
#h::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
If HiddenFiles_Status = 2
{
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, ShowSuperHidden, 1
TrayTip, Hidden Files, Show, , 1
SetTimer, RemoveTrayTip, 3000
}
Else
{
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, ShowSuperHidden, 0
TrayTip, Hidden Files, Hide, , 1
SetTimer, RemoveTrayTip, 3000
}
WinGetClass, eh_Class,A
If (eh_Class = “#32770? OR A_OSVersion = “WIN_VISTA”)
send, {F5}
Else PostMessage, 0×111, 28931,,, A
return
#IfWinActive

RemoveTrayTip:
SetTimer, RemoveTrayTip, Off
TrayTip
return