## POST SQL Injection

**POST** refers to something like a login form, or comment on a web-page. Usually something where you're typing information that either gets stored or queried by the database.

**Example of a validate email mechanism:**

```php
function login($POST)
{
	$Error = "";

	// Validate email
	if(!filter_var($POST['email'],FILTER_VALIDATE_EMAIL))
	{
		$Error = "Wrong email or password.";
	}
}
```

- Check to see if it's a valid email: `FILTER_VALIDATE_EMAIL` 

```html
<br>
<input type="email" name="email" placeholder="Email">
</br>
```

- Here a hacker could use dev tools to change `type=email` to `type=text` , i haven't come across this yet myself, but  you would probably either edit the value, or use console to set the type.

**Add slashes function:**

```php
<?php

if($Error == "")
{
	$email = addslashes($POST['email']);
	$password = addslashes($POST['password']);
}
```

- This adds slashes `\` to special characters so that the app ignores them, similar to scripting.

You can see how it functions with a simple piece of PHP:

```php
<?php
echo addslashes("john's name's");
// MySQLI Database
echo mysql_real_escape_string("john's name's");
```

_Output:_ `john\'s name\'s`

**SQL:**

```php
$query = "select * from users where email = '$email' && password = '$password'"
```

- This doesn't stop a hacker from using a comment to bypass the need for a password.  `select * from users where email = 'admin'--`
- You could use and `OR` statement to to break the logic and get the same effect with something like this: `select * from users where email = '$email' OR 1=1`. Logically this is a true statement which would allow the hacker entry into the web-app.

Always use quotes around your queries `'$email'` because it forces the hacker to also add quotes. When the hacker does use quotes, hopefully they will be fixed by the `addslashes`.






