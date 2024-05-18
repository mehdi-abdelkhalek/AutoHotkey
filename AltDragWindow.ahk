; Script Information ===================================================================================================================
; Name .........: AltDragWindow
; Description ..: Drag window using Alt + mouse button
; OS Version ...: Tested on Windows 11
; Author .......: gaulinmp https://github.com/gaulinmp/AutoHotKey
; ======================================================================================================================================

#Requires AutoHotkey v2.0

#SingleInstance
#NoTrayIcon

SetWinDelay 0

CoordMode "Mouse", "Screen"

WINROTATE := 0

!LButton::
{
  ; Get the initial mouse position and window id
  MouseGetPos &mouse_x1,&mouse_y1,&win_id

  ; Abort if maximized
  is_maxed := WinGetMinMax("ahk_id " win_id)
  If is_maxed
    return

  ; Get the initial window position.
  WinGetPos &win_x1,&win_y1,,,"ahk_id " win_id

    ; While mouse is pressed down
  While GetKeyState("LButton", "P")
  {
    ; Get current mouse position.
    MouseGetPos &mouse_x2, &mouse_y2 ; Current mouse position.

    ; Move X and Y coordinate by difference between new and old mouse position
    WinMove( win_x1 + (mouse_x2 - mouse_x1)   ; X + offset
            ,win_y1 + (mouse_y2 - mouse_y1)   ; Y + offset
            ,,                                ; No width or height change
            ,"ahk_id " win_id)                ; Window ID
  }
}