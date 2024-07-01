### Effects and results: the _return_ instruction

All the previously presented functions have some kind of effect ‒ they produce some text and send it to the console.

Of course, functions ‒ like their mathematical siblings ‒ may have results.

To get **functions to return a value** (but not only for this purpose) you use the return instruction.

This word gives you a full picture of its capabilities. Note: it's a Python **keyword**.

The return instruction has **two different variants** ‒ let's consider them separately.

#### _return_ without an expression

Let's consider the following function:

```python
def happy_new_year(wishes = True):
    print("Three...")
    print("Two...")
    print("One...")
    if not wishes:
        return

    print("Happy New Year!")
```

When invoked without any arguments:

`happy_new_year()`

the function causes a little noise ‒ the output will look like this:

```output
Three...
Two...
One...
Happy New Year!
```

Providing False as an argument:

`happy_new_year(False)`

will modify the function's behavior ‒ the return instruction will cause its termination just before the wishes ‒ this is the updated output:

```output
Three...
Two...
One...
```

#### _return_ with an expression

The second return variant is **extended with an expression**:

```python
def function():
	return expression
```

There are two consequences of using it:

- it causes the **immediate termination of the function's execution** (nothing new compared to the first variant)
- moreover, the function will **evaluate the expression's value and will return it (hence the name once again) as the function's result**.

Yes, we already know ‒ this example isn't really sophisticated:

```python
def boring_function():
    return 123

x = boring_function()

print("The boring_function has returned its result. It's:", x)
```

The snippet writes the following text to the console:

```output
The boring_function has returned its result. It's: 123
```

Let's investigate it for a while.

Analyse the figure below:

![[Pasted image 20240701071934.png]]

The ==return== instruction, enriched with the expression (the expression is very simple here), "transports" the expression's value to the place where the function has been invoked.

The result may be freely used or assigned to a variable.

It may also be completely ignored and lost without a trace.

Note, the function returns a value, and we ignore it (we don't use it in any way):

```python
def boring_function():
    print("'Boredom Mode' ON.")
    return 123

print("This lesson is interesting!")
boring_function()
print("This lesson is boring...")
```

The program produces the following output:

```output
This lesson is interesting!
'Boredom Mode' ON.
This lesson is boring...
```

Is it punishable? Not at all.

The only disadvantage is that the result has been irretrievably lost.

Don't forget:

- you are always **allowed to ignore the function's result**, and be satisfied with the function's effect (if the function has any)
- if a function is intended to return a useful result, it must contain the second variant of the return instruction.

Wait a minute ‒ does this mean that there are useless results, too? Yes, in some sense.

---

### A few words about _None_

Let us introduce you to a very curious value (to be honest, a none value) named None.

Its data doesn't represent any reasonable value ‒ actually, it's not a value at all; hence, it **mustn't take part in any expressions**.

For example, a snippet like this:
`print(None + 2)`

will cause a runtime error, described by the following diagnostic message:
`TypeError: unsupported operand type(s) for +: 'NoneType' and 'int'`

Note: None is a **keyword**.

There are only two kinds of circumstances when None can be safely used:

- when you **assign it to a variable** (or return it as a **function's result**)
- when you **compare it with a variable** to diagnose its internal state.

Just like here:

```python
value = None
if value is None:
    print("Sorry, you don't carry any value")
```

Don't forget this: if a function doesn't return a certain value using a return expression clause, it is assumed that it **implicitly returns None**.

Let's test it.

```python
def strange_function(n):
    if(n % 2 == 0):
        return True
```

It's obvious that the strange_function function returns True when its argument is even.

What does it return otherwise?

We can use the following code to check it:

```python
print(strange_function(2))
print(strange_function(1))
```

This is what we see in the console:

`True`
`False`

Don't be surprised next time you see None as a function result ‒ it may be the symptom of a subtle mistake inside the function.

---

### Effects and results: lists and functions

here are two additional questions that should be answered here.

The first is: **may a list be sent to a function as an argument?**

Of course it may! Any entity recognizable by Python can play the role of a function argument, although it has to be assured that the function is able to cope with it.

So, if you pass a list to a function, the function has to handle it like a list.

A function like this one here:

```python
def list_sum(lst):
    s = 0

    for elem in lst:
        s += elem

    return s
```

and invoked like this:

`print(list_sum([5, 4, 3]))`

will return 12 as a result, but you should expect problems if you invoke it in this risky way:

`print(list_sum(5))`

Python's response will be unequivocal:

`TypeError: 'int' object is not iterable`

This is caused by the fact that a **single integer value mustn't be iterated through by the** for **loop**.

The second question is: **may a list be a function result?**

Yes, of course! Any entity recognizable by Python can be a function result.

Look at the code in the editor:

```python
def strange_list_fun(n):
    strange_list = []
    
    for i in range(0, n):
        strange_list.insert(0, i)
    
    return strange_list

print(strange_list_fun(5))
```

Output:

`[4, 3, 2, 1, 0]`

_Now you can write functions with and without results._

---

**LAB**   A leap year: writing your own functions

our task is to write and test a function which takes one argument (a year) and returns True if the year is a _leap year_, or False otherwise.

The seed of the function is already shown in the skeleton code in the editor.

Note: we've also prepared a short testing code, which you can use to test your function.

The code uses two lists ‒ one with the test data, and the other containing the expected results. The code will tell you if any of your results are invalid.

```python
def is_year_leap(year):
    if year % 4 != 0:
        return False
    elif year % 100 != 0:
        return True
    elif year % 400 != 0:
        return False
    else:
        return True

test_data = [1900, 2000, 2016, 1987]
test_results = [False, True, True, False]
for i in range(len(test_data)):
    yr = test_data[i]
    print(yr,"-> ",end="")
    result = is_year_leap(yr)
    if result == test_results[i]:
        print("OK")
    else:
        print("Failed")
```

---

**LAB**   How many days: writing and using your own functions

Your task is to write and test a function which takes two arguments (a year and a month) and returns the number of days for the given year-month pair (while only February is sensitive to the year value, your function should be universal).

The initial part of the function is ready. Now, convince the function to return None if its arguments don't make sense.

Of course, you can (and should) use the previously written and tested function (LAB 4.3.1.6). It may be very helpful. We encourage you to use a list filled with the months' lengths. You can create it inside the function ‒ this trick will significantly shorten the code.

We've prepared a testing code. Expand it to include more test cases.

```python
def is_year_leap(year):
    #
    # Your code from the previous LAB.
    #

def days_in_month(year, month):
    #
    # Write your new code here.
    #

test_years = [1900, 2000, 2016, 1987]
test_months = [2, 2, 1, 11]
test_results = [28, 29, 31, 30]
for i in range(len(test_years)):
    yr = test_years[i]
    mo = test_months[i]
    print(yr, mo, "->", end="")
    result = days_in_month(yr, mo)
    if result == test_results[i]:
        print("OK")
    else:
        print("Failed")
```


```python

```


```python

```


```python

```


```python

```


```python

```


