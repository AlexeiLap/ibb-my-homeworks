# Домашнее задание к занятию «2.1 Системы хранения данных (СУБД)»

## Предисловие

Данные ДЗ будут представлять собой лабораторные работы, в рамках которых вы по инструкциям выполните определённые шаги.

#### Часть 1. Настройки по умолчанию

### Результаты выполнения

Пришлите в личном кабинете студента ответы на указанные в разделе **Выполнение** вопросы:
1. Какие методы аутентификации используются для подключения по TCP/IP с адресов 127.0.0.1/32 и ::1/128?

ОТВЕТ:
```
Используется Аутентификация trust
Когда указан способ аутентификации trust, Postgres Pro предполагает, что любой подключающийся к серверу авторизован для доступа к базе данных вне зависимости от указанного имени пользователя базы данных (даже если это имя суперпользователя).
```

2. Какие методы аутентификации используются для подключения по TCP/IP со всех остальных адресов, кроме указанных в предыдущем пункте по протоколу?

ОТВЕТ:
```
Используется md5
Проверяет пароль пользователя, производя аутентификацию SCRAM-SHA-256 или MD5.
```

3. Верно ли следующее утверждение: пароль роли `app` хранится в виде `функция_хеширования password` (пароль хранится в поле `rolpassword`)? Если не верно, то приведите описание алгоритма, который используется для хранения хеша.

ОТВЕТ:
```
ВЕРНО
Используется шифрование по алгоритму md5
"md50d06d8eb2a5f36ab73d83481186543d5"
```

4. Какое значение (`t` будет означать `да`, `f` - нет) имеют поля `rolsuper`, `rolcreaterole`, `rolcreatedb`, `rolbypassrls` с указанием назначения данных столбцов? См. https://postgrespro.ru/docs/postgresql/12/catalog-pg-authid.

ОТВЕТ:
```
rolsuper, true - Роли имеет права суперпользователя
rolcreaterole, true - Роль может создавать другие роли
rolcreatedb, true - Роль может создавать базы данных
rolbypassrls, true - Роль не подчиняется никаким политикам защиты на уровне строк;
```
 
5. Почему значения полей `rolcanlogin` и `rolpassword` для роли `app` не изменились и вы по-прежнему можете подключиться с помощью `psql` без указания пароля, хотя в `pg_hba.conf` для `host all all all` указано `reject`?

ОТВЕТ:

```
потому что тип подключения локальное осталось доверенным trust (1 строчка)
также тип подключения по локальному соединению от хоста 127.0.0.1 тоже trust (2 строчка)
```
![](img/33/2-измененные%20типы%20подключения.png)

## Задание PostgreSQL CIS Benchmarks

Пришлите в личном кабинете студента ответы на следующие вопросы:
1. Какие методы **не рекомендуется** использовать для удалённых подключений?

ОТВЕТ:
```
Не рекомендуется использовать: trust,password,ident.
```

2. Какие методы **рекомендуется** использовать для удалённых подключений?

ОТВЕТ:
```
Рекомендуется использовать: scram sha-256 вместо md5, хотя md5 популярный и тоже может быть использован, но имеет уязвимости. 
Использование методов: gss,	sspi, pam, ldap, radius, cert - решается дополнительными настройками процессов и сервисов аутентификации 
```

#### Часть 2. Проверка ПРД

### Результаты выполнения

Отправьте в личном кабинете студента сообщение, которое отображается вместо `???` в результате выполнения запросов с недостаточными правами доступа: `ERROR:  ???`.

ОТВЕТ:

![](img/33/3-запуск%20команд.png)

![](img/33/3-2-запуск%20команд.png)
