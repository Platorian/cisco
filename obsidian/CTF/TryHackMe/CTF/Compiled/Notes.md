i run file and discover its an ELF type file. 

After running the file it asks me for a password

I search with strings for the Password line that the program displayed to look for further information.

```php
strings Compiled-1688545393558.Compiled | grep -C 3 Pass
```

![[IMG/Pasted image 20240926072112.png]]

`DoYouEven%sCTF`

I decide to download and open the program in ghidra. I have no idea how to use it so i'll just mess around and try to learn something while i complete this task.

![[IMG/Pasted image 20240926075729.png]]

Let’s breakdown what this code does:

- Ask for password, receive it in format “DoYouEven%sCTF”, then store in variable ‘local_28’
- Compare the password string with “__dso_handle”, then store the result in ‘iVar1’
- If password strings equal to “__dso_handle”, it will print “Try again!” and end the program
- Compare the password string with “_init”, then store the result in ‘iVar1’
- If password strings equal to “_init”, means the password is correct.

This means the correct password is a string which makes ‘local_28’ has value ‘_init’. Knowing this, the last problem is how the line receives input. `‘__isoc99_scanf(“DoYouEven%sCTF”,local_28);’` 

Let’s first see how it works. It captures everything between
“DoYouEven” and the first occurrence of “CTF,” including any characters that are not whitespace.

eg:
- Password: DoYouEven_CTF tttt  
    input: _CTF
- Password: DoYouEvenanytext  
    input: anytext
- Password: DoYouEven-CTF t  
    input: -CTF

Therefore, the solution is quite simple in order to make local_28 equal to ‘_init’:

- DoYouEven_init

![[IMG/Pasted image 20240926080553.png]]

---
**Completed:** _08:06 2024-09-26_

