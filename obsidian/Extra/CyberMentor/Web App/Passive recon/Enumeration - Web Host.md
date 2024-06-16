### Passive Recon
##### Enumeration
![[Pasted image 20240616195450.png]]

Some of these tools are active and passive tools.

***I will use a bash variable in these notes of $IP to represent our target***

Create a global variable to store our target ip address
```bash
export IP=<Target>
```

Bug Bounty:
https://bugcrowd.com/cyberghost

##### Sub Domains

Sublist3r
https://github.com/aboul3la/Sublist3r

crt.sh
https://crt.sh/
```
%.<Target>.com
```

- % is a wildcard

Burp suite proxy, about:config:
```
127.0.0.1:8080
```

Then add the certificate
http://burpsuite in a browser tab

Burpsuite regex to add domains into scope and remove the noise
```
.*\.<Target>\.com$
```

Remove out of scope items from bug bounty. Just open the out of scope sites and then add them to out of scope in burp.

I could add the subdomains to a file in a list and make a bash program to open them in firefox using sleep to time it easier for hands free viewing. 

Check adfs and sso sub domains.

Checking security headers
https://securityheaders.com

In burp we have the option to right click the target and perform a scan (crawl)
- crawl and audit option will attempt to exploit the website, and vuln scan.

Firefox extensions:
`wappalyzer`

If yo find a microsoft server you know not to look for php files and need to be looking for:
- asp
- aspx
- asm
- asmx

When doing exploit attempts you will not be looking for /etc/passwd you are looking for boot.ini

Utilize chatgpt and search engines to help determine which things are vulnerable.

Look in wappalyzer to see if it's running on azure, if so then it's in the cloud and you could reverse shell into a DMZ, or out into the cloud.

Check https://builtwith.com for further information.

***Make sure to make good notes of important findings***

Paid data breech resource, but very useful for OSINT and credential stuffing. https://weleakinfo.com

*Advanced
You can use the data dump to look for similarities in passwords, do they often use the same dates and places etc.*





