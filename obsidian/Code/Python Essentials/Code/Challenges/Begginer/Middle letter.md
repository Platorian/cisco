# Challenge

## Middle letter

Write a function named `mid` that takes a string as its parameter. Your function should extract and return the middle letter. If there is no middle letter, your function should return the empty string.

For example, `mid("abc")` should return `"b"` and `mid("aaaa")` should return `""`.

1.
```python
str = input("Enter word: ")

x = len(str)
y = x // 2

print("Midddle Char is: " + str[y])
```

2.
```python
def mid(word):
    print(word)
    
    a = len(word)
    print(a)
    
    b = a // 2
    print(b)
    print(word[b])
    #word = word // 2    
    print(word)

mid("terst")
```

3.
```python
def mid(word):
    
    length = len(word) % 2
    print(length)
    if length == 0:
        print("equal")
    
    else:
        mid = len(word) // 2
        print(word[mid])
        
mid("aaaa")
```

**Final**
```python
def mid(word):
    
    length = len(word) % 2
    
    if length == 0:
        return ""
    
    else:
        mid = len(word) // 2
        return word[mid]
        
print(mid("abc"))
```

