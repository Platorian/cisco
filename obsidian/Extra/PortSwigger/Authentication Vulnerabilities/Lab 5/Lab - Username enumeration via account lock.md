This lab is vulnerable to username enumeration. It uses account locking, but this contains a logic flaw. To solve the lab, enumerate a valid username, brute-force this user's password, then access their account page.

- Candidate usernames
- Candidate passwords

---

**Goal:** enumerate a valid username, brute-force this user's password, then access their account page

**Analysis:** The account lockout mechanism only functions when using a correct username. I can use that to enumerate the correct name.

I need to setup burpsuite so that it attempts the username more than one time, then i can get the lockout mechanism to fire indicating it's the correct username. To do this i need to use a `clusterbomb` attack setting the second payload to `Null Payloads`, then adding the required number of retries to the payloads option `Generate` 

- _This will take a long time without burpsuite pro, so now would be a good time to use OWASPZap instead to speed this part up._

Now, i could add an incorrect username every time i want to reset the lockout mechanism, but we can bruteforce the password with a standard sniper attack. 

The password needs to look like this:
`password=test$$` 

With your second payload field marked by the two dollar signs. 

**Solution**
**User:** 
**Pass:** 

