# Тестирование декстоп приложения калькулятор с помощью AutoIt

### AutoIt можно скачать [отсюда](https://drive.google.com/file/d/1xPrK0DXxbjGzJExIVPjkVKZIk7XzZTjw/view?usp=sharing)
### Приложение калькулятор можно скачать [отсюда](https://drive.google.com/file/d/1HCoCCEcAHlimSq70mkX9vpeMmlUW37EA/view?usp=sharing)

### Компиляция файла ```calc.au``` и добавление в Java
После компиляция файла ```calc.au``` AutoIt, можно получить  ```calc.exe``` и запустить его в Java. 
 ```Runtime.getRuntime().exec("..path_to_compiled_file\calc.exe")```
 
### Требования 
Требования к приложению «Калькулятор» (стандартный калькулятор Windows).
Требования сформулированы в рамках стандартного режима работы (View/Standard).
1.	Калькулятор позволяет работать с числами в десятичной системе счисления, возможно использование чисел, имеющих до 33-х символов в записи (включая целую, дробную части, знак и запятую).
2.	Калькулятор поддерживает выполнение сложения, вычитания, умножения, деления, вычисление обратного числа (1/x) и квадратного корня.
3.	Калькулятор поддерживает вычисление процентов в виде 
<число> * <число процентов> %, а также <число> +|- <число процентов> % =
в первом случае результатом является <число> * <число процентов>/100, 
во втором случае <число> +|- (<число> *<число процентов>/100)
4.	Калькулятор имеет одну ячейку памяти, с которой можно выполнять следующие операции:
MS — запоминть текущее число в памяти.
MR — скопировать число из памяти в поле ввода калькулятора.
MC — стереть запомненное в памяти.
M+ — прибавить текущее число к запомненному и запомнить результат.
5.	При наборе чисел и операций калькулятор поддерживает следующие действия:
Backspace — стереть последнюю набранную цифру,
С — полностью стереть содержимое поле ввода калькулятора, в поле остается 0.

### Задание
Разработать набор тестов для калькулятора, проверяющих перечисленные выше требования и обеспечивающий
*	полное покрытие используемых цифр
*	полное покрытие арифметических действий и операций 1/x, sqrt
*	полное покрытие действий с ячейкой памяти

Тесты оформить в виде скрипта AutoIt.

