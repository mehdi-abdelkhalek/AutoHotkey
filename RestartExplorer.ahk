; Script Information ===================================================================================================================
; Name .........: RestartExplorer
; Description ..: Restart windows explorer and restore open windows using Ctrl + Alt + Backspace
; OS Version ...: Tested on Windows 11
; Author .......: Mehdi Abdelkhalek
; ======================================================================================================================================

#Requires AutoHotkey v2.0

#SingleInstance
#NoTrayIcon

; If the script doesn't restore some or all windows, try to increase the delay:
Delay := 1000

WinTitle := "ahk_class CabinetWClass"

^!Backspace::
{
    ExplorerHwnds := WinGetList(WinTitle)
    ExplorerPaths := []
    Loop ExplorerHwnds.Length
    {
        ExplorerPaths.push(ExplorerGetPath(ExplorerHwnds[A_Index]))
    }
    RunWait "taskkill /f /im explorer.exe"
    Run "explorer.exe"
    Sleep Delay
    Loop ExplorerPaths.Length
    {
        Command := "explorer.exe " ExplorerPaths[A_Index]
        Run Command
    }
}


ExplorerGetPath(HWND := 0) {
    if HWND
        ExplorerHwnd := WinExist(WinTitle " ahk_id " HWND)
    else
        ((!ExplorerHwnd := WinActive(WinTitle)) && ExplorerHwnd := WinExist(WinTitle))
    if ExplorerHwnd
        for window in ComObject("Shell.Application").Windows
            try if window && window.HWND && window.HWND = ExplorerHwnd
                return window.Document.Folder.Self.Path
    return false
}