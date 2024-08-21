This lab is vulnerable to username enumeration and password brute-force attacks. It has an account with a predictable username and password, which can be found in the following wordlists:

- [Candidate usernames](https://portswigger.net/web-security/authentication/auth-lab-usernames)
- [Candidate passwords](https://portswigger.net/web-security/authentication/auth-lab-passwords)

To solve the lab, enumerate a valid username, brute-force this user's password, then access their account page.

---

**Goal**: enumerate a valid username, brute-force this user's password, then access their account page

**Analysis:** The application outputs different responses depending on input, so if you have a valid Username the app will then output the error: _Incorrect Password._ This difference in response allows me to enumerate the different entry fields.

Using burp, and the analysis i did earlier i can use the provided User/Pass list to exploit the app. The Username will provide a slightly different response in Length which will indicate i have the correct Name.

- Enumerate Username looking for a change in Length
- Enumerate Password

**Solution:** 
- Username:
- Password: 

