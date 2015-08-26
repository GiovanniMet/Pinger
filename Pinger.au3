#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.1
 Author:         Giovanni Metitieri

 Script Function:
	Check ping to server for infinite time. To exit press ESC key.
	Write output in script folder in file ping-x-y.txt (x and y is day and month).

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

; configure script

Global Const $timeout = 4 ; pause to wait server in second
Global Const $pause = 5 ; pause to wait another cicle in second

;don't edit if you don't know what do!

HotKeySet("{ESC}", "Terminate")

Main()

Func Main()

   While True
	  Local $ping = Ping("google.it", $timeout * 1000)
	  Local $line = "Time(h-m-s): " & @HOUR & "-" & @MIN & "-" & @SEC & " : Ping = " & $ping & " ms."
	  FileWriteLine("ping-"& @MDAY & "-" & @MON &".txt", $line)
	  Sleep ($pause * 1000)
   WEnd

EndFunc

Func Terminate()
    Exit
EndFunc   ;==>Terminate