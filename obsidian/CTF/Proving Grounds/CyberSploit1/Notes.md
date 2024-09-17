I start with an nmap scan. 

Port 80

The main page has a username in the source code of the page:

![[Pasted image 20240917043940.png]]

username:itsskv

/robots

```php
Y3liZXJzcGxvaXR7eW91dHViZS5jb20vYy9jeWJlcnNwbG9pdH0=
```

![[Pasted image 20240917044526.png]]

```php
echo -n 'Y3liZXJzcGxvaXR7eW91dHViZS5jb20vYy9jeWJlcnNwbG9pdH0=' | base64 -d
```

`cybersploit{youtube.com/c/cybersploit}`

/hacker
`hacker.jpg`

I'm not sure what to do with the youtube link, but in the meantime i decide to run a hydra brute-force on the ssh with the username i found. I test the name first by manually connecting to the IP.

Okay, the link is the password for user itsktv

user: 
itsktv

pass: 
cybersploit{youtube.com/c/cybersploit}

local.txt is in the home directory
`95d238eee86a21548079f55e1a970607`

---

enum

Linux cybersploit-CTF 3.13.0-32-generic #57~precise1-Ubuntu SMP Tue Jul 15 03:50:54 UTC 2014 i686 athlon i386 GNU/Linux

`Sorry, user itsskv may not run sudo on cybersploit-CTF.`

internal port 631

Linpeas

![[Pasted image 20240917055144.png]]

Looking up the kernal i see it's vulnerable to overlay exploit:

_Linux Kernel 3.13.0 < 3.19 (Ubuntu 12.04/14.04/14.10/15.04) - 'overlayfs' Local Privilege Escalation_

https://www.exploit-db.com/exploits/37292

proof.txt:
`ef4c83bb4b8f8fbb898142d2aec56a77`

![[Pasted image 20240917055616.png]]

