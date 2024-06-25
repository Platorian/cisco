The input() function

We're now going to introduce you to a completely new function, which seems to be a mirror reflection of the good old print() function.

Why? Well, print() sends data to the console.

The new function gets data from it.

print() has no usable result. The meaning of the new function is to **return a very usable result**.

The function is named input(). The name of the function says everything.

The input() function is able to read data entered by the user and to return the same data to the running program.

The program can manipulate the data, making the code truly interactive.

Virtually all programs **read and process data**. A program which doesn't get a user's input is a **deaf program**.

Take a look at our example:

```python
print("Tell me anything...")

anything = input()

print("Hmm...", anything, "... Really?")
```

Note:

- The program **prompts the user to input some data** from the console (most likely using a keyboard, although it is also possible to input data using voice or image);
- the input() function is invoked without arguments (this is the simplest way of using the function); the function will **switch the console to input mode**; you'll see a blinking cursor, and you'll be able to input some keystrokes, finishing off by hitting the _Enter_ key; all the inputted data will be **sent to your program** through the function's result;
- note: you need to assign the result to a variable; this is crucial ‒ missing out this step will cause the entered data to be lost;
- then we use the print() function to output the data we get, with some additional remarks.

---

The input() function with an argument

he input() function can do something else: it can prompt the user without any help from print().

We've modified our example a bit, look at the code:

```python
anything = input("Tell me anything...")

print("Hmm...", anything, "...Really?")
```

Note:

- the input() function is invoked with one argument ‒ it's a string containing a message;
- the message will be displayed on the console before the user is given an opportunity to enter anything;
- input() will then do its job.

This variant of the input() invocation simplifies the code and makes it clearer.

---

The result of the input() function

We've said it already, but it must be unambiguously stated once again: the **result of the input() function is a string**.

A string containing all the characters the user enters from the keyboard. It is not an integer or a float.

This means that **you mustn't use it as an argument of any arithmetic operation**, e.g., you can't use this data to square it, divide it by anything, or divide anything by it.

```python
anything = input("Enter a number: ")

something = anything ** 2.0

print(anything, "to the power of 2 is", something)
```

```output
Traceback (most recent call last):

File ".main.py", line 4, in <module>

something = anything ** 2.0

TypeError: unsupported operand type(s) for ** or pow(): 'str' and 'float'
```

This will not work because input is a string so we have to change it into an int or float, but considering that we already have a float number we should use that:

```python
anything = input("Enter a number: ")

anything = float(anything)

something = anything ** 2.0

print(anything, "to the power of 2 is", something) 
```

---

Type casting (type conversions)

Python offers two simple functions to specify a type of data and solve this problem ‒ here they are: int() and float().

Their names are self-commenting:

