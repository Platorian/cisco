```php
➜  opacity gobuster dir -w /usr/share/wordlists/dirb/big.txt -u http://10.10.177.166/ 
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.177.166/
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirb/big.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.htpasswd            (Status: 403) [Size: 278]
/.htaccess            (Status: 403) [Size: 278]
/cloud                (Status: 301) [Size: 314] [--> http://10.10.177.166/cloud/]
/css                  (Status: 301) [Size: 312] [--> http://10.10.177.166/css/]
/server-status        (Status: 403) [Size: 278]
Progress: 20469 / 20470 (100.00%)
===============================================================
Finished
===============================================================
```

```php
➜  opacity gobuster dir -w /usr/share/wordlists/dirb/big.txt -u http://10.10.177.166/cloud            
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.177.166/cloud
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirb/big.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.htaccess            (Status: 403) [Size: 278]
/.htpasswd            (Status: 403) [Size: 278]
/images               (Status: 301) [Size: 321] [--> http://10.10.177.166/cloud/images/]
Progress: 20469 / 20470 (100.00%)
===============================================================
Finished
===============================================================
```

