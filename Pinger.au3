#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.1
 Author:         Giovanni Metitieri

 Script Function:
	Check ping to server for infinite time. To exit press ESC key.
	Write output in script folder in file ping-x-y.txt (x and y is day and month).

#ce ----------------------------------------------------------------------------

; Script Start - Don't edit if you don't know what are you doing :D

Global Const $timeout = IniRead("settings.ini","Settings","Timeout",4)
Global Const $pause = IniRead("settings.ini","Settings","Pause",5)
Global Const $server = IniRead("settings.ini","Settings","Server","google.com")
Global Const $mping = IniRead("settings.ini","Settings","Ping","0")


HotKeySet("{ESC}", "Terminate")

Main()

Func Main()

   While True
	  Local $ping = Ping($server, $timeout * 1000)
	  Local $line = "Time(h-m-s): " & @HOUR & "-" & @MIN & "-" & @SEC & " : Ping = " & $ping & " ms."
	  if($ping>$mping)Then
		 FileWriteLine("ping-"& @MDAY & "-" & @MON &".txt", $line)
	  EndIf
	  Sleep ($pause * 1000)
   WEnd

EndFunc

Func Terminate()
    Exit
EndFunc   ;==>Terminate