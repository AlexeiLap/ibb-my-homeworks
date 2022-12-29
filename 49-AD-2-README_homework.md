# Домашнее задание к занятию «Active Directory. Часть 2»

В качестве результата пришлите ответы на вопросы в личном кабинете студента на сайте [netology.ru](https://netology.ru/).

## 

### Задание 1

Проведите самостоятельный аудит установленного на прошлом занятии DC, опираясь на лекцию.

*Дайте ответ в свободной форме.*

------

ОТВЕТ:

Аудит настраивается через групповые политики

![](img/49/1-групповые%20политики.png)

Для каждой политики есть описание

![](img/49/2-описание%20групповой%20политики.png)

Настраивается отдельно аудит успеха и аудит отказа

![](img/49/3-настраиваются%20параметры%20успеха%20и%20отказа.png)

Также аудит настраивается через расширенные политики:

![](img/49/4-расширенная%20политика%20аудита%20с%20дополнительными%20параметрами.png)

После настройки политики возможен просмотр событий аудита в журнале событий:

![](img/49/5-просмотр%20настроенных%20событий%20журнала%20безопасности.png)

Также настройку аудита можно выполнять через утилиту командной строки:

```text
утилита Auditpol.exe

Синтаксис:

получить полный список GAP с установленными параметрами.
auditpol /list /subcategory:*

Активируем политику “directory service access”:
auditpol /set /subcategory:"directory service changes" /success:enable

общий вариант использования
auditpol /set /<Category|Subcategory>:<audit category> /<success|failure:> /<enable|disable>

примеры синтаксиса:
auditpol /set /subcategory:"user account management" /success:enable /failure:enable
auditpol /set /subcategory:"logon" /success:enable /failure:enable
auditpol /set /subcategory:"IPSEC Main Mode" /failure:enable

```





