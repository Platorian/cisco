# Challenge

## Capital indexes

Write a function named `capital_indexes`. The function takes a single parameter, which is a string. Your function should return a list of all the indexes in the string that have capital letters.

For example, calling `capital_indexes("HeLlO")` should return the list `[0, 2, 4]`.

```python
def capital_indexes(str):
    str = "HeLlO"
    final = []
    ignore = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    print("The original string is : " + str)
    
    for x in range(0, len(str)):
        if str[x] in ignore:
            final.append(x)
    print(f"Uppercase elements indices: {final}")

capital_indexes(str)
```

Required  solution to pass the challenge:

```python
def capital_indexes(str):
    #str = "HeLlO"
    final = []
    ignore = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    for x in range(0, len(str)):
        if str[x] in ignore:
            final.append(x)
    return final

print(capital_indexes("HeLlO"))
```

Using re module:

```python
import re

# initializing string
test_str = 'GeeKsFoRGEEks'

# printing original string
print("The original string is : " + str(test_str))

# Finding indices of uppercase characters using re.finditer
res = [match.start() for match in re.finditer(r'[A-Z]', test_str)]

# printing result 
print("Uppercase elements indices : " + str(res))
#This code is contributed by Vinay Pinjala.

```

