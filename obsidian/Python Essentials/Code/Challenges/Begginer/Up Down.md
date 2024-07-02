# Challenge

## Up and down

Define a function named `up_down` that takes a single number as its parameter. Your function return a tuple containing two numbers; the first should be one lower than the parameter, and the second should be one higher.

For example, calling `up_down(5)` should return `(4, 6)`.

---

```python
def updown(x):
    x = int(input("Enter num: ")) # Testing
    y = x
    x += 1
    y -= 1
    print(x, y)
    
    return "UpDown"

updown(2)
```

_Your function should return a tuple containing two numbers; the first should be one lower than the parameter, and the second should be one higher._

```python
def up_down(number):
    down = number - 1
    up = down + 2
    return (down, up)

print(up_down(2))
```

