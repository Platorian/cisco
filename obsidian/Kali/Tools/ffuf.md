Basic
```
ffuf -w /usr/share/wordlist/dirbuster/directory-list-2.3-medium.txt:FUZZ -u <Target>/FUZZ 
```

Recursive
```
ffuf -w /usr/share/wordlist/dirbuster/directory-list-2.3-medium.txt:FUZZ -u <Target>/FUZZ -recursion 
```

Can specify depth
```
ffuf -w /usr/share/wordlist/dirbuster/directory-list-2.3-medium.txt:FUZZ -u <Target>/FUZZ -recursion-depth 2 
```

Filter status codes
```
ffuf -w /usr/share/wordlist/dirbuster/directory-list-2.3-medium.txt:FUZZ -u <Target>/FUZZ -recursion -fc 404
```

