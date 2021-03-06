# Домашнее задание к занятию «ОС Linux (часть 2)»

В качестве результата пришлите ответы на вопросы в личном кабинете студента на сайте [netology.ru](https://netology.ru).

## Задача SystemCtl & JournalCtl

### Легенда

На лекции мы рассмотрели работу с Systemd и Journald. В это ДЗ вам необходимо будет закрепить данные навыки, зарегистрировав предлагаемый вам сервер в качестве сервиса Systemd и проанализировав его логи с помощью JournalCtl.

### Задача

Скачайте:
1. [Исполняемый файл сервера](assets/server.bin)
1. [Сертификат](assets/certificate.pem) и [приватный ключ](assets/key.pem)

Настройте запуск сервера (используйте виртуальную машину с ОС Ubuntu) при старте системы с рабочим каталогом `/opt/app` (сертификаты должны располагаться в нём же).

С помощью `journalctl` отследите, лог приложения (не менее 2х минут) и пришлите:
![](img/22/запущенный%20сервис.png)

1. Скриншот, либо содержимое файла `app.service`

![](img/22/содержимое%20файла%20app-service.png)

2. Ответы на впоросы:
    1. На каком IP и порту запускается сервис 
   
`IP : localhost, port : 9999, PID : 20223`
![](img/22/где%20запущен%20сервис%20на%20локалхост%20на%20порту%209999.png)

    3. Кто (IP и порт) шлёт запросы на этот сервис и на какой путь
`IP : localhost, port : разные порты на путь GET api/token`
![](img/22/входящие%20запросы.png)

    4. Какие ответы (формат) получает клиент из п.ii получает в ответ на свои запросы
`защифрованные ответы со статусом ok`

![](img/22/запросы%20и%20ответы.png)

    5. Какой ответ (HTTP статус код) получите вы, если пошлёте из браузера запрос на этот же адрес (сертификат самоподписанный, поэтому вам необходимо принять его)

`403 Доступ разпрещен, а браузер показывает NotFound`

![](img/22/curl%20с%20опциями%20игнорирования%20проверок.png)

![](img/22/кали%20не%20показывает%20ничего%20по%20этому%20адресу%20хотя%20сертификат%20принял.png)


