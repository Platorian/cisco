```php
#!/usr/bin/python3

encoded_flag = open("enc").read()
flag = ""
for i in range(0, len(encoded_flag)):
    character1 = chr((ord(encoded_flag[i]) >> 8))
    character2 = chr(encoded_flag[i].encode('utf-16be')[-1])
    flag += character1
    flag += character2

print("Flag: " + flag)
```

I cat the flag and get UTF encoded text which i decode with a python script.

- The description provides me with the details to decode 

Cyberchef also gets it right:

![[IMG/Pasted image 20240926090349.png]]

