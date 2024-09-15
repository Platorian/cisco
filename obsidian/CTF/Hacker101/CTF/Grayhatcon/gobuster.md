```php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     https://aba57af67ebf06c8b2695efd584d53a1.ctf.hacker101.com/
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.htaccess            (Status: 403) [Size: 315]
/.hta                 (Status: 403) [Size: 315]
/.htpasswd            (Status: 403) [Size: 315]
/assets               (Status: 301) [Size: 389] [--> http://aba57af67ebf06c8b2695efd584d53a1.ctf.hacker101.com/assets/]
/dashboard            (Status: 302) [Size: 0] [--> login]
/favicon.ico          (Status: 200) [Size: 5430]
/login                (Status: 200) [Size: 1726]
/logout               (Status: 302) [Size: 0] [--> ./]
/register             (Status: 200) [Size: 1665]
/robots               (Status: 200) [Size: 38]
/robots.txt           (Status: 200) [Size: 38]
/server-status        (Status: 403) [Size: 315]
```

