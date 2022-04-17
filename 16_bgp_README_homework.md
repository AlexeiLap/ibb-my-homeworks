# Домашнее задание к занятию «Работа сети Интернет (часть 1): BGP, DNS»

В качестве результата пришлите ответы на вопросы в личном кабинете студента на сайте [netology.ru](https://netology.ru).

## Zoom

На любой Linux-машине (можете использовать Kali) с помощью утилиты dig найдите 5 компаний (доменов), 
которые скорее всего используют Zoom для своей работы.

В качестве результата необходимо отправить:
1. Описание (своими словами) как вы производили поиск
2. Список из 5 доменов
3. Скриншоты вывода dig для каждого домена

##ОТВЕТ
- делаем запрос в яндексе, получаем список например наиболее посещаемых сайтов
- сохраняем его в domains.txt
- запускаем команду `dig @8.8.8.8 -t TXT -f domains.txt +noall +answer | grep ZOOM`
- получаем результаты
![Скриншот](img/16/результаты%20ZOOM.png)

полученный список:
* avito.ru
* sberbank.ru
* hh.ru
* 2gis.ru
* fandom.com
* roblox.com
* cian.ru
* mts.ru
* mvideo.ru
* booking.com

- сохраняем его в другой файл zoomdomains.txt
- запускаем команду по нему `dig @8.8.8.8 -f zoomdomains.txt`
- получаем информацию по доменам
```commandline
┌──(kali㉿kali)-[~]
└─$ dig @8.8.8.8 -f zoomdomains.txt                        

; <<>> DiG 9.18.0-2-Debian <<>> avito.ru
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 48856
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;avito.ru.                      IN      A

;; ANSWER SECTION:
avito.ru.               120     IN      A       146.158.54.24
avito.ru.               120     IN      A       146.158.48.24
avito.ru.               120     IN      A       146.158.52.24

;; Query time: 52 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:08 EDT 2022
;; MSG SIZE  rcvd: 85

; <<>> DiG 9.18.0-2-Debian <<>> sberbank.ru
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 48545
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;sberbank.ru.                   IN      A

;; ANSWER SECTION:
sberbank.ru.            1751    IN      A       194.54.14.168

;; Query time: 36 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:08 EDT 2022
;; MSG SIZE  rcvd: 56

; <<>> DiG 9.18.0-2-Debian <<>> hh.ru
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 44879
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;hh.ru.                         IN      A

;; ANSWER SECTION:
hh.ru.                  887     IN      A       94.124.200.0

;; Query time: 24 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:08 EDT 2022
;; MSG SIZE  rcvd: 50

; <<>> DiG 9.18.0-2-Debian <<>> 2gis.ru
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 57837
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;2gis.ru.                       IN      A

;; ANSWER SECTION:
2gis.ru.                179     IN      A       91.236.51.153

;; Query time: 32 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:08 EDT 2022
;; MSG SIZE  rcvd: 52

; <<>> DiG 9.18.0-2-Debian <<>> fandom.com
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 46830
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;fandom.com.                    IN      A

;; ANSWER SECTION:
fandom.com.             1       IN      A       151.101.192.194
fandom.com.             1       IN      A       151.101.64.194
fandom.com.             1       IN      A       151.101.0.194
fandom.com.             1       IN      A       151.101.128.194

;; Query time: 28 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:08 EDT 2022
;; MSG SIZE  rcvd: 103

; <<>> DiG 9.18.0-2-Debian <<>> roblox.com
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 40698
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;roblox.com.                    IN      A

;; ANSWER SECTION:
roblox.com.             60      IN      A       128.116.123.3

;; Query time: 40 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:08 EDT 2022
;; MSG SIZE  rcvd: 55

; <<>> DiG 9.18.0-2-Debian <<>> cian.ru
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 42495
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;cian.ru.                       IN      A

;; ANSWER SECTION:
cian.ru.                15      IN      A       104.17.110.12
cian.ru.                15      IN      A       104.17.109.12

;; Query time: 40 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:08 EDT 2022
;; MSG SIZE  rcvd: 68

; <<>> DiG 9.18.0-2-Debian <<>> mts.ru
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8569
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;mts.ru.                                IN      A

;; ANSWER SECTION:
mts.ru.                 50      IN      A       178.248.238.27

;; Query time: 32 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:09 EDT 2022
;; MSG SIZE  rcvd: 51

; <<>> DiG 9.18.0-2-Debian <<>> mvideo.ru
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 56762
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;mvideo.ru.                     IN      A

;; ANSWER SECTION:
mvideo.ru.              707     IN      A       185.71.67.88

;; Query time: 32 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:09 EDT 2022
;; MSG SIZE  rcvd: 54

; <<>> DiG 9.18.0-2-Debian <<>> booking.com
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 62103
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;booking.com.                   IN      A

;; ANSWER SECTION:
booking.com.            20946   IN      A       5.57.16.220

;; Query time: 28 msec
;; SERVER: 8.8.8.8#53(8.8.8.8) (UDP)
;; WHEN: Sat Apr 16 08:48:09 EDT 2022
;; MSG SIZE  rcvd: 56



```

## BGP

Создайте в Cisco Packet Tracer следующую топологию:

![](pic/topology.png)

Настройте сетевую схему, используя следующие параметры:

1. Host1: 
    * IP: 10.1.1.10/24
    * Default route : 10.1.1.254
1. R1
    * IP gi0/0/0: 10.1.1.254/24
    * IP gi0/0/1: 192.168.1.1/30
    * BGP AS 65001
1. R2
    * IP gi0/0/0: 10.2.2.254/24
    * IP gi0/0/1: 192.168.1.2/30
    * BGP AS 65002
1. Host2
    * IP 10.2.2.10/24
    * Default route: 10.2.2.254
    
Запустите ping между Host1 и Host2 (он должен быть успешен).

В качестве результата пришлите сконфигурированную топологию в формате .pkt

##ОТВЕТ

Топология в формате .pkt прилагается.


