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
- If file is nested: `www.example.com/uploads/../../../../../test&cmd=whoami`

**RFI with PHP** 

RFI is when the web-server is setup to pull in a resource from an outside address. The attacker can manipulate where the server get's the file and imitate the server giving it a malicious file. 

```php
if (str_starts_with($file, 'http')){
	$files[] = "http://localhost:1338/" . substr($file, 5);;
}
```

In the above example the php would check the name of the file and if it starts with `http` then it will add it to the local host address and pull it into a remote end point on the server. 

File: `test.php`

End point: `http://localhost:1338/test.php`

This is where an attacker would have an apache2 server setup ready to deliver the file. 

Including a file from a network resource. 

I think i understand it a littler better. If the PHP code for some reason is coded in a way that an attacker can manipulate it to go out into the network looking for that resource, like in the examples above, the attacker can setup there own server ready to deliver the file to the target. Now we just navigate to the location of the file and we can use the exploit. 

Settings that allow for this RFI: `allow_url_include = ON`
- The default is off so this might only work for certain CTF machines.

Base64 Encode the Payload:

```php
php://filter/convert.base64-encode/resource=../../../../../etc/passwd
```

Where to add it:

`http://example.com/page=<PAYLOAD>`

Decode b64:
```php
echo 'b64' | base64 -d
```

Check to see if include is in the code:

`http://example.com/page=<PAYLOAD>`
- include.php


