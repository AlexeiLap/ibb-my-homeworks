# Домашнее задание к занятию «Язык программирования Python. Криптография.»

В качестве результата пришлите ответы на вопросы в личном кабинете студента на сайте [netology.ru](https://netology.ru/).

**Важно**: перед отправкой переименуйте ваш скрипт в `script.txt` (система отправки файлов Netology блокирует файлы с расширением `.py`).



## Задание 1

Реализуйте атаку грубой силой на текст, зашифрованный AES. В качестве пароля возьмите трёхзначное число.

```python
#!/usr/bin/env python3

import Crypto
from Crypto.Cipher import AES
import hashlib

BS = AES.block_size
pad = lambda s: s + (BS - len(s) % BS) * chr(BS - len(s) % BS) 
unpad = lambda s : s[:-ord(s[len(s)-1:])]

#Chiper text

cipher_text = b'\x82\x10\x03\xcdT3\xf7\x83\x84\x1a|)\xf6\xaa\xd5\x80\x96KO0\x1a\xd40Phv\x98\x90\x00\xa3\xd7\x9c'

print("Ciphered text:", cipher_text)
for nk in range (0,1000):
 key = hashlib.sha256(bytes(nk)).digest()
 iv = cipher_text[:BS]
 cipher = AES.new(key, AES.MODE_CBC, iv)
 plain_text = unpad(cipher.decrypt(cipher_text[BS:]))
 if plain_text !=  b'':
  print("Secret key: ", nk, " Plain text:", plain_text)
```

### Результаты работы скрипта
![](img/28/результаты%20расшифровки.png)
