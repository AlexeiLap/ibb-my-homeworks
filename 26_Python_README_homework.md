
# Домашнее задание к занятию «Язык Python. Основы.»

В качестве результата пришлите ответы на вопросы в личном кабинете студента на сайте [netology.ru](https://netology.ru/).

**Важно**: перед отправкой переименуйте ваш скрипт в `script.txt` (система отправки файлов Netology блокирует файлы с расширением `.py`).


## Задание 1

Напишите два скрипта, каждый из которых принимает один параметр и:

- первый - прибавляет к параметру единицу как строку.

  **Например:**

  **./python3 test_1.py 5**

  **51**

- второй - прибавляет к параметру единицу как число.

  **Например:**

  **./python3 test_2.py 5**

  **6**

СКРИПТ:
```python
#!/usr/bin/env python3
import sys
arg=sys.argv[1]
s = str(arg) + '1'
i = int(arg) + 1
print('Добавили единицу как строку: ' + str(s))
print('Добавили единицу как число: ' + str(i))   
```


## Задание 2

Напишите скрипт, который выводит содержимое каталога и подсчитывает в нём количество файлов.

**Например:**

**./test_dir.py**  
**admin_scripts**  
**...**  
**Videos**  
**Total: 22**  

СКРИПТ:
```python
#!/usr/bin/env python3

import os
import sys
path=sys.argv[1]
cmd = "ls " + path
output = os.popen(cmd).read()
files=0
for line in output.split('\n'):
 print(line)
 filename=path + line
 if (os.path.isfile(filename)):
  files = files + 1
print("Files count :" + str(files))

```


## Задание 3

Напишите скрипт, который принимает один параметр и определяет, какой объект передан этим параметром (файл, каталог или не существующий). 

**Например:**

**./test.py \windows**  
**c:\windows - dir**  
**./test.py c:\pagefile.sys**  
**c:\pagefile.sys - file**  
**user@user:~$ c:\windows1**  
**c:\windows1 - not exist**  

СКРИПТ:
```python
#!/usr/bin/env python3

import os
import sys
filename=sys.argv[1]
if (os.path.isfile(filename)):
 print(filename + " - file")
elif (os.path.exists(filename)):
 print(filename + " - dir")
else:
 print(filename + " - not exist")  
```
## Результаты скриптов

![](img/26/скрипты1-2%20результаты.png)

![](img/26/скрипт%203%20результаты.png)
