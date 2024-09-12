nmap

```php
nmap -sV -sC -oN nmap-init.txt $IP
```

```php
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-09-11 23:14 EDT
Nmap scan report for 192.168.186.35
Host is up (0.022s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 33:40:be:13:cf:51:7d:d6:a5:9c:64:c8:13:e5:f2:9f (RSA)
|   256 8a:4e:ab:0b:de:e3:69:40:50:98:98:58:32:8f:71:9e (ECDSA)
|_  256 e6:2f:55:1c:db:d0:bb:46:92:80:dd:5f:8e:a3:0a:41 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-title: Apache2 Ubuntu Default Page: It works
|_http-server-header: Apache/2.4.29 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 7.65 seconds

```


gobuster

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt -u $IP
```

```php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://192.168.186.35
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta                 (Status: 403) [Size: 279]
/.htpasswd            (Status: 403) [Size: 279]
/.htaccess            (Status: 403) [Size: 279]
/index.html           (Status: 200) [Size: 10918]
/phpinfo.php          (Status: 200) [Size: 95413]
/robots.txt           (Status: 200) [Size: 9]
/server-status        (Status: 403) [Size: 279]
Progress: 4734 / 4735 (99.98%)
===============================================================
Finished
===============================================================
```

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt -u $IP/sar2HTML
```

```php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://192.168.186.35/sar2HTML
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta                 (Status: 403) [Size: 279]
/.htpasswd            (Status: 403) [Size: 279]
/.htaccess            (Status: 403) [Size: 279]
/LICENSE              (Status: 200) [Size: 35149]
/index.php            (Status: 200) [Size: 4812]
Progress: 4734 / 4735 (99.98%)
===============================================================
Finished
===============================================================
```

