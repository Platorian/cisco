# Creative

- Nmap verbose indicates port 80 is open so i check to see if there is a website. 
- Had trouble logging in so i added the website domain name from the url to the host file 

![[Pasted image 20240714073235.png]]

Server info:
nginx/1.18.0 (Ubuntu)

I search launchpad to see what it's uploaded to: `ubuntu nginx 1.18.0 launchpad`

![[Pasted image 20240714074246.png]]

- So we see it's included with focal.
- We now search for: `ubuntu releases focal`
- Click on releases and see if it's up-to date, or old with possible vulnerabilities   

![[Pasted image 20240714074750.png]]

- The wiki is a better option to view releases: https://wiki.ubuntu.com/Releases
- Focal looks like a recent edition so it's probably not vulnerable.
- Time to run gobuster.

**Nothing Found**

_Trying to get subdomains_
https://github.com/aboul3la/Sublist3r

```php
sublist3r -b -v -d creative.thm -p 80
```

Sublister crashed the server for a while so i switched to gobuster

```php
gobuster vhost -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt -u http://creative.thm/ --append-domain
```

```php
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
Found: beta.creative.thm Status: 200 [Size: 591]
Progress: 19966 / 19967 (99.99%)
===============================================================
Finished
===============================================================
```

Let's add it to the hosts file. We can add it to the same line, separated by a comma, as the first domain and ip entry.
e.g `<IP>    domain1, domain2`

![[Pasted image 20240714084142.png]]

