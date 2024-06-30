# Challenge

## Adding and removing dots

Write a function named `add_dots` that takes a string and adds `"."` in between each letter. For example, calling `add_dots("test")` should return the string `"t.e.s.t"`.

Then, below the `add_dots` function, write another function named `remove_dots` that removes all dots from a string. For example, calling `remove_dots("t.e.s.t")` should return `"test"`.

If both functions are correct, calling `remove_dots(add_dots(string))` should return back the original `string` for any string.

(You may assume that the input to `add_dots` does not itself contain any dots.)

**Add**
```python
def add_dots(word):

	new_string = ".".join(word)
	print(new_string)

add_dots("hello")
```

**Remove**
```python
def remove_dots(word):

	new_string2 = word.replace(".", "")
	print(new_string2)

remove_dots("h.e.l.l.o")
```

**Both**
```python
def add_dots(word):

	new_string = ".".join(word)
	print(new_string)

add_dots("hello")

def remove_dots(word):

	new_string2 = word.replace(".", "")
	print(new_string2)

remove_dots("h.e.l.l.o")
```

