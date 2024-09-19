```php
nmap -sV -sC -p- -oN nmap.txt $IP
```

```php
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-09-17 22:32 EDT
Nmap scan report for 192.168.156.120
Host is up (0.020s latency).
Not shown: 65532 closed tcp ports (conn-refused)
PORT     STATE SERVICE VERSION
6667/tcp open  irc     UnrealIRCd
6697/tcp open  irc     UnrealIRCd
8067/tcp open  irc     UnrealIRCd (Admin email example@example.com)
Service Info: Host: irc.foonet.com

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 14.63 seconds
```

