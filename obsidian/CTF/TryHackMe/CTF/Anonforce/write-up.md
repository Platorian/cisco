I find some stuff in ftp

melodias:x:1000:1000:anonforce,,,:/home/melodias:/bin/bash

looks like a user as they have a home dir as well.

we look inside melodias dir after trying to copy it for a while. we can view files in ftp with:

```php
get <File> -
```

606083fd33beb1284fc51f411a706af8

![[Pasted image 20240712115513.png]]

we can use these files with **John**

The backup.pgp file is locked, so let’s try to use gpg2john with the private.asc file. We’ll save it to a file called “hash” and then use john with rockyou to crack it.

```php
gpg2john private.asc > hash 
```

```php
john --wordlist=/usr/share/wordlists/rockyou.txt hash
```

xbox360          (anonforce)

![[Pasted image 20240712120059.png]]

```php
john --show hash
```

![[Pasted image 20240712120220.png]]

Now we can import that key using the following command. When prompted for the password, we enter the one found by john. 

```php
gpg --import private.asc
```

Now we can decrypt the backup.pgp file using the following command.

```php
gpg --decrypt backup.pgp
```

![[Pasted image 20240712120612.png]]

I use unshadow and john:

```php
unshadow passwd.txt shadow.txt > unshad.txt 
```

```php
john --wordlist=/usr/share/wordlists/rockyou.txt unshad.txt
```


![[Pasted image 20240712121301.png]]

root: hikari 

![[Pasted image 20240712121729.png]]

