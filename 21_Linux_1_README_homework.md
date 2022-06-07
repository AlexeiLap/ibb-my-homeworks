# Домашнее задание к занятию «ОС Linux (часть 1)»

В качестве результата пришлите ответы на вопросы в личном кабинете студента на сайте [netology.ru](https://netology.ru).

## Задача /etc/shadow

### Легенда

На лекции мы рассмотрели работу файл /etc/shadow. Подберите с помощью Hashcat пароль пользователя по хэшу из `/etc/shadow`

### Задача

У вас есть фрагмент записи из файла `/etc/shadow`: `hackme:$6$iMDxXB6C.bGVPgP/$dzNU7.0TSuoY8LUBKInul8kkDbjNsTEJWC6ake4pBi9Mf8icvzTm7aydpgs7ciJsRurui/SVBHsKWP0Ji4f7U1:...`.

Подберите пароль к данной учётной записи:

`ответ: найденный пароль fear`

![](img/21/найденный%20пароль.png)

`обратная проверка: openssl passwd -6 -salt iMDxXB6C.bGVPgP/ fear`

![](img/21/проверка%20обратная.png)



