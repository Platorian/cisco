This lab's two-factor authentication is vulnerable due to its flawed logic. To solve the lab, access Carlos's account page.

- Your credentials: `wiener:peter`
- Victim's username: `carlos`

You also have access to the email server to receive your 2FA verification code.

---

**Goal:** Exploit 2FA logic flaw to access Carlos's account page

**Analysis:** There is three requests the app makes that are of interest. 
1. Session management is broken allowing me to delete the session cookie but still have access to the webpage. 
2. Depends on client side parameter to perform authentication decisions: allows me to change `verify=username` and request a 2FA code for any user.   

 ![[Pasted image 20240825081814.png]]

3. Allows me to remove the session token and still receive a response from the app, meaning i just need to enumerate the 2FA code, and change the username to carlos, because it doesn't validate the session. 
4. Now i can brute-force the 2FA code with OWASPZap.
5. Make sure to send the second request for carlos to retrieve a 2FA code, or the brute-force will not work.
6. When i get a `302` response i can copy the session token and enter it with dev tools, this should take me to the carlos `my-account` page when navigated to in the url.

Seclists has a numbers payload file for 4 digit numbers, so i can use that:
`/usr/share/seclists/Seclists-master/Fuzzing/4-digits-0000-9999.txt`

_Other issues:_
- Doesn't implement any type of throttling to prevent brute-forcing.
- This exercise requires multi threading, so i can't make a script for it yet. 

_Extra:_ 
- Learn how to use multi threading in python: https://realpython.com/intro-to-python-threading/, https://www.geeksforgeeks.org/multithreading-python-set-1/

---

- This is going to take either burpsuite pro, or the multi-thread brute force script, so i'll have to come back to this as it's taking a lot of time. It took me over an hour to do only 10% of the scan, so it's just not viable like this, even with Zap.

I managed to get the 2FA befor i quit! It had actually got the correct code quite a bit earlier, but i must have missed it. Very happy to complete the room. 

![[Pasted image 20240825103837.png]]
