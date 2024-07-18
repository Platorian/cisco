- Strings on the file reveals it's UPX compressed. 
- I run file to reveal it's a 64-bit executable. 
- upx to decompress

```php
upx -d <FILE>
```

![[Pasted image 20240718113222.png]]

- Running file again reveals the section header.

```php
file out  
out: ELF 64-bit LSB executable, x86-64, version 1 (GNU/Linux), statically linked, BuildID[sha1]=36bf0fdfd791fee2c1cc45dff9ddb2a4f48f6d53, for GNU/Linux 3.2.0, not stripped
```

After using the file i get an error message so i pipe the file to less and search for the comment.

![[Pasted image 20240718113956.png]]

7069636f4354467b5539585f556e5034636b314e365f42316e34526933535f39343130343638327d

I put the code into cyberchef and it returns the flag converted from Hex:

![[Pasted image 20240718114050.png]]

==picoCTF{U9X_UnP4ck1N6_B1n4Ri3S_94104682}==

