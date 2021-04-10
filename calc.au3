Run("calc.exe")
WinWaitActive("Calculator")
AutoItSetOption("SendKeyDelay", 50)

Global $numberOfFailedTest = 0
Global $numverOfPassedTest = 0

TestAllNumberButtons()
TestOperations()
TestFunctionality()
TestMemoryButtons()

MsgBox(0, "Results of testing", "Test is finished." & @CRLF & "Passed test: " & @LF &  String($numverOfPassedTest) & @CRLF & "Failed test: " & @LF & String($numberOfFailedTest))

Exit

Func TestAllNumberButtons()
   TestNumbersButton()
   TestPointButton()
   TestSignOfNumber()
   TestLongNumbers()
EndFunc

Func TestOperations()
   TestInt()
   TestFloat()
   TestInversion()
   TestSqrt()
EndFunc

Func TestFunctionality()
   TestPercentages()
   TestDeleting()
   TestClearing()
EndFunc

Func TestInt()
   TestIntAddition()
   TestIntSubstraction()
   TestIntDivision()
   TestIntMultiplication()
EndFunc

Func TestFloat()
   TestFloatAddition()
   TestFloatSubstraction()
   TestFloatDivision()
   TestFloatMultiplication()
EndFunc

Func TestPercentages()
   TestPercentagesAddition()
   TestPercentagesMultiplication()
EndFunc

Func TestNumbersButton()
   Send("{ESC}{ESC}")
   Send("12345670000089")
   AssertEq(GetResult(), 12345670000089, "TestNumbersButton")
EndFunc

Func TestPointButton()
   Send("{ESC}{ESC}")
   Send("0")
   Send("{.}")
   Send("1234")
   AssertEq(GetResult(), 0.1234, "TestPointButton")
EndFunc

Func TestSignOfNumber()
   Send("{ESC}{ESC}")
   Send("666")
   Send("{F9}")
   AssertEq(GetResult(), -666, "TestPointButton")

   Send("{ESC}{ESC}")
   Send("666.666")
   Send("{F9}")
   AssertEq(GetResult(), -666.666, "TestPointButton")
EndFunc

Func TestLongNumbers()
   Send("{ESC}{ESC}")
   Send("12345678912345678912345678912345")
   AssertEq(GetResult(), 12345678912345678912345678912345, "TestLongNumbers")


   Send("{ESC}{ESC}")
   Send("123456789123456789123456789123.5")
   AssertEq(GetResult(), 123456789123456789123456789123.5, "TestLongNumbers")
EndFunc

Func TestMemoryButtons()
   Send("100")
   Send("^M")
   AssertEq(GetResult(), 100, "TestMemoryButtons")

   Send("10")
   Send("{+}")
   Send("^R")
   Send("{ENTER}")
   AssertEq(GetResult(), 110, "TestMemoryButtons")

   Send("900")
   Send("^P")
   Send("^R")
   AssertEq(GetResult(), 1000, "TestMemoryButtons")

   Send("^L")
   Send("10")
   Send("{+}")
   Send("^R")
   Send("{ENTER}")
   AssertEq(GetResult(), 10, "TestMemoryButtons")

EndFunc


Func TestIntAddition()
  Send("{ESC}{ESC}")
  Send("1234567890")
  Send("{+}")
  Send("9876543210")
  Send("{ENTER}")
  AssertEq(GetResult(), 11111111100, "TestIntAddition")
EndFunc

Func TestIntSubstraction()
  Send("{ESC}{ESC}")
  Send("1234")
  Send("{-}")
  Send("64740939")
  Send("{ENTER}")
  AssertEq(GetResult(), -64739705, "TestIntSubstraction")
EndFunc

Func TestIntDivision()
  Send("{ESC}{ESC}")
  Send("21")
  Send("{/}")
  Send("3")
  Send("{ENTER}")
  AssertEq(GetResult(), 7, "TestIntDivision")

  Send("{ESC}{ESC}")
  Send("10")
  Send("{/}")
  Send("4")
  Send("{ENTER}")
  AssertEq(GetResult(), 2.5, "TestIntDivision")
EndFunc

Func TestIntMultiplication()
  Send("{ESC}{ESC}")
  Send("90")
  Send("{*}")
  Send("10")
  Send("{ENTER}")
  AssertEq(GetResult(), 900, "TestIntMultiplication")
EndFunc


Func TestFloatAddition()
  Send("{ESC}{ESC}")
  Send("91234.56789")
  Send("{+}")
  Send("908765.4321")
  Send("{ENTER}")
  AssertEq(GetResult(), 999999.99999, "TestFloatAddition")
EndFunc

Func TestFloatSubstraction()
  Send("{ESC}{ESC}")
  Send("1022496.25 ")
  Send("{-}")
  Send("64.74939")
  Send("{ENTER}")
  AssertEq(GetResult(), 1022431.50061, "TestFloatSubstraction")
EndFunc

Func TestFloatDivision()
  Send("{ESC}{ESC}")
  Send("110.25")
  Send("{/}")
  Send("1.25")
  Send("{ENTER}")
  AssertEq(GetResult(), 88.2, "TestFloatDivision")
EndFunc

Func TestFloatMultiplication()
   Send("{ESC}{ESC}")
   Send("56.33")
   Send("{*}")
   Send("6.7")
   Send("{ENTER}")
   AssertEq(GetResult(), 377.411, "TestFloatMultiplication")
EndFunc


Func TestPercentagesAddition()
  Send("{ESC}{ESC}")
  Send("10")
  Send("{+}")
  Send("87%")
  Send("{ENTER}")
  AssertEq(GetResult(), 18.7, "TestPercentagesAddition")
EndFunc

Func TestPercentagesMultiplication()
  Send("{ESC}{ESC}")
  Send("100")
  Send("{*}")
  Send("49%")
  Send("{ENTER}")
  AssertEq(GetResult(), 4900, "TestPercentagesMultiplication")
EndFunc

Func TestSqrt()
  Send("{ESC}{ESC}")
  Send("121")
  Send("{@}")
  AssertEq(GetResult(), 11, "TestSqrt")

  Send("{ESC}{ESC}")
  Send("1898.083489")
  Send("{@}")
  AssertEq(GetResult(), 43.567, "TestSqrt")
EndFunc

Func TestInversion()
   Send("{ESC}{ESC}")
   Send("8")
   Send("{r}")
   AssertEq(GetResult(), 0.125, "TestInversion")

   Send("{ESC}{ESC}")
   Send("0.4")
   Send("{r}")
   AssertEq(GetResult(), 2.5, "TestInversion")
EndFunc

Func TestDeleting()
   Send("{ESC}{ESC}")
   Send("44987656")
   Send("{BACKSPACE}")
   Send("{BACKSPACE}")
   Send("{BACKSPACE}")
   Send("{BACKSPACE}")
   Send("{BACKSPACE}")
   Send("{BACKSPACE}")
   AssertEq(GetResult(), 44, "TestDeleting")
EndFunc

Func TestClearing()
   Send("{ESC}{ESC}")
   Send("9876543210.123456789")
   Send("{ESC}")
   AssertEq(GetResult(), 0, "TestClearing")
EndFunc


Func GetResult()
	Send("^c")
	$str = StringReplace(ClipGet(), ",", ".")
	return Number($str)
 EndFunc

Func AssertEq($Result, $Expect, $Message)
   If Not ($Result = $Expect) Then
	  MsgBox(0, "Test is failed!", $Message & @LF & $Result & " is expected to be equal " & $Expect)
	  $numberOfFailedTest += 1
   Else
	  $numverOfPassedTest += 1
   EndIf
EndFunc
