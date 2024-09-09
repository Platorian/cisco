## Information disclosure

The user shouldn't be provided with any extra information that may assist them in a brute-force attack:
`Error: Incorrect Password`

You should always use ambiguous messages like the following:
`Error: Incorrect Username or Password`

This way you don't allow a malicious actor to determine if a user exists on the system, which would let them brute-force the password.

Example of a vulnerable email login:

```php
// Validate Email
if(!filter_var($POST['email'], FILTER_VALIDATE_EMAIL))
{
	$Error = "Wrong Email"
}
```

Would need to be changed to:

`$Error = "Wrong Email or Password"`

---

You would also want to create a class and functions as we did previously. This as we have seen adds security and easy maintenance of the code in case anything goes wrong.

PHP example of `get user` code.

```php
// Get User
$query = "select * from users where email = '$email' && password = '$password'"
$resukt = db_read($query)
```

It's quite easy to see how SQL Injection works from this view, which you don't usually see as a hacker.
`select * from users where email = 'admin'--`

Something like this would break the app, and allow me to log in as administrator, the `'--` finishes the statement and results in not needing a password, but it depends on sanitization of user input.  






