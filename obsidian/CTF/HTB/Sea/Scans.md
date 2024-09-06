**Nmap:**

```php
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-09-03 23:50 EDT
Nmap scan report for 10.10.11.28
Host is up (0.037s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.11 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 e3:54:e0:72:20:3c:01:42:93:d1:66:9d:90:0c:ab:e8 (RSA)
|   256 f3:24:4b:08:aa:51:9d:56:15:3d:67:56:74:7c:20:38 (ECDSA)
|_  256 30:b1:05:c6:41:50:ff:22:a3:7f:41:06:0e:67:fd:50 (ED25519)
80/tcp open  http    Apache httpd 2.4.41 ((Ubuntu))
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
|_http-title: Sea - Home
|_http-server-header: Apache/2.4.41 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 8.49 seconds
```

**Gobuster:**

```php
┌──(kali㉿kali)-[~/Documents/htb/sea]
└─$ gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt -u http://sea.htb                                          
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://sea.htb
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta                 (Status: 403) [Size: 199]
/.htpasswd            (Status: 403) [Size: 199]
/.htaccess            (Status: 403) [Size: 199]
/0                    (Status: 200) [Size: 3650]
/404                  (Status: 200) [Size: 3341]
/Documents and Settings (Status: 403) [Size: 199]
/Program Files        (Status: 403) [Size: 199]
/data                 (Status: 301) [Size: 228] [--> http://sea.htb/data/]
/home                 (Status: 200) [Size: 3650]
/index.php            (Status: 200) [Size: 3650]
/messages             (Status: 301) [Size: 232] [--> http://sea.htb/messages/]
/plugins              (Status: 301) [Size: 231] [--> http://sea.htb/plugins/]
/reports list         (Status: 403) [Size: 199]
/server-status        (Status: 403) [Size: 199]
/themes               (Status: 301) [Size: 230] [--> http://sea.htb/themes/]
Progress: 4734 / 4735 (99.98%)
===============================================================
Finished
===============================================================
```