- the int() function **takes one argument** (e.g., a string: int(string)) and tries to convert it into an integer; if it fails, the whole program will fail too (there is a workaround for this situation, but we'll show you this a little later);
- the float() function takes one argument (e.g., a string: float(string)) and tries to convert it into a float (the rest is the same).

This is very simple and very effective. Moreover, you can invoke any of the functions by passing the input() results directly to them. There's no need to use any variable as an intermediate storage.

We've implemented the idea in the editor ‒ take a look at the code.

Can you imagine how the string entered by the user flows from input() into print()?

Try to run the modified code. Don't forget to enter a **valid number**.

Check some different values, small and big, negative and positive. Zero is a good input, too.

```python
anything = float(input("Enter a number: "))

something = anything ** 2.0

print(anything, "to the power of 2 is", something)
```

Having a team consisting of the trio input()-int()-float() opens up lots of new possibilities.

You'll eventually be able to write complete programs, accepting data in the form of numbers, processing them and displaying the results.

Of course, these programs will be very primitive and not very usable, as they cannot make decisions, and consequently are not able to react differently to different situations.

This is not really a problem, though; we'll show you how to overcome it soon.

Our next example refers to the earlier program to find the length of a hypotenuse. Let's run it and make it able to read the lengths of the legs from the console.

Check out the editor window ‒ this is what it looks like now:

```python
leg_a = float(input("Input first leg length: "))

leg_b = float(input("Input second leg length: "))

hypo = (leg_a**2 + leg_b**2) ** .5

print("Hypotenuse length is", hypo)
```

---

This simple program "draws" a rectangle, making use of an old operator (+) in a new role:

```python
print("+" + 10 * "-" + "+")
print(("|" + " " * 10 + "|\n") * 5, end="")
print("+" + 10 * "-" + "+")
```

Here is our "right-angle triangle" program again:

```python
leg_a = float(input("Input first leg length: "))

leg_b = float(input("Input second leg length: "))

print("Hypotenuse length is " + str((leg_a**2 + leg_b**2) ** .5))
```

---

## Scenario

Your task is to complete the code in order to evaluate the results of four basic arithmetic operations.

The results have to be printed to the console.

You may not be able to protect the code from a user who wants to divide by zero. That's okay, don't worry about it for now.

Test your code ‒ does it produce the results you expect?

We won't show you any test data ‒ that would be too simple.

```python
a = float(input("Enter num: "))
b = float(input("Enter num: "))
print(a + b) # output the result of addition here
print(a - b) # output the result of subtraction here
print(a * b) # output the result of multiplication here
print(a / b) # output the result of division here

print("\nThat's all, folks!")
```

---

![[Pasted image 20240625125516.png]]
Notes: 1/(x + 1/(x + 1/)

```python
x = float(input("Enter value for x: "))

y = 1./(x + 1./(x + 1./(x + 1./x)))

print("y =", y)
```

---

**LAB**   Operators and expressions – 2

## Scenario

Your task is to prepare a simple code able to evaluate the **end time** of a period of time, given as a number of minutes (it could be arbitrarily large). The start time is given as a pair of hours (0..23) and minutes (0..59). The result has to be printed to the console.

For example, if an event starts at **12:17** and lasts **59 minutes**, it will end at **13:16**.

Don't worry about any imperfections in your code ‒ it's okay if it accepts an invalid time ‒ the most important thing is that the code produces valid results for valid input data.

Test your code carefully. Hint: using the % operator may be the key to success.

```python
hour = int(input("Starting time (hours): "))
mins = int(input("Starting time (minutes): "))
dura = int(input("Event duration (minutes): "))
mins = mins + dura # find a total of all minutes
hour = hour + mins // 60 # find a number of hours hidden in minutes and update the hour
mins = mins % 60 # correct minutes to fall in the (0..59) range
hour = hour % 24 # correct hours to fall in the (0..23) range
print(hour, ":", mins, sep='')
```

---

**SECTION SUMMARY**

The print() function **sends data to the console**, while the input() function **gets data from the console**.

2. The input() function comes with an optional parameter: **the prompt string**. It allows you to write a message before the user input, e.g.:

```python
name = input("Enter your name: ")

print("Hello, " + name + ". Nice to meet you!")
```

When the input() function is called, the program's flow is stopped, the prompt symbol keeps blinking (it prompts the user to take action when the console is switched to input mode) until the user has entered an input and/or pressed the _Enter_ key.

  **Note**  

You can test the functionality of the input() function in its full scope locally on your machine. For resource optimization reasons, we have limited the maximum program execution time in Edube to a few seconds. Go to the Sandbox, copy-paste the above snippet, run the program, and do nothing ‒ just wait a few seconds to see what happens. Your program should be stopped automatically after a short moment. Now open IDLE, and run the same program there ‒ can you see the difference?

Tip: the above-mentioned feature of the input() function can be used to prompt the user to end a program. Look at the code below:

```python
name = input("Enter your name: ")

print("Hello, " + name + ". Nice to meet you!")

print("\nPress Enter to end the program.")

input()

print("THE END.")
```

The result of the input() function is a string. You can add strings to each other using the concatenation (+) operator. Check out this code:

```python
num_1 = input("Enter the first number: ") # Enter 12

num_2 = input("Enter the second number: ") # Enter 21

print(num_1 + num_2) # the program returns 1221
```

You can also multiply (* ‒ replication) strings, e.g.:

```python
my_input = input("Enter something: ") # Example input: hello

print(my_input * 3) # Expected output: hellohellohello
```

