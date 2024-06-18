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
&lt:script
```

Filtering is almost the same but instead of changing it it just deletes it.
Validation is a predefined allow/disallow list, and lastly sanitization is a combination of all of these options. 

---

Look for anywhere on the site that takes input and test out how it responds.







