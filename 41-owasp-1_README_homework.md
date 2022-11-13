# Домашнее задание к занятию «2.1. OWASP»

Пришлите ответы на вопросы в личном кабинете на сайте [netology.ru](https://netology.ru).

## Задание SQLi

### Этапы выполнения

1. Перейдите на страницу логина.

![](pic/login.png)

2. Используя ваши знания об SQLi, попробуйте войти в систему.

Часто при работе с СУБД возникают ошибки из-за некорректно составленных SQL-запросов, превышения лимита подключений, проблем с фиксацией транзакций и т. д. Эти ошибки пробрасываются из СУБД в само приложение, которое логгирует их, то есть записывает в лог-файл. Это позволяет программистам проводить анализ случившегося и быстрее исправлять ошибки. Часто для удобства на этапе разработки эти сообщения выводятся не только в лог-файл, но и дублируются в ответе, возвращаемом сервером по HTTP. Так они могут просачиваться в Production, если кто-то забыл отключить эту функцию.

То же самое будет происходить при подборе данных для SQLi — возникнет ошибка, которая может просочиться к вам в виде HTTP-ответа. Тогда вы не вслепую будете подбирать данные. Откройте инструменты разработчика браузера (`F12`) и внимательно посмотрите на то, какие ответы на ваш запрос возвращает сервер при нажатии на кнопку «Войти в систему».

Проанализируйте, под каким пользователем вам удалось войти, ваши предположения о том, почему удалось войти именно под этим пользователем.

### Решение задания

В качестве решения пришлите:
1. Использованные для ввода данные.

ОТВЕТ:
```text
логин - аоаооао' OR TRUE --
пароль - 123
```
2. Под каким пользователем вам удалось войти.

ОТВЕТ:
```text
admin@juice-sh.op
```

3. Ваши предположения, почему удалось войти именно под этим пользователем.

ОТВЕТ:
```text
потому что у него ид=1 и в запросе выбрался первый пользователь поскольку запрос не содержал условий на выборку
```
```text
email:"admin@juice-sh.op"
id:1
lastLoginIp:"undefined"
profileImage:"assets/public/images/uploads/defaultAdmin.png"

```

4. Где хранится аутентификационная информация, что она из себя представляет и как передаётся в каждом запросе.

ОТВЕТ:
```text
Передается в заловках запроса в виде токена.

Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MSwidXNlcm5hbWUiOiIiLCJlbWFpbCI6ImFkbWluQGp1aWNlLXNoLm9wIiwicGFzc3dvcmQiOiIwMTkyMDIzYTdiYmQ3MzI1MDUxNmYwNjlkZjE4YjUwMCIsInJvbGUiOiJhZG1pbiIsImRlbHV4ZVRva2VuIjoiIiwibGFzdExvZ2luSXAiOiJ1bmRlZmluZWQiLCJwcm9maWxlSW1hZ2UiOiJhc3NldHMvcHVibGljL2ltYWdlcy91cGxvYWRzL2RlZmF1bHRBZG1pbi5wbmciLCJ0b3RwU2VjcmV0IjoiIiwiaXNBY3RpdmUiOnRydWUsImNyZWF0ZWRBdCI6IjIwMjItMTEtMTMgMDg6NDE6MTguODE0ICswMDowMCIsInVwZGF0ZWRBdCI6IjIwMjItMTEtMTMgMDk6MDk6NTcuODE0ICswMDowMCIsImRlbGV0ZWRBdCI6bnVsbH0sImlhdCI6MTY2ODMzNTgwOCwiZXhwIjoxNjY4MzUzODA4fQ.F3pKZVhqB_F9H4aBbRiME--azUr7TGQyMpfGVBuYBlq1HLA0ctuL_j6xgte_9NkAM2brKjVoPjypwsYIh55HhhMH5hwvYUTjWFBij8DeDuDmXGCq7nvHr7Gj6_MXoO-e2bvrp8PfaJ0rCf-osGe0QLVp9uLEtLPqUM5_BFCKhD4
Cookie: language=ru_RU; cookieconsent_status=dismiss; welcomebanner_status=dismiss; continueCode=mnWyjRDqM8OVJE1Z5e4r9bXpaAPLUKTBiQ4A2kBLm3KwlNx6YnWgoP7zvQeR; token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MSwidXNlcm5hbWUiOiIiLCJlbWFpbCI6ImFkbWluQGp1aWNlLXNoLm9wIiwicGFzc3dvcmQiOiIwMTkyMDIzYTdiYmQ3MzI1MDUxNmYwNjlkZjE4YjUwMCIsInJvbGUiOiJhZG1pbiIsImRlbHV4ZVRva2VuIjoiIiwibGFzdExvZ2luSXAiOiJ1bmRlZmluZWQiLCJwcm9maWxlSW1hZ2UiOiJhc3NldHMvcHVibGljL2ltYWdlcy91cGxvYWRzL2RlZmF1bHRBZG1pbi5wbmciLCJ0b3RwU2VjcmV0IjoiIiwiaXNBY3RpdmUiOnRydWUsImNyZWF0ZWRBdCI6IjIwMjItMTEtMTMgMDg6NDE6MTguODE0ICswMDowMCIsInVwZGF0ZWRBdCI6IjIwMjItMTEtMTMgMDk6MDk6NTcuODE0ICswMDowMCIsImRlbGV0ZWRBdCI6bnVsbH0sImlhdCI6MTY2ODMzNTgwOCwiZXhwIjoxNjY4MzUzODA4fQ.F3pKZVhqB_F9H4aBbRiME--azUr7TGQyMpfGVBuYBlq1HLA0ctuL_j6xgte_9NkAM2brKjVoPjypwsYIh55HhhMH5hwvYUTjWFBij8DeDuDmXGCq7nvHr7Gj6_MXoO-e2bvrp8PfaJ0rCf-osGe0QLVp9uLEtLPqUM5_BFCKhD4
```
Если токен расшифровать то там видны все данные пользователя:

![](img/41/5-расшифрока%20токена.png)

Токен также содержится логин и пароль пользователя.
Что является небезопасным, поскольку токен хранится в куки и локальном хранилище и может быть перехвачен злоумышленником.

## Задание robots.txt

Прочитайте информацию о файле [`robots.txt`](https://developers.google.com/search/docs/advanced/robots/intro?hl=ru) и [его описание](https://developers.google.com/search/docs/advanced/robots/robots_txt?hl=ru).

### Решение задания

Пришлите ваш вывод, корректно ли используется `robots.txt`. Если нет, то почему и к каким последствиям это ведёт.

ОТВЕТ:

```text
Cодержимое файла

User-agent: *
Disallow: /ftp

Описание:
Запрещает сканировать папку /ftp в которой содержится конфиденциальная информация
Например http://localhost:3000/ftp/acquisitions.md
И разные данные.

Зная содержимое robots.txt, злоумышленники могут попытаться получить эти данные.
```

## Задание «Взлом администратора»

После успешной эксплуатации SQL-инъекции вы войдёте от имени администратора магазина. Чтобы узнать почту пользователя, обратите внимание на запрос `http://localhost:3000/rest/user/whoami`. В ответе получите почтовый ящик администратора. Попробуйте проверить на прочность систему — подобрать пароль администратора.

### Решение задания

Пришлите пароль, который стоял у администратора. Объясните, какие меры позволили бы защититься от атаки.

ОТВЕТ:
```text
пароль администратора: admin123
но этот пароль можно также получить из токена, там содержится хэш пароля, который несложно расшифровать
0192023a7bbd73250516f069df18b500:
пароль: admin123
```

```text
Также этот пароль можно узнать путем атаки из списка 100 тыс. наиболее используемых паролей.
Найденный пароль путем атаки с использованием Burp инструмента
1704 пароль подошел и дал положительный ответ с токеном
```
![](img/41/7-взлом%20через%20атаку.png)

```text
Избежать таких атак можно было путем:
Ограничить количество попыток ввода логина и пароля для одного логина.
Например после 10 неудачных попыток делать временную блокировку чтобы метод не проверял дальше логины и пароли.
А после 20 неудачных попыток делать полную блокировку чтобы пользователь восстанавливал пароль через методы восстановления пароля.

Тогда атака была бы невозможна.
```
