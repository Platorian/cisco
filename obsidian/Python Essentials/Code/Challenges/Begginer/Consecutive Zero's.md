
# Challenge

## Consecutive zeros

The goal of this challenge is to analyze a binary string consisting of only zeros and ones. Your code should find the biggest number of consecutive zeros in the string. For example, given the string:

```
"1001101000110"
```

The biggest number of consecutive zeros is 3.

Define a function named `consecutive_zeros` that takes a single parameter, which is the string of zeros and ones. Your function should return the number described above.

---

1. 
```python
def consecutive_zeros(num):
    print(num)
    total = 0
    for i in num:
        if '0' in i:
            total += 1
        
    print(total)


consecutive_zeros("1001101000110")
```

2. 
```python
def consecutive_zeros(num):
    print(num)
    arg1 = 0
    total = 0
    for i in num:
        if '0' in i:
            arg1 += 1
            total += arg1
        elif '1' in i:
            arg1 = 0
    print(total)
        
consecutive_zeros("1001101000110")
```

_I can't think how to reset the counter and then continue to count_

_Bit closer_

3. 
```python
def consecutive_zeros(num):
    num = list(num)
    print(num)
    maximum = 0   
    total = 0
    for i in num:
        if '0' in i:
            total += 1
        elif '1' in i:
            maximum = total
            total = 0
            

consecutive_zeros("1001101000110")
```


Solution. 

```python
def consecutive_zeros(num):
    result = 0   
    total = 0
    for i in num:
        if i == '0':
            total += 1
        else:
            total = 0
        result = max(result, total)
    return result
print(consecutive_zeros("1001101000110"))
```

