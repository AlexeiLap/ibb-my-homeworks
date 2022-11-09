# Домашнее задание к занятию «1.1. Архитектура современных веб-сервисов»

### Решение задания

В качестве решения пришлите в формате ниже ответы на вопросы:
1. Каким образом проходит путь запросов от клиента: на какой сервис и через какие сервисы?
2. Какие запросы делаются на каждом этапе, и какие ответы на них приходят?

### Формат ответа

Обратите внимание: это формат, а не пример реального взаимодействия из вашего задания.

Ответ клиента:

```text
2022/11/09 10:09:06 {"transactions":[{"id":1,"userId":2,"category":"auto","amount":1000000,"created":1667977186},{"id":2,"userId":2,"category":"auto","amount":100000,"created":1667977186},{"id":3,"userId":2,"category":"food","amount":100000,"created":1667977186}],"categoryStats":{"auto":1100000,"food":100000}}
```

Путь запросов:

```text
1. Client --> Server 1 (запрос):

PUT http://localhost:9001/users
Content-Type: application/x-www-form-urlencoded

Form item: "login" = "user"
Form item: "password" = "111111"

2. Server 1 --> Client  (ответ):

200 OK
Content-Type: application/json

{
  "token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImxvZ2luIjoidXNlciIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjY3OTc3NzQ2LCJleHAiOjE2Njc5ODEzNDZ9.GDFdLjizAlHs6FdnhfbBitVNVPEOMxnxHe4IkvIcPh6OtcZjs1Q1lx-8dX5DUtu7qsQHYf"  
}

3. Client --> Server 2 (запрос):

GET http://localhost:9002/api/transactions
Authorization: eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImxvZ2luIjoidXNlciIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjY3OTc3NzQ2LCJleHAiOjE2Njc5ODEzNDZ9.GDFdLjizAlHs6FdnhfbBitVNVPEOMxnxHe4IkvIcPh6OtcZjs1Q1lx-8dX5DUtu7qsQHY

4. Server 2 --> Server 3 (запрос):

GET http://localhost:9003/api/transactions

5. Server 3 --> Server 4 (запрос):

GET http://localhost:9004/api/transactions

6. Server 4 --> Server 3 (ответ):

200 OK
Content-Type: application/json

[{"id":1,"userId":2,"category":"auto","amount":1000000,"created":1667977186},{"id":2,"userId":2,"category":"auto","amount":100000,"created":1667977186},{"id":3,"userId":2,"category":"food","amount":100000,"created":1667977186}]

7. Server 3 --> Server 2 (ответ):

200 OK
Content-Type: application/json

{"transactions":[{"id":1,"userId":2,"category":"auto","amount":1000000,"created":1667977186},{"id":2,"userId":2,"category":"auto","amount":100000,"created":1667977186},{"id":3,"userId":2,"category":"food","amount":100000,"created":1667977186}],"categoryStats":{"auto":1100000,"food":100000}}

8. Server 2 --> Client  (ответ):

200 OK
Content-Type: application/json

{"transactions":[{"id":1,"userId":2,"category":"auto","amount":1000000,"created":1667977186},{"id":2,"userId":2,"category":"auto","amount":100000,"created":1667977186},{"id":3,"userId":2,"category":"food","amount":100000,"created":1667977186}],"categoryStats":{"auto":1100000,"food":100000}}

```