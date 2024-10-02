This room is designed for users to get familiar with the Bolt CMS and how it can be exploited using Authenticated Remote Code Execution.

---

Adding the IP to a custom bash variable:

```php
export IP=10.10.44.127 
```

Answer the questions below

What port number has a web server with a CMS running?  

```php
nmap -sV -sC -p- $IP
```

**A:** 8000

What is the username we can find in the CMS?  

**A:** bolt

What is the password we can find for the username?  

**A:** boltadmin123 
- found at `http://10.10.44.127:8000/entry/message-for-it-department`

What version of the CMS is installed on the server? (Ex: Name 1.1.1)  

- Login 

![[IMG/Pasted image 20241002091426.png]]

`/extensions`

![[IMG/Pasted image 20241002091813.png]]

**A:** bolt 3.7.1

There's an exploit for a previous version of this CMS, which allows authenticated RCE. Find it on Exploit DB. What's its EDB-ID?

![[IMG/Pasted image 20241002092017.png]]

**A:** 48296

Metasploit recently added an exploit module for this vulnerability. What's the full path for this exploit? (Ex: exploit/....)

```php
msfconsole
```

```php
search bolt
```

**A:** exploit/unix/webapp/bolt_authenticated_rce

> Note: If you can't find the exploit module its most likely because your metasploit isn't updated. Run `apt update` then `apt install metasploit-framework`

Set the **LHOST, LPORT, RHOST, USERNAME, PASSWORD** in msfconsole before running the exploit  

Look for flag.txt inside the machine.

**A:** 
cat /home/flag.txt
`THM{wh0_d035nt_l0ve5_b0l7_r1gh7?}`

Because i have done a lot of CTFs now i knew were to look, but i could have narrowed the search and tried to find it by name, for example:

```php
find / -type f -name 'flag.txt' 2>/dev/null
```

- `/` is the root path to start the scan from
- `-type f` search for file (`d` for directory)
- `-name 'flag.txt'` file name _flag.txt_. we can use wildcard as well, e.g. ‘*flag*’
- `2>/dev/null` this will produce a cleaner output as it will discard errors, such as permission errors.

---

**Completed:** _09:33 2024-10-02_



