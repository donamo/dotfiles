; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

#z::Run www.autohotkey.com

^!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run Notepad
return

;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         ikskoks <ikskoks@gmail.com>

;http://webdesign.about.com/library/bl_htmlcodes.htm
#NoEnv  
SendMode Input
SetWorkingDir %A_ScriptDir%  

; Hungarian accented character with Right Alt + 

!0::sendinput % chr(246)
+!0::sendinput % chr(214)
!-::sendinput % chr(252)
+!-::sendinput % chr(220)
!=::sendinput % chr(243)
+!=::sendinput % chr(211)
![::sendinput % chr(337)
+![::sendinput % chr(336)
!]::sendinput % chr(250)
+!]::sendinput % chr(218)   
!;::sendinput % chr(233)
+!;::sendinput % chr(201) 
!'::sendinput % chr(225)
+!'::sendinput % chr(193) 
!\::sendinput % chr(369)
+!\::sendinput % chr(368) 
!z::sendinput % chr(237)
+!z::sendinput % chr(205) 




return
