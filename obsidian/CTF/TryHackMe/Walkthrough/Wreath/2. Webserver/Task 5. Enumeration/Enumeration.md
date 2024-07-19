**As with any attack, we first begin with the enumeration phase. Completing the [Nmap](https://tryhackme.com/room/furthernmap) room (if you haven't already) will help with this section.**

**Thomas gave us an IP to work with (shown on the Network Panel at the top of the page). Let's start by performing a port scan on the first 15000 ports of this IP.**

_**Note:** Here (and in general), it's a good idea to save your scan results to a file so you don't have to re-run the same scan twice._  

---

Answer the questions below

1. How many of the first 15000 ports are open on the target?  

```php
nmap -p-15000 10.200.57.200
```

```php
➜  wreath nmap -p 0-15000 -oN nmap/initial.txt 10.200.57.200
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-07-19 04:13 BST
Nmap scan report for 10.200.57.200
Host is up (0.020s latency).
Not shown: 14943 filtered tcp ports (no-response), 53 filtered tcp ports (host-unreach)
PORT      STATE  SERVICE
22/tcp    open   ssh
80/tcp    open   http
443/tcp   open   https
9090/tcp  closed zeus-admin
10000/tcp open   snet-sensor-mgmt

Nmap done: 1 IP address (1 host up) scanned in 49.12 seconds
```

**4**

Perform a service scan on these open ports.  

2. What OS does Nmap think is running?  

```php
nmap -sC -sV -p 22,80,443,9090,10000 -oN nmap/initial-15000-versions.txt 10.200.57.200
```

```php
➜  wreath nmap -sC -sV -p 22,80,443,9090,10000 -oN nmap/initial-15000-versions.txt 10.200.57.200
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-07-19 04:18 BST
Nmap scan report for 10.200.57.200
Host is up (0.019s latency).

PORT      STATE  SERVICE    VERSION
22/tcp    open   ssh        OpenSSH 8.0 (protocol 2.0)
| ssh-hostkey: 
|   3072 9c:1b:d4:b4:05:4d:88:99:ce:09:1f:c1:15:6a:d4:7e (RSA)
|   256 93:55:b4:d9:8b:70:ae:8e:95:0d:c2:b6:d2:03:89:a4 (ECDSA)
|_  256 f0:61:5a:55:34:9b:b7:b8:3a:46:ca:7d:9f:dc:fa:12 (ED25519)
80/tcp    open   http       Apache httpd 2.4.37 ((centos) OpenSSL/1.1.1c)
|_http-server-header: Apache/2.4.37 (centos) OpenSSL/1.1.1c
|_http-title: Did not follow redirect to https://thomaswreath.thm
443/tcp   open   ssl/http   Apache httpd 2.4.37 ((centos) OpenSSL/1.1.1c)
|_ssl-date: TLS randomness does not represent time
|_http-server-header: Apache/2.4.37 (centos) OpenSSL/1.1.1c
|_http-title: Thomas Wreath | Developer
| http-methods: 
|_  Potentially risky methods: TRACE
| ssl-cert: Subject: commonName=thomaswreath.thm/organizationName=Thomas Wreath Development/stateOrProvinceName=East Riding Yorkshire/countryName=GB
| Not valid before: 2024-07-19T03:08:29
|_Not valid after:  2025-07-19T03:08:29
| tls-alpn: 
|_  http/1.1
9090/tcp  closed zeus-admin
10000/tcp open   http       MiniServ 1.890 (Webmin httpd)
|_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 43.83 seconds

```

**CentOS**

Okay, we know what we're dealing with.

3. Open the IP in your browser -- what site does the server try to redirect you to?

**https://thomaswreath.thm/**

![[Pasted image 20240719042230.png]]

You will have noticed that the site failed to resolve. Looks like Thomas forgot to set up the DNS!

4. Add it to your hosts file manually. This can be accomplished by editing the `/etc/hosts` file on Linux/MacOS, or `C:\Windows\System32\drivers\etc\hosts` on Windows, to include the IP address, followed by a tab, then the domain name. **Note:** this _must_ be done as root/Administrator.

It should look something like this when done, although the _IP address and domain name will be different_:

`10.10.10.10 example.thm`

5. Reload the webpage -- it should now resolve, but it will give you a different error related to the TLS certificate. This occurs because the box is not really connected to the internet and so cannot have a signed TLS certificate. In this instance it is safe to click "Advanced" -> "Accept Risk"; however, you should never do this in the real world.  

In real life we would perform a "footprinting" phase of the engagement at this point. This essentially involves finding as much public information about the target as possible and noting it down. You never know what could prove useful!  

6. Read through the text on the page. What is Thomas' mobile phone number?

**+447821548812**

![[Pasted image 20240719042509.png]]

Let's have a look at the highest open port.  

7. Look back at your service scan results: what server version does Nmap detect as running here?

**MiniServ 1.890 (Webmin httpd)**

Put your answer to the last question into Google.

It appears that this service is vulnerable to an unauthenticated remote code execution exploit!

8. What is the CVE number for this exploit?

 [CVE-2019-15107](https://github.com/squid22/Webmin_CVE-2019-15107)

![[Pasted image 20240719042827.png]]

We have everything we need to break into this machine, so let's get going!

--- 

**Completed:** 2024-07-19