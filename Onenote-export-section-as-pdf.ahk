; This script was created using Pulover's Macro Creator
;
; Onenote: Export the current section as PDF (.pdf)

#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Window
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
DetectHiddenWindows On
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1

#IfWinActive, ahk_exe ONENOTE.EXE

^!X::
Onenote_Export_Section_to_pdf:
WinActivate, ONENOTE.EXE
Sleep, 333
Send, {LAlt Down}
Send, {f}
Send, {LAlt Up}
Send, {s}
Send, {s}
Send, {f}
Send, {e}
Click, 216, 411, 0
WinActivate, Save As ahk_class #32770
Send, {LAlt Down}
Send, {e}
Send, {LAlt Up}
Return

#IfWinActive
