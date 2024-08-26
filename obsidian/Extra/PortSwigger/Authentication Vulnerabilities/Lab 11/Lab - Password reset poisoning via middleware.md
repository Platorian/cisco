This lab is vulnerable to password reset poisoning. The user `carlos` will carelessly click on any links in emails that he receives. To solve the lab, log in to Carlos's account. You can log in to your own account using the following credentials: `wiener:peter`. Any emails sent to this account can be read via the email client on the exploit server.

---

**Goal:** Exploit the vulnerability in the password reset functionality, and access Carlos's account. 

**Analysis:** There are three primary requests used to reset the password:
1. Forgot password request
2. Email link to reset password
3. Resetting the password confirmation

I'll store these by sending them to repeater which will create three tabs, each with my separate requests. 

1. The first request asks for the name of the user.
2. The second request sends a temporary `forgot password` token used to reset the password. This is tied to the user account. It then generates the page which allows you to put in the new password.
3. Now allows you to change the password using the `temp-forgot-password-token` and `new-password-1` `new-password-2`

**Question:** _Does the app support the `X-Forwarded-Host:` header?_

For the host i can use the exploit server provided in the lab.

```php
X-Forwarded-Host:<Exploit_Server>
```

- Try sending the request with the header added, if you get a `200 OK` then it's probably vulnerable and accepts the header. I should now have received a new email in the email client provided in the lab.

**Tip:** _The `Origin:` should now be set to the exploit server address._

**Now what happens?**
- Sends a link to Carlos's email that has the link i just generated.
- When Carlos click on the link it will make a entry in the exploit server log.
- Copy the `temp-forgot-password` token.
- Use the token in the second repeater request at the start of the lab.
- Send the request and check the render to see if it's valid.
- Use the token on the third request at both the bottom and top entries of `temp-forgot-password`
- Change password and send the request.
- Login to Carlos's account to complete the lab.

**Token:** Make sure to copy the token correctly if you get an `invalid token` error.

---




