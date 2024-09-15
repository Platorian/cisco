```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt  -u http://192.168.240.230/
```

```php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://192.168.240.230/
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta                 (Status: 403) [Size: 280]
/.htpasswd            (Status: 403) [Size: 280]
/.htaccess            (Status: 403) [Size: 280]
/blogs                (Status: 301) [Size: 318] [--> http://192.168.240.230/blogs/]
/index.html           (Status: 200) [Size: 621]
/server-status        (Status: 403) [Size: 280]
Progress: 4734 / 4735 (99.98%)
===============================================================
Finished
===============================================================
```