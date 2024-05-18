; Script Information ===================================================================================================================
; Name .........: ToggleAlwaysOnTop
; Description ..: Toogle always on top for current window with Ctrl + Space
; OS Version ...: Tested on Windows 11
; Author .......: Mehdi Abdelkhalek
; ======================================================================================================================================

#Requires AutoHotkey v2.0

#SingleInstance Force
#NoTrayIcon

^SPACE::WinSetAlwaysOnTop -1, "A"