# Challenge

## Palindrome

A string is a palindrome when it is the same when read backwards.

For example, the string `"bob"` is a palindrome. So is `"abba"`. But the string `"abcd"` is not a palindrome, because `"abcd" != "dcba"`.

Write a function named `palindrome` that takes a single string as its parameter. Your function should return `True` if the string is a palindrome, and `False` otherwise.

---

```python
def palindrome(word):
    reverse = word[::-1]
    print(word)
    print(reverse)
    if word == reverse:
        return "This is a palindrome"
    else:
        return "Not a palindrome"


print(palindrome("bob"))
```

**Solution**

```python
def palindrome(word):
    reverse = word[::-1]
    if word == reverse:
        return True
    else:
        return False

print(palindrome("bob"))
```

