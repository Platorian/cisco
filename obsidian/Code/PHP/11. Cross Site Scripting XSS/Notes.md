## XSS

**XSS** is when an attacker tries to inject PHP or JavaScript into the website.  

`<script>alert('XSS')</script>`

This would cause a pop up on the server for anyone visiting the page. 

The payload is harmless, but it could be used, for example, to post a link to an attacker controlled malicious website that looks like facebook, asking for the victim to login. This would then be captured by the attacker who can see what the victim is typing, stealing their credentials.

An attacker might also disguise a beef hook url which would inject into the victims browser allowing an attacker to compromise whoever clicks the link.

- User name validation is important. If not checked a malicious user could use an XSS payload as their username, and every comment, or profile visit on the website would include the malicious payload as it displays the users name.

Other things you can do with XSS:
- POST request
- GET request
- Check different database queries
- Steal cookies and send them to an attackers server which can be used for session hijacking. 

**Using php:**

If a user fills in a login form as expected, but then uses `<?php phpmyinfo() ?>` as the password, what will happen?

If we had a test profile page that when you navigated to it it would show all of the sighnup details, including the password. The pass would be left blank but only because it's running the php code. If you inspect the page's source code you should see the ouput of phpmyinfo().

_The password has been commented out._

Now pretend we do the same thing but we do it with JavaScript. What happens now?

If you notice the difference in the two payloads, you might tell that the JavaScript payload has quotes. This is much easier to use to compromise the system.

**Secure server:**

1. Never trust user data
2. Sanitise input `htmlspecialchars` and `htmlentities` 

```html
<div>
<p class='text'> Password: ".htmlspecialchars($row[password])."</p>
</div>
```

- Makes sure whatever data is added does not get run as code on the server.


Function:

```php
<?php
function clean_data($data)
{
	return htmlspeacialchars($data)
}
```

---

_Extra:_

_PHP was originally an abbreviation of Personal Home Page, but it now stands for the recursive acronym PHP: Hypertext Preprocessor._

---

**Completed:** _14:27 2024-09-09_


