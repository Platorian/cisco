```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt -u $IP 
```

```php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://192.168.208.111
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.htaccess            (Status: 403) [Size: 280]
/.hta                 (Status: 403) [Size: 280]
/.htpasswd            (Status: 403) [Size: 280]
/admin                (Status: 301) [Size: 318] [--> http://192.168.208.111/admin/]
/index.html           (Status: 200) [Size: 10918]
/index.php            (Status: 200) [Size: 3468]
/robots.txt           (Status: 200) [Size: 14]
/secret               (Status: 301) [Size: 319] [--> http://192.168.208.111/secret/]
/server-status        (Status: 403) [Size: 280]
/store                (Status: 301) [Size: 318] [--> http://192.168.208.111/store/]
Progress: 4734 / 4735 (99.98%)
===============================================================
Finished
===============================================================
```

