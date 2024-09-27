# Challenge

## Type check

Write a function named `only_ints` that takes two parameters. Your function should return `True` if both parameters are integers, and `False` otherwise.

For example, calling `only_ints(1, 2)` should return `True`, while calling `only_ints("a", 1)` should return `False`.


**Solution**

```python
def only_lists(num, num2):

	result = num == num2
	return result

print(only_lists(1, "a"))
```


2.
```python
def only_lists(num1, num2):
	result = type(int(num1)) == type(int(num2))
	print(type(result))
	print(type(num2))
	if int(num1) == int(num2):
		print("equal")

	return result

print(only_lists(1, "a"))
```

3.
```python
def only_lists(num1, num2):

try:
	result = type(int(num1)) == type(int(num2))
	return result

except:
	result = False
	return result

print(only_lists(1, "a"))
```

4.
```python
def only_ints(num1, num2):

	if type(num1) == int and type(num2) == int:
		return True
	else:
		return False

print(only_ints(1, 2))
```

