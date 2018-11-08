#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance , force


originals_folder = %A_ScriptDir%\originals
foldercheck(originals_folder)
backuporiginals(originals_folder)


loop , *.jpg
{
	resize(a_loopfilename, originals_folder)
}
msgbox ,,, finished resizing , 2
return

resize(fname, ofolder)
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

foldercheck(folder)
{
	ifnotexist , folder
	{
		filecreatedir , %folder%
		if errorlevel
		{
			msgbox ,,, could not create folder - %folder% - script ending here
			exit
		}
	}
}
return 

backuporiginals(folder)
{
	filecopy , *.jpg , %folder%\
	if errorlevel
	{
		msgbox ,,, could not copy %a_loopfilename% to %ofolder% - script ending here
		exit
	}
}
return 