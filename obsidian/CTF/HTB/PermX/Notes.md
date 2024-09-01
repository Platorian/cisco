**Target:**
```php
10.10.11.23
```

Nmap reveals port 80 with a webpage.

Gobuster doesn't find any directories so i try a subdomain search and find `lms`

I add both addresses to the host file:
`permx.htb` and `lms.perx.htb`

This takes me to a login page.

Wappalyzer shows php as one of the services as well as apache which lines up with the namp scan. 

I try telling the app that i lost my password for user admin, which gives me a possible username:
`This platform was unable to send the email. Please contact [Davis Miller](mailto:admin@permx.htb) for more information.`

Find robot.txt with gobuster on the lms subdomain

```php
# robots.txt
User-Agent: *
# Directories
Disallow: /app/
Disallow: /bin/
Disallow: /documentation/
Disallow: /home/
Disallow: /main/
Disallow: /plugin/
Disallow: /tests/
Disallow: /vendor/
# Files
Disallow: /license.txt
Disallow: /README.txt
Disallow: /whoisonline.php
Disallow: /whoisonlinesession.php
```


Administrator : [Davis Miller](mailto:admin@permx.htb)
[Powered by Chamilo](http://lms.permx.htb/) © 2024

**/documentation:**
Chamilo 1.11 - Documentation

Exploits:
https://github.com/Rai2en/CVE-2023-4220-Chamilo-LMS

https://starlabs.sg/advisories/23/23-4220/

I check the vulnerable path to see if it exposes any files:

http://lms.permx.htb/main/inc/lib/javascript/bigupload/files/

![[Pasted image 20240831123247.png]]

Exploit:

```php
python3 main.py -u http://lms.permx.htb/ -a scan
```

Webshell
```php
python3 main.py -u http://example.com/chamilo -a revshell
```

I transfer `pspy` and `linpeas.sh` to the WebServer.



