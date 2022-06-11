# Домашнее задание к занятию «Использование командных оболочек 2. PowerShell»

В качестве результата пришлите ответы на вопросы в личном кабинете студента на сайте [netology.ru](https://netology.ru/).

**Важно**: перед отправкой переименуйте ваш скрипт в `script.txt` (система отправки файлов Netology блокирует файлы с расширением `.ps1`).



## Задание 1

Напишите два скрипта, каждый из которых принимает один параметр и:

- первый - прибавляет к параметру единицу как строку.

  **Например:**

  **./test_1.ps1 5**

  **51**

- второй - прибавляет к параметру единицу как число.

  **Например:**

  **./test_2.ps1 5**

  **6**

СКРИПТ:
```
echo ('Added 1 as string: ' + [string]$args[0] + '1')
echo ('Added 1 as number: ' + ($args[0] + 1))
```

## Задание 2

Напишите скрипт, который выводит содержимое каталога и подсчитывает в нём количество файлов.

**Например:**

**./test_dir.ps1**  
**admin_scripts**  
**...**  
**Videos**  
**Total: 22**  

СКРИПТ:
```
$files=0
Get-ChildItem -Path $args[0] |
ForEach-Object{
    $_.Name;
	if (Test-Path -Path ($args[0] + $_.Name) -PathType leaf ){
		$files++
	}
}
echo ('Files count: ' + $files)
```

## Задание 3

Напишите скрипт, который принимает один параметр и определяет, какой объект передан этим параметром (файл, каталог или не существующий). 

**Например:**

**./test.ps1 c:\windows**  
**c:\windows - dir**  
**./test.ps1 c:\pagefile.sys**  
**c:\pagefile.sys - file**  
**user@user:~$./test.ps1 c:\windows1**  
**c:\windows1 - not exist**  

СКРИПТ:
```
if (Test-Path -Path $args[0] -PathType leaf )
{
	echo ($args[0] + '- file')	
}
elseif(Test-Path -Path $args[0])
{
	echo ($args[0] + '- dir')	
}
else 
{
	echo ($args[0] + '- not exist')	
}
```

![](img/25/Результаты%20скриптов.png)
