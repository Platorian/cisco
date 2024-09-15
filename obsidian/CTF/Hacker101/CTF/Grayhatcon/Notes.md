Goal: Hacker has broken into the sytem and left a listing file with user/pass of the web-app:

1. Hack into the website
2. Delete the file

---

I start by running a gobuster scan to find hidden directories:
`/robots`
![[Pasted image 20240913064226.png]]
s3cr3t-4dm1n/
403 forbidden

I do gobuster on the secret admin dir:
`/.htaccess`

```php
Order Deny,Allow
Deny from all
Allow from 8.8.8.8
Allow from 8.8.4.4
```
- It downloaded the file when i accessed the folder.

I try adding an `X-Forwarded-For: 8.8.4.4` to the request to see if alloes me to access the secret, but it doesn't work. 

| Name        | Hash                             |
| ----------- | -------------------------------- |
| s3cr3t4dm1n | 5c68aa474a22d4d68df0e9755fb23092 |
| test123     | 90ba9ef02596a6931558bf56c97b056c |

For some reason curl was having problems, i did try using http 1.1 but it didn't fix it, but i think that could be the issue. Instead i downlaoded httpie so i could use the http program:

```php
https -v GET https://aba57af67ebf06c8b2695efd584d53a1.ctf.hacker101.com/s3cr3t-4dm1n X-Forwarded-For:8.8.8.8
```

This still gave me a 404 forbidden error?

Server: openresty/1.25.3.2

nginx/1.15.8

/3.3.7/js/bootstrap.min.js

The owner of the auction is an account called hunter2, so i try to reset the password. In burp it shows a user hash, maybe it's revealing the hash pass for hunter2?

cf505baebbaf25a0a4c63eb93331eb36

