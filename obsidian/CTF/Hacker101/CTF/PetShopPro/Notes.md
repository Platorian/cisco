**Flags 3**

Analysis:
- Has a vulnerable checkout
- Found `/login` page with gobuster
- Vulnerable login page that has info exposure that tells the user if they have a correct username or not, this allows me to enumerate the login page.
- Doesn't have password throttling which makes it vulnerable to brute-force.

Can modify the price of the items making them free, leaving a minus money total.

![[Pasted image 20240906081038.png]]

Flag1:
`^FLAG^20a1376069a8479632d68d5c46af8c13213902f2b8812203596be9ccb4fc9080$FLAG$`

Gobuster:

```php
gobuster dir -w /usr/share/seclists/SecLists-master/Discovery/Web-Content/common.txt -u https://d9e897eb1cbf2cc8a67adce5f8b5a454.ctf.hacker101.com/
```

![[Pasted image 20240906075351.png]]

After a very long time i get the username `linette`:

![[Pasted image 20240906092834.png]]


Now i brute-force the password. I find the login credentials and find the second flag after login into the app. 

![[Pasted image 20240906100116.png]]

Flag2:
`^FLAG^61a00421e9e6c5076b535c7b296481f9dcdc2308cff2c790c5892fb11340abc1$FLAG$`


Username: linette
Pass: easy

I'll look around the app and hopefully find the last flag. I update the photos and try adding in some java XSS to the description, after looking at the cart i get the final flag:

```java
<script\x20type="text/javascript">javascript:alert(1);</script>
```

![[Pasted image 20240906101344.png]]

Flag3:
`^FLAG^38da0e4262c1690b44317410a1a5587960e32428881df853bcb1bf1f37857af5$FLAG$`

---

**Completed:** _10:20 2024-09-06_

