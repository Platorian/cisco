### Parameterised functions

The function's full power reveals itself when it can be equipped with an interface that is able to accept data provided by the invoker. Such data can modify the function's behavior, making it more flexible and adaptable to changing conditions.

A parameter is actually a variable, but there are two important factors that make parameters different and special:

- **parameters exist only inside functions in which they have been defined**, and the only place where the parameter can be defined is a space between a pair of parentheses in the def statement;
- **assigning a value to the parameter is done at the time of the function's invocation**, by specifying the corresponding argument.

```python
def function(parameter):

    ###
```

Greeting example:

```python
def greeting(name):
    print(f"Hello {name}, It's good to see you again!")


name = input("Please Enter your Name: ")

greeting(name)
```

Don't forget:

- **parameters live inside functions** (this is their natural environment)
- **arguments exist outside functions**, and are carriers of values passed to corresponding parameters.

There is a clear and unambiguous frontier between these two worlds.

Let's enrich the function above with just one parameter ‒ we're going to use it to show the user the number of a value the function asks for.

The definition specifies that our function operates on just one parameter named number. You can use it as an ordinary variable, but **only inside the function** ‒ it isn't visible anywhere else.

```python
def message(number):
    print("Enter a number:", number)
```

We've made use of the parameter. Note: we haven't assigned the parameter with any value. Is it correct?

Yes, it is.

A value for the parameter will arrive from the function's environment.

Remember: **specifying one or more parameters in a function's definition** is also a requirement, and you have to fulfil it during invocation. You must **provide as many arguments as there are defined parameters**.

Failure to do so will cause an error.

```python
def message(what, number):
    print("Enter", what, "number", number)

message("telephone", 11)
message("price", 5)
message("number", "number")
```

```output
Enter telephone number 11
Enter price number 5
Enter number number number
```

Shadowing:
- parameter x shadows any variable of the same name, but only inside the function defining the parameter.

---

### Positional parameter passing

A technique which assigns the ith (first, second, and so on) argument to the ith (first, second, and so on) function parameter is called **positional parameter passing**, while arguments passed in this way are named **positional arguments**.

You've used it already, but Python can offer a lot more. We're going to tell you about it now.

```python
def my_function(a, b, c):
    print(a, b, c)

my_function(1, 2, 3)
```


Note: positional parameter passing is intuitively used by people in many social occasions. For example, it may be generally accepted that when we introduce ourselves we mention our first name(s) before our last name, e.g., "My name's John Doe."

Incidentally, Hungarians do it in reverse order.

---

Let's implement that social custom in Python. The following function will be responsible for introducing somebody:

```python
def introduction(first_name, last_name):
    print("Hello, my name is", first_name, last_name)

introduction("Luke", "Skywalker")
introduction("Jesse", "Quick")
introduction("Clark", "Kent")
```

Now imagine that the same function is being used in Hungary. In this case, the code would look like this:

```python
def introduction(first_name, last_name):
    print("Hello, my name is", first_name, last_name)

introduction("Skywalker", "Luke")
introduction("Quick", "Jesse")
introduction("Kent", "Clark")
```

Can you make the function more culture-independent?

```python
def introduction(first_name, last_name):
    print("Hallo, mein name ist", first_name, last_name)

introduction("Skywalker", "Luke")
introduction("Quick", "Jesse")
introduction("Kent", "Clark")
```

---

### Keyword argument passing

Python offers another convention for passing arguments, where **the meaning of the argument is dictated by its name**, not by its position ‒ it's called **keyword argument passing**.

```python
def introduction(first_name, last_name):
    print("Hello, my name is", first_name, last_name)

introduction(first_name = "James", last_name = "Bond")
introduction(last_name = "Skywalker", first_name = "Luke")
```

The concept is clear ‒ the values passed to the parameters are preceded by the target parameters' names, followed by the = sign.

The position doesn't matter here ‒ each argument's value knows its destination on the basis of the name used.

You should be able to predict the output. Run the code to check if you're right.

---

Of course, you **mustn't use a non-existent parameter name**.

The following snippet will cause a runtime error:

```python
def introduction(first_name, last_name):
    print("Hello, my name is", first_name, last_name)

introduction(surname="Skywalker", first_name="Luke")
```

```output
TypeError: introduction() got an unexpected keyword argument 'surname'
```

---

### Mixing positional and keyword arguments

You can mix both styles if you want ‒ there is only one unbreakable rule: you have to put **positional arguments before keyword arguments**.

If you think for a moment, you'll certainly guess why.

To show you how it works, we'll use the following simple three-parameter function:

```python
def adding(a, b, c):
    print(a, "+", b, "+", c, "=", a + b + c)
```

Its purpose is to evaluate and present the sum of all its arguments.
The function, when invoked in the following way:

```python
adding(1, 2, 3)
```

will output:

```output
1 + 2 + 3 = 6
```

It was ‒ as you may suspect ‒ a pure example of **positional argument passing**.

---

Of course, you can replace such an invocation with a purely keyword variant, like this:

```python
adding(c = 1, a = 2, b = 3)
```

Our program will output a line like this:

```output
2 + 3 + 1 = 6
```

Note the order of the values.

---

Let's try to mix both styles now.

Look at the function invocation below:

```python
adding(3, c = 1, b = 2)
```

Let's analyze it:

- the argument (3) for the a parameter is passed using the positional way;
- the arguments for c and b are specified as keyword ones.

This is what you'll see in the console:

```output
3 + 2 + 1 = 6
```

Be careful, and beware of mistakes. If you try to pass more than one value to one argument, all you'll get is a runtime error.

Look at the invocation below - it seems that we've tried to set a twice:

```python
adding(3, a = 1, b = 2)
```

Python's response:

```output
TypeError: adding() got multiple values for argument 'a'
```

Look at the snipet below. A code like this is fully correct, but it doesn't make much sense:

```python
adding(4, 3, c = 2)
```

Everything is right, but leaving in just one keyword argument looks a bit weird ‒ what do you think?

