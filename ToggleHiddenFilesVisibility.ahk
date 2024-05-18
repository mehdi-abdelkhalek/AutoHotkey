; Script Information ===================================================================================================================
; Name .........: ToggleHiddenFilesVisibility
; Description ..: Toggle hidden files visibility in File Explorer using Ctrl + H
; OS Version ...: Tested on Windows 11
; Author .......: Mehdi Abdelkhalek
; ======================================================================================================================================

#Requires AutoHotkey v2.0

#SingleInstance
#NoTrayIcon

#HotIf WinActive("ahk_class CabinetWClass")

^h::
{
    if (RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden") = 1)
        RegWrite "2", "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden"
    else
        RegWrite "1", "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden"
    Send "{F5}"
}