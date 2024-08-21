This lab is vulnerable to username enumeration using its response times. To solve the lab, enumerate a valid username, brute-force this user's password, then access their account page.

- Your credentials: `wiener:peter`
- Candidate usernames
- Candidate passwords

---

**Goal:** enumerate a valid username, brute-force this user's password, then access their account page

**Analysis:** Here i can try using a correct Username, recording the response time, and then checking that against a test Username, then comparing the difference. The response time is in the bottom right of burpsuite.

**Incorrect login attempts:** I can bypass this, if it's using a weak locking mechanism, by adding a `X-Forwarded-For:` header. This is the standard header for identifying IPs. If it works i can change my IP so it accepts the request like so:

- X-Forwarded-For: 1
- X-Forwarded-For: 2
- X-Forwarded-For: 3

This allows me two attempts to Login, and then it locks the User out for 30mins.

Sometimes the app will check to see if the Username is valid, and if it is, it will then check the password, and finally provide a response. I can check to see if the response is longer, by entering a longer Password. 

This app is giving a longer response every time i increase the Password length.

I can now try to change the Username to a fake test name to see if the app changes response time. If it now responds quickly, then the reason is because it's not checking the Password anymore as i entered an invalid Username. 

**Valid Username:** Checks the Password
**Invalid Username:** Does **NOT** check the password

This vulnerability allows me to enumerate the usernames on the application.

**Solution:** 

- Add valid username in burp repeater
- Add provided Usernames to payloads 
- Cycle through the `X-Forwarded-For` header so that the account doesn't get locked out
- Add number list as second payload option for the header
- Start pitchfork attack
- In columns add in `Response Recieved` and `Response Completed`
- Look for a longer response so that we know it is checking the Password 

_Tip_ Here i could record the password response from earlier when doing the above instructions, and that way i have an idea of what the response time should be. 

- Once found i can enumerate the Password

I now just need to modify the request by adding the correct Username, and then i can change the payload options to use the provided Password list to complete the task. 

If the Password is correct it should give me a redirect status code `302` as it tries to take me to the `my account` page.

 Username:
 Password:
 
_May need to do it on repeater so that i can add the header and change the IP_

