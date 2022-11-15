# Домашнее задание к занятию «2.2. OWASP»

Пришлите ответы на вопросы в личном кабинете на сайте [netology.ru](https://netology.ru).

## Задание «Поиск»

В качестве Cheat Sheet, содержащего примеры возможного вода для проверки подверженности XSS, используйте [XSS Cheat Sheet](https://owasp.org/www-community/xss-filter-evasion-cheatsheet) от OWASP.

### Этапы выполнения

1. Проверьте поле поиска на сайте на подверженность XSS.
2. Проанализируйте, возможно ли ссылку, полученную в результате ввода в строку поиска, передать другому человеку, чтобы получить Reflected XSS. 

### Решение задания

В качестве решения пришлите:
1. Использованные данные для ввода.

- `\<a onmouseover="alert(document.cookie)"\>xxs link\</a\>`
- `<IMG SRC=# onmouseover="alert('xxs')">`
- `<IMG SRC=/ onerror="alert(document.cookie)"></img>`

Результат ввода:

![](img/42/3-вариант%20получаем%20куки%20пользователя.png)

2. Пункт из XSS Cheat Sheet, в котором содержится пример для проверки подверженности поля поиска XSS.

![](img/42/1-вариант%20уязвимости.png)

![](img/42/2-вариант%20уязвимости.png)

![](img/42/3-вариант%20уязвимости%20который%20передается%20и%20сразу%20скрипт%20запускает.png)

## Задание «Чужая корзина»

Найдите IDOR в корзине. Посмотрите, что лежит в чужих корзинах. 

### Этапы выполнения

1. Положите что-то в свою корзину. 
2. Откройте саму корзину и инструменты разработчика. 
3. Проанализируйте, что лежит в куках и локальном хранилище. Попробуйте изменить данные, обновите страницу. 

### Решение задания

В качестве решения пришлите:
1. Наименование параметра, который отвечает за открываемую корзину.

`Параметр bid`

![](img/42/4-просмотр%20чужой%20корзины.png)

2. Ваши рекомендации по исправлению этой незначительной уязвимости.

```text
Доработать метод АПИ http://localhost:3000/rest/basket/2
Убрать из него параметр и брать ид пользователя из заголовка запроса из токена авторизации
Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MSwidXNlcm5hbWUiOiIiLCJlbWFpbCI6ImFkbWluQGp1aWNlLXNoLm9wIiwicGFzc3dvcmQiOiIwMTkyMDIzYTdiYmQ3MzI1MDUxNmYwNjlkZjE4YjUwMCIsInJvbGUiOiJhZG1pbiIsImRlbHV4ZVRva2VuIjoiIiwibGFzdExvZ2luSXAiOiIiLCJwcm9maWxlSW1hZ2UiOiJhc3NldHMvcHVibGljL2ltYWdlcy91cGxvYWRzL2RlZmF1bHRBZG1pbi5wbmciLCJ0b3RwU2VjcmV0IjoiIiwiaXNBY3RpdmUiOnRydWUsImNyZWF0ZWRBdCI6IjIwMjItMTEtMTUgMDc6NDg6NDEuMjIxICswMDowMCIsInVwZGF0ZWRBdCI6IjIwMjItMTEtMTUgMDc6NDg6NDEuMjIxICswMDowMCIsImRlbGV0ZWRBdCI6bnVsbH0sImlhdCI6MTY2ODQ5OTk1OCwiZXhwIjoxNjY4NTE3OTU4fQ.VTfKRFdt5-TKZl1JZiWcCqIIOlhCSGGHh9TNvyjWpF7KV_XGZ_oBYq3Oj35fP52f-p7EroYXTs0HsNsUcoxvhauvIK_me00QflrC2e5BtT4CgW6uIBqVBOHcvz_BYdh1OdKxVe1u-ImsDXYH0xLxIOSQ1SI9Vmc2Z2MNd2yGckY
По ид пользователя уже искать и выдавать корзину.
```

