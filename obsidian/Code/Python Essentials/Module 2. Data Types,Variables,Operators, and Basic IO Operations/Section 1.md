The word _**print**_ that you can see here is a **function name**. That doesn't mean that wherever the word appears it is always a function name. The meaning of the word comes from the context in which the word has been used.

```python
print("Hello World!")
```

You've probably encountered the term function many times before, during math classes. You can probably also list several names of mathematical functions, like sine or log.

Python functions, however, are more flexible, and can contain more content than their mathematical siblings.

A function (in this context) is a separate part of the computer code able to:

- **cause some effect** (e.g., send text to the terminal, create a file, draw an image, play a sound, etc.); this is something completely unheard of in the world of mathematics;
- **evaluate a value** (e.g., the square root of a value or the length of a given text) and **return it as the function's result**; this is what makes Python functions the relatives of mathematical concepts.

Mathematical functions usually take one argument. For example, sin(x) takes an x, which is the measure of an angle.

Python functions, on the other hand, are more versatile. Depending on the individual needs, they may accept any number of arguments ‒ as many as necessary to perform their tasks. Note: When we said _any number_, that includes zero ‒ some Python functions don't need any argument.

The only argument delivered to the `print()` function in this example is a **string**:

```python
print("Hello World!")
```

As you can see, the **string is delimited with quotes** ‒ in fact, the quotes make the string ‒ they cut out a part of the code and assign a different meaning to it.

Almost anything you put inside the quotes will be taken literally, not as code, but as **data**.

So far, you have learned about two important parts of the code: the function and the string. We've talked about them in terms of syntax, but now it's time to discuss them in terms of semantics.

---

What happens when Python encounters an invocation like this one below?

```python
function_name(argument)
```

- First, Python checks if the name specified is **legal** (it browses its internal data in order to find an existing function of the name; if this search fails, Python aborts the code)
- second, Python checks if the function's requirements for the number of arguments **allows you to invoke** the function in this way (e.g., if a specific function demands exactly two arguments, any invocation delivering only one argument will be considered erroneous, and will abort the code's execution)
- third, Python **leaves your code for a moment** and jumps into the function you want to invoke; of course, it takes your argument(s) too and passes it/them to the function;
- fourth, the function **executes its code**, causes the desired effect (if any), evaluates the desired result(s) (if any) and finishes its task;
- finally, Python **returns to your code** (to the place just after the invocation) and resumes its execution.

**1. What effect does the** print() function cause?

The effect is very useful and very spectacular. The function:

- takes its arguments (it may accept more than one argument and may also accept less than one argument)
- converts them into human-readable form if needed (as you may suspect, strings don't require this action, as the string is already readable)
- and **sends the resulting data to the output device** (usually the console); in other words, anything you put into the print() function will appear on your screen.

**2. What arguments does** print() **expect?**

Any. print() is able to operate with virtually all types of data offered by Python. Strings, numbers, characters, logical values, objects ‒ any of these may be successfully passed to print().

```python
print("The itsy bitsy spider climbed up the waterspout.")
print("Down came the rain and washed the spider out.")
```

This is a good opportunity to make some observations:

- the program **invokes the print() function twice**, and you can see two separate lines in the console ‒ this means that print() begins its output from a new line each time it starts its execution; you can change this behavior, but you can also use it to your advantage;
- each print() invocation contains a different string, as its argument, and the console content reflects it ‒ this means that **the instructions in the code are executed in the same order** in which they have been placed in the source file; no subsequent instruction is executed until the previous one is completed (there are some exceptions to this rule, but you can ignore them for now.)

The empty print() invocation is not as empty as you may have expected ‒ it does output an empty line, or (this interpretation is also correct) it outputs a newline.

```python
print("The itsy bitsy spider\nclimbed up the waterspout.")
print()
print("Down came the rain\nand washed the spider out.")
```

Interestingly, while **you can see two characters, Python sees one.**

The backslash (`\`) has a very special meaning when used inside strings ‒ this is called **the escape character**.

The word _escape_ should be understood specifically ‒ it means that the series of characters in the string escapes for the moment (a very short moment) to introduce a special inclusion.

In other words, the backslash doesn't mean anything in itself, but is only a kind of announcement, that the next character after the backslash has a different meaning too.

The letter `n` placed after the backslash comes from the word _newline_.

Both the backslash and the _n_ form a special symbol named **a newline character**, which urges the console to start a **new output line**.

f you want to put just one backslash inside a string, don't forget its escaping nature ‒ you have to double it. For example, an invocation like this will cause an error:

```python
print("\")
```

While this wont:

```python
print("\\")
```

---

End and Sep

```python
print("Programming","Essentials","in", sep="***", end="...")
print("Python")
```

```output
Programming***Essentials***in...Python
```

> Minimize the number of `print()` function invocations by inserting the `\n` sequence into the strings;

```python
print("    *\n   * *\n  *   *\n *     *")



print("***   ***")
print("  *   *")
print("  *   *")
print("  *****")
```

> duplicate the arrow, placing both arrows side by side; note: a string may be multiplied by using the following trick: `"string" * 2` will produce `"stringstring"` (we'll tell you more about it soon)

```python
print("    *" * 2)
print("   * *" * 2)
print("  *   *" * 2)
print(" *     *" * 2)
print("***   ***" * 2)
print("  *   *" * 2)
print("  *   *" * 2)
print("  *****" * 2)
```

---

SECTION SUMMARY

1. The `print()` function is a **built-in** function. It prints/outputs a specified message to the screen/console window.

2. Built-in functions, contrary to user-defined functions, are always available and don't have to be imported. Python 3.8 comes with 69 built-in functions. You can find their full list provided in alphabetical order in the [Python Standard Library](https://docs.python.org/3/library/functions.html).

3. To call a function (this process is known as **function invocation** or **function call**), you need to use the function name followed by parentheses. You can pass arguments into a function by placing them inside the parentheses. You must separate arguments with a comma, e.g., `print("Hello,", "world!")`. An "empty" `print()` function outputs an empty line to the screen.

4. Python strings are delimited with **quotes**, e.g., `"I am a string"` (double quotes), or `'I am a string, too'` (single quotes).

5. Computer programs are collections of **instructions**. An instruction is a command to perform a specific task when executed, e.g., to print a certain message to the screen.

6. In Python strings the **backslash** (`\`) is a special character which announces that the next character has a different meaning, e.g., `\n` (the **newline character**) starts a new output line.

7. **Positional arguments** are the ones whose meaning is dictated by their position, e.g., the second argument is outputted after the first, the third is outputted after the second, etc.

8. **Keyword arguments** are the ones whose meaning is not dictated by their location, but by a special word (keyword) used to identify them.

9. The `end` and `sep` parameters can be used for formatting the output of the `print()` function. The `sep` parameter specifies the separator between the outputted arguments, e.g., `print("H", "E", "L", "L", "O", sep="-")`, whereas the `end` parameter specifies what to print at the end of the print statement.

