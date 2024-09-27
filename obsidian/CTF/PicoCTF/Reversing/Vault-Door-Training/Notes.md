```php
echo flagCTF{$(cat VaultDoorTraining.java | awk '/password/ {print $2}' | awk -F '.' '{print $2}' |  awk -F '"' '{print $2}' | sed '/^$/d')}
```

I write a script to auto print out the flag in its correct format.

- This can almost defiantly be done better, but i'm not very practiced with sed and awk.

![[IMG/Pasted image 20240926093710.png]]

- I didn't realise it but you can just add the command output i want to see inside a variable. I thought i could use `$_` to hold it but i must have forgot something, maybe i had it in the wrong area.

