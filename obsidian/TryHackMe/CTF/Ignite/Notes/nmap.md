```php
➜  ignite cat nmap-initial.txt 
# Nmap 7.94SVN scan initiated Fri Jul 12 05:21:55 2024 as: nmap -sC -sV -oN nmap-initial.txt 10.10.196.59
Nmap scan report for 10.10.196.59
Host is up (0.029s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
|_http-title: Welcome to FUEL CMS
| http-robots.txt: 1 disallowed entry 
|_/fuel/
|_http-server-header: Apache/2.4.18 (Ubuntu)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Fri Jul 12 05:22:07 2024 -- 1 IP address (1 host up) scanned in 12.25 seconds
```



