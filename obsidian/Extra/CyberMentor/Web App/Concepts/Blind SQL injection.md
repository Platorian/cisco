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

