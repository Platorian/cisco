```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/directory-list-2.3-medium.txt -u $IP
```

```php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://192.168.156.92
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/SecLists-master/Discovery/Web-Content/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/index                (Status: 200) [Size: 2333]
/robots               (Status: 200) [Size: 53]
/hacker               (Status: 200) [Size: 3757743]
/server-status        (Status: 403) [Size: 295]
Progress: 220559 / 220560 (100.00%)
===============================================================
Finished
===============================================================
```



