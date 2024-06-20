### XSS

Our java alert from last time:
```java
<script>alert("XSS")</script>
```

Getting around sanitization we can use a bit wise operator
```java
<<a^ascript>alert("XSS")</script>
```

- `a^a`
- `a&a`
- `a|a`

![[Pasted image 20240620182057.png]]
This will trick the sanitation into removing the operator but leaving our XSS script.

At this point you could try to interact with the admin account:
- Stealing cookies
- Inject a Beef hook
- redirect to malicious site
- keylogging

---

### Broken Access Control

Are you able to change id in anyway?

Look inside developer tools **Session Storage** for any id's and try changing them.

If you have the ability to upload files, check which type of files you can upload. Sometimes you can click upload and it will give you the available options but you may be able to upload more than it states. A way to find out is to: 
- Access Dev Tools
- Go to the debugger section 
- Click pretty
- ctl+f and search for the file type it said it would allow, or the allowedMimeType

If you are allowed to upload xml you can upload a malicious file:

```python
<?xml version="1.0" encoding="ISO-8859-1"?>
	<!DOCTYPE foo [
		<!ELEMENT foo ANY >
		<!ENTITY xxe SYSTEM "file:////etc/passwd" >]><foo>&xxe;</foo>
```

https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/XXE%20Injection/README.md

---

### SQL Injection

Common SQL verbs

| Command    | Action                                      |
| ---------- | ------------------------------------------- |
| SELECT     | Retrieves data from a table                 |
| INSERT     | Adds data to a table                        |
| DELETE     | Removes data from a table                   |
| UPDATE     | Modifies data in atable                     |
| DROP       | Deletes a table                             |
| UNION      | Combines data from multiple queries         |
| WHERE      | Filters records based on specific condition |
| AND/OR/NOT | Filter records based on multiple conditions |
| ORDER BY   | Sorts records in ascending/descending order |

![[Pasted image 20240620190123.png]]

![[Pasted image 20240620190418.png]]

So if we type an email of test into the login page of a website, it might look something like this in SQL:

**SELECT * FROM Users WHERE email="test"**;

_Don't forget that different databases have different syntax, so you might have to determine which one it is first_

You could try both `'test` and `test'` to try to break it and find error codes that could assist you.

Of course an easy one is `OR 1=1` and ending on a comment:
```
' OR 1=1; --
```

Inside SQL that would look like this:

**SELECT * FROM Users WHERE email="test" OR 1=1 -- ';**

This would log us into the database as admin.

When using burp to brute force login pages, make sure to use the grep feature and add the error message, for example: Invalid email or Password!



