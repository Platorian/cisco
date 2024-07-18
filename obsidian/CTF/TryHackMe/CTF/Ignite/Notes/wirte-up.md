
Gobuster reveals /0 extension and i find a page that has the login details:

![[Pasted image 20240712053526.png]]

I check the CMS version and find it is vulnerable to remote code execution. I setup my apache server in my rev shell directory for transfer, and then wget the file with the RCE python exploit. After navigating to the dir with my exploit i get a shell.

RCE:
https://github.com/davcwikla/Fuel-CMS-1.4-exploit/blob/main/README.md

I get the database of the passwords file from the fuel CMS website.

cat fuel/application/config/database.php

![[Pasted image 20240712064049.png]]

root:
mememe


![[Pasted image 20240712064450.png]]

flag.txt:
6470e394cbf6dab6a91682cc8585059b

root.txt:
b9bbcb33e11b80be759c4e844862482d

![[Pasted image 20240712064722.png]]

