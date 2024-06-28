# Challenge

## Middle letter

Write a function named `mid` that takes a string as its parameter. Your function should extract and return the middle letter. If there is no middle letter, your function should return the empty string.

For example, `mid("abc")` should return `"b"` and `mid("aaaa")` should return `""`.

```python
str = input("Enter word: ")

x = len(str)
y = x // 2

print("Midddle Char is: " + str[y])
```