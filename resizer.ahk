#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance , force




loop , *.jpg
{
	resize(a_loopfilename)
}
msgbox ,,, finished resizing , 2
return

resize(fname)
{
	;msgbox ,,, file is %fname%
	run , mspaint.exe %fname%
	sleep , 2000
	send , ^w
	sleep , 600
	send , %a_tab%
	send, 40
	send , {enter}
	msgbox ,,, next?	
}
return 