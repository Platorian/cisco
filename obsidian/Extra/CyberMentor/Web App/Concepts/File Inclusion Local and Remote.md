**LFI with JSP**

JSP cookie:`JSESSIONID`

href links are a get request to a specific resource or server. You can test the sever by just adding a quote: `page='`, this should return a server error, or even a stack trace, which is when the JSP crashes in the backend returning the details of the crash. 

An error could occur where the server tells you that it can't find the file, or whatever the parameter you added: `page=test`
`Error: cant find test.jsp`

The server could have updated something and then forgot to remove the file. This could be combined with path traversal for instance to find the file which could have sensitive dtata included.

JSP is executed, so it could be used to load malicious code an execute it on the server.

File inclusion mechanism is how other code outside the application can be brought in and executed. The file has to be present on the remote system in order to attack it.

1. If you have a file upload.
2. Introduce malicious code.
3. With LFI we can include the code and get RCE.

**LFI with PHP**

Always look for SQLI, if the server returns an error it's probably vulnerable. Inject on the name because the password is usually hashed.

Information on functionality: `config.php`

Include function will read and include the file in PHP context.

```php
<?php include('note'); ?>
```

- Any PHP code inside `note` will be executed.

EAR -> Execution After Redirect
- When the app continues to run even after the user makes an error. This could  expose data.

Let's say that a user added PHP to the note file then the PHP would be executed.

note.md

```php
<?php system('whoami'); ?>
```

So simply put, if the dev has told the app to include any files that an attacker can modify, the attacker will be able to get RCE. The dev could have also added other security features like sanitize the user input.

```php
<?php system($_GET['cmd']); ?>
```

- Usage: `www.example.com/uploads/test.php`
- Example:  `www.example.com/uploads/test&cmd=whoami`


**RFI with PHP** 



