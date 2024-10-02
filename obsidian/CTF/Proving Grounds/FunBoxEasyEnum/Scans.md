# nmap

```php
nmap -sV -sC -p- $IP
```

```php
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-10-01 09:04 BST
Nmap scan report for 192.168.231.132
Host is up (0.027s latency).
Not shown: 65533 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 9c:52:32:5b:8b:f6:38:c7:7f:a1:b7:04:85:49:54:f3 (RSA)
|   256 d6:13:56:06:15:36:24:ad:65:5e:7a:a1:8c:e5:64:f4 (ECDSA)
|_  256 1b:a9:f3:5a:d0:51:83:18:3a:23:dd:c4:a9:be:59:f0 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-title: Apache2 Ubuntu Default Page: It works
|_http-server-header: Apache/2.4.29 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 28.06 seconds
```

# dirb

```php
dirb http://192.168.231.132/ /usr/share/wordlists/dirb/common.txt
```

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/directory-list-2.3-big.txt -u 192.168.231.132
```


Extensions

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt -u 192.168.231.132 -x txt,php
```

```php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://192.168.231.132
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              txt,php
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta                 (Status: 403) [Size: 280]
/.hta.txt             (Status: 403) [Size: 280]
/.hta.php             (Status: 403) [Size: 280]
/.htaccess            (Status: 403) [Size: 280]
/.htpasswd            (Status: 403) [Size: 280]
/.htpasswd.php        (Status: 403) [Size: 280]
/.htaccess.php        (Status: 403) [Size: 280]
/.htpasswd.txt        (Status: 403) [Size: 280]
/.htaccess.txt        (Status: 403) [Size: 280]
/index.html           (Status: 200) [Size: 10918]
/javascript           (Status: 301) [Size: 323] [--> http://192.168.231.132/javascript/]
/mini.php             (Status: 200) [Size: 3828]
/phpmyadmin           (Status: 301) [Size: 323] [--> http://192.168.231.132/phpmyadmin/]
/robots.txt           (Status: 200) [Size: 21]
/robots.txt           (Status: 200) [Size: 21]
/server-status        (Status: 403) [Size: 280]
Progress: 14202 / 14205 (99.98%)
===============================================================
Finished
===============================================================
```




