## Scans

Nmap:

```php
Nmap scan report for 10.10.200.205
Host is up, received user-set (0.023s latency).
Scanned at 2024-07-10 05:00:30 EDT for 36s
Not shown: 65534 closed tcp ports (reset)
PORT   STATE SERVICE REASON         VERSION
85/tcp open  http    syn-ack ttl 63 Apache httpd 2.4.7 ((Ubuntu))
|_http-title: 0H N0! PWN3D 4G4IN
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.7 (Ubuntu)
OS fingerprint not ideal because: Didn't receive UDP response. Please try again with -sSU
Aggressive OS guesses: Linux 5.4 (92%), Linux 3.10 - 3.13 (92%), Crestron XPanel control system (91%), ASUS RT-N56U WAP (Linux 3.4) (90%), Linux 3.16 (90%), Sony Android TV (Android 5.0) (88%), Android 5.0 - 6.0.1 (Linux 3.4) (88%), Android 5.1 (88%), Android 7.1.1 - 7.1.2 (88%), Android 7.1.2 (Linux 3.4) (88%)
```

Whatweb

```php
WhatWeb report for http://10.10.200.205:85
Status    : 200 OK
Title     : 0H N0! PWN3D 4G4IN
IP        : 10.10.200.205
Country   : RESERVED, ZZ

Summary   : Apache[2.4.7], HTML5, HTTPServer[Ubuntu Linux][Apache/2.4.7 (Ubuntu)]

Detected Plugins:
[ Apache ]
	The Apache HTTP Server Project is an effort to develop and
	maintain an open-source HTTP server for modern operating
	systems including UNIX and Windows NT. The goal of this
	project is to provide a secure, efficient and extensible
	server that provides HTTP services in sync with the current
	HTTP standards.

	Version      : 2.4.7 (from HTTP Server Header)
	Google Dorks: (3)
	Website     : http://httpd.apache.org/

[ HTML5 ]
	HTML version 5, detected by the doctype declaration


[ HTTPServer ]
	HTTP server header string. This plugin also attempts to
	identify the operating system from the server header.

	OS           : Ubuntu Linux
	String       : Apache/2.4.7 (Ubuntu) (from server string)

HTTP Headers:
	HTTP/1.1 200 OK
	Date: Wed, 10 Jul 2024 09:01:01 GMT
	Server: Apache/2.4.7 (Ubuntu)
	Last-Modified: Tue, 28 Nov 2023 23:50:02 GMT
	ETag: "287-60b3f13c06c99-gzip"
	Accept-Ranges: bytes
	Vary: Accept-Encoding
	Content-Encoding: gzip
	Content-Length: 380
	Connection: close
	Content-Type: text/html
```

Feroxbuster:

```php
200      GET       38l       67w      871c http://10.10.200.205:85/app/
```

---

I find a webpage on port 85:

![[Pasted image 20240710103108.png]]

Looking at the scans we find further pages:

![[Pasted image 20240710103158.png]]

![[Pasted image 20240710103220.png]]

Has some type of comment system:

![[Pasted image 20240710103610.png]]

Could be a possible username:

![[Pasted image 20240710103720.png]]

On the same page we also have another message system:

![[Pasted image 20240710103810.png]]

I find a `concrete5` login page with gobuster:

![[Pasted image 20240710104850.png]]

```php
➜  mkingdom gobuster dir -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt -u http://10.10.200.205:85/app/castle/index.php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.200.205:85/app/castle/index.php
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/search               (Status: 200) [Size: 7500]
/blog                 (Status: 200) [Size: 11229]
/contact              (Status: 200) [Size: 13839]
/login                (Status: 200) [Size: 9613]
/account              (Status: 200) [Size: 9613]
```

Found an interesting redirect:

![[Pasted image 20240710112058.png]]

---

