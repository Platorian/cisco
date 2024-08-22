This lab is subtly vulnerable to username enumeration and password brute-force attacks. It has an account with a predictable username and password, which can be found in the following wordlists:

- Candidate usernames
- Candidate passwords

To solve the lab, enumerate a valid username, brute-force this user's password, then access their account page.

---

**Goal:** enumerate a valid username, brute-force this user's password, then access their account page

_Tip:_ If i had a valid User/Pass i could login and send it to burp compare, then use a test User/Pass, and sent that response to compare to see what differences i can see. 

**Analysis:** The app gives slightly different responses which i can use to enumerate the User/Pass

- Enumerate Username
- Enumerate Password
- Check for different error codes during step one and two

**Solution:** 

I had to grep the error message to find the correct username. Then i could simply run burp intruder against the app with the provided password list.

![[Screenshot_2024-08-22-11-17-36_2560x1440.png]]

Username: alabama
Password: access


