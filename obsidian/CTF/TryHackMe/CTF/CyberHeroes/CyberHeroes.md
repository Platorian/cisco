#### Info
Want to be a part of the elite club of CyberHeroes? Prove your merit by finding a way to log in!

Uncover the flag!

---
# Nmap

80/tcp open  http    Apache httpd 2.4.48 ((Ubuntu))

![[Pasted image 20240715075003.png]]

- Let's test out sqlmap.

- The logins seems to be secured against burp somehow as i can't get a request from it. A java script runs and nothing happens apart from script alert message.

- I take a look in dev tools

![[Pasted image 20240715080123.png]]

```php
if (a.value=="h3ck3rBoi" & b.value==RevereString("54321@terceSrepuS"))
```

- The pass doesn't work but i quickly notice the code is reversing the string so i'll look up if bash can do that in the terminal quickly.
- Linux has a function called rev which you can echo pipe the password to.

```php
echo 54321@terceSrepuS | rev
```

==SuperSecret@12345==

![[Pasted image 20240715080858.png]]

==flag{edb0be532c540b1a150c3a7e85d2466e}==

Cool machine.


