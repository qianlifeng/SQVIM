;total commander
#Q::
DetectHiddenWindows, on
IfWinActive, ahk_class TTAFrameClass
{
    Send,{Control down}{Alt down}q{Control up}{Alt up}
}
Else
{
    IfWinNotExist,ahk_class TTOTAL_CMD
    {
        Run, C:\totalcmd\TOTALCMD64.exe
    }
    Else
    {
        IfWinNotActive,ahk_class TTOTAL_CMD
        {
            WinActivate
        }
        Else
        {
            WinMinimize
        }
    }
}
Return

;Everything
#F::
DetectHiddenWindows, on

IfWinNotExist,ahk_class EVERYTHING
{
    Run,C:\Program Files (x86)\Everything\Everything.exe
}
Else
{
	IfWinNotActive,ahk_class EVERYTHING 
	{
		WinActivate
	}
	Else
	{
	    WinClose	
	}
}
Return

;Vim
#V::
    Run,v.lnk
Return

;----------------------------------------WM-------------------------------------------
#R::
    IfWinActive, ahk_class TTAFrameClass
    {
        Send,{Control down}{Alt down}r{Control up}{Alt up}
    }
    Else
    {
        Send,{LWin down}r{LWin up}
    }
Return

#W::
    IfWinExist, ahk_class TTAFrameClass
    {
        IfWinNotActive,ahk_class TTAFrameClass
        {
            WinActivate
        }
        Else
        {
            WinMinimize 
        }
    }
Return
