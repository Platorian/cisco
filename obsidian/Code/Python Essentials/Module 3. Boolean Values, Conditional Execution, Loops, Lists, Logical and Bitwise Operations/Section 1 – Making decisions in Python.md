Question: **are two values equal**?

To ask this question, you use the == (equal equal) operator.

Don't forget this important distinction:

- `=` is an **assignment operator**, e.g., `a = b` assigns `a` with the value of `b`;
- `==` is the question _are these values equal?_ so `a == b` **compares** `a` and `b`.

It is a **binary operator with left-sided binding**. It needs two arguments and **checks if they are equal**.

The == (equal to) operator compares the values of two operands. If they are equal, the result of the comparison is True. If they are not equal, the result of the comparison is False.

---

## Inequality: the _not equal to_ operator (!=)

The != (not equal to) operator compares the values of two operands, too. Here is the difference: if they are equal, the result of the comparison is False. If they are not equal, the result of the comparison is True.

---

## Comparison operators: greater than

You can also ask a comparison question using the > (greater than) operator.

## Comparison operators: greater than or equal to

The _greater than_ operator has another special, **non-strict** variant, but it's denoted differently than in classical arithmetic notation: >= (greater than or equal to).

There are two subsequent signs, not one.

Both of these operators (strict and non-strict), as well as the two others discussed in the next section, are **binary operators with left-sided binding**, and their **priority is greater than that shown by == and !=**.

## Comparison operators: less than/less than or equal to

As you've probably already guessed, the operators used in this case are: the < (less than) operator and its non-strict sibling: <= (less than or equal to).

---

## Making use of the answers

What can you do with the answer (i.e., the result of a comparison operation) you get from the computer?

There are at least two possibilities: first, you can memorize it (**store it in a variable**) and make use of it later. How do you do that? Well, you use an arbitrary variable like this:

`answer = number_of_lions >= number_of_lionesses`

The second possibility is more convenient and far more common: you can use the answer you get to **make a decision about the future of the program**.

Now we need to update our **priority table**, and put all the new operators into it. It now looks as follows:

![[../IMG/Pasted image 20240626064008.png]]

---

## Scenario

Using one of the comparison operators in Python, write a simple two-line program that takes the parameter `n` as input, which is an integer, and prints `False` if `n` is less than `100`, and `True` if `n` is greater than or equal to `100`.

Don't create any `if` blocks (we're going to talk about them very soon). Test your code using the data we've provided for you.

```python
n = int(input("Enter num: "))
print(n >= 100)
```

---

You already know how to ask Python questions, but you still don't know how to make reasonable use of the answers. You have to have a mechanism which will allow you to do something **if a condition is met, and not do it if it isn't**.

It's just like in real life: you do certain things or you don't when a specific condition is met or not, e.g., you go for a walk if the weather is good, or stay home if it's wet and cold.

To make such decisions, Python offers a special instruction. Due to its nature and its application, it's called a **conditional instruction** (or conditional statement).

There are several variants of it. We'll start with the simplest, increasing the difficulty slowly.

The first form of a conditional statement, which you can see below is written very informally but figuratively:

`if true_or_not:
	`do_this_if_true`

This conditional statement consists of the following, strictly necessary, elements in this and this order only:

- the if keyword;
- one or more white spaces;
- an expression (a question or an answer) whose value will be interpreted solely in terms of True (when its value is non-zero) and False (when it is equal to zero);
- a **colon** followed by a newline;
- an **indented** instruction or set of instructions (at least one instruction is absolutely required); the **indentation** may be achieved in two ways – by inserting a particular number of spaces (the recommendation is to use **four spaces of indentation**), or by using the _tab_ character; note: if there is more than one instruction in the indented part, the indentation should be the same in all lines; even though it may look the same if you use tabs mixed with spaces, it's important to make all indentations **exactly the same** – Python 3 **does not allow the mixing of spaces and tabs** for indentation.

How does that statement work?

- If the true_or_not expression **represents the truth** (i.e., its value is not equal to zero), **the indented statement(s) will be executed**;
- if the true_or_not expression **does not represent the truth** (i.e., its value is equal to zero), **the indented statement(s) will be omitted** (ignored), and the next executed instruction will be the one after the original indentation level.

In real life, we often express a desire:

_if the weather is good, we'll go for a walk_

_then, we'll have lunch_

  

As you can see, having lunch is **not a conditional activity** and doesn't depend on the weather.

Knowing what conditions influence our behaviour, and assuming that we have the parameterless functions go_for_a_walk() and have_lunch(), we can write the following snippet:

```python
if the_weather_is_good:
    go_for_a_walk()
have_lunch()
```

## Conditional execution: the if statement

If a certain sleepless Python developer falls asleep when he or she counts 120 sheep, and the sleep-inducing procedure may be implemented as a special function named sleep_and_dream(), the whole code takes the following shape:

```python
if sheep_counter >= 120: # Evaluate a test expression
    sleep_and_dream() # Execute if test expression is True
```

You can read it as: if sheep_counter is greater than or equal to 120, then fall asleep and dream (i.e., execute the sleep_and_dream function.)

```python
if sheep_counter >= 120:
    make_the_bed()
    take_a_shower()
    sleep_and_dream()
feed_the_sheepdogs()
```

As you can see, making a bed, taking a shower and falling asleep and dreaming are all **executed conditionally** – when sheep_counter reaches the desired limit.

Feeding the sheepdogs, however, is **always done** (i.e., the feed_the_sheepdogs() function is not indented and does not belong to the if block, which means it is always executed.)

## Conditional execution: the if-else statement

We started out with a simple phrase which read: _If the weather is good, we will go for a walk_.

Note: there is not a word about what will happen if the weather is bad. We only know that we won't go outdoors, but what we could do instead is not known. We may want to plan something in case of bad weather, too.

We can say, for example: _If the weather is good, we will go for a walk, otherwise we will go to a theater_.

Now we know what we'll do **if the conditions are met**, and we know what we'll do **if not everything goes our way**. In other words, we have a "Plan B".

Python allows us to express such alternative plans. This is done with a second, slightly more complex form of the conditional statement, the _if-else_ statement:

```python
if true_or_false_condition:
    perform_if_condition_true
else:
    perform_if_condition_false
```

Thus, there is a new word: else – this is a **keyword**.

The part of the code which begins with else says what to do if the condition specified for the if is not met (note the **colon** after the word).

The _if-else_ execution goes as follows:

- if the condition evaluates to **True** (its value is not equal to zero), the perform_if_condition_true statement is executed, and the conditional statement comes to an end;
- if the condition evaluates to **False** (it is equal to zero), the perform_if_condition_false statement is executed, and the conditional statement comes to an end.

```python
if the_weather_is_good:
    go_for_a_walk()
else:
    go_to_a_theater()
have_lunch()
```

## Nested if-else statements

Now let's discuss two special cases of the conditional statement.

First, consider the case where the **instruction placed after the if is another if**.

Read what we have planned for this Sunday. If the weather is fine, we'll go for a walk. If we find a nice restaurant, we'll have lunch there. Otherwise, we'll eat a sandwich. If the weather is poor, we'll go to the theater. If there are no tickets, we'll go shopping in the nearest mall.

Let's write the same in Python. Consider carefully the code here:

```python
if the_weather_is_good:
    if nice_restaurant_is_found:
        have_lunch()
    else:
        eat_a_sandwich()
else:
    if tickets_are_available:
        go_to_the_theater()
    else:
        go_shopping()
```

Here are two important points:

- this use of the if statement is known as **nesting**; remember that every else refers to the if which lies **at the same indentation level**; you need to know this to determine how the _if_s and _else_s pair up;
- consider how the **indentation improves readability**, and makes the code easier to understand and trace.

## The elif statement

The second special case introduces another new Python keyword: **elif**. As you probably suspect, it's a shorter form of **else if**.

elif is used to **check more than just one condition**, and to **stop** when the first statement which is true is found.

Our next example resembles nesting, but the similarities are very slight. Again, we'll change our plans and express them as follows: If the weather is fine, we'll go for a walk, otherwise if we get tickets, we'll go to the theater, otherwise if there are free tables at the restaurant, we'll go for lunch; if all else fails, we'll stay home and play chess.

Have you noticed how many times we've used the word _otherwise_? This is the stage where the elif keyword plays its role.

Let's write the same scenario using Python:

```python
if the_weather_is_good:
    go_for_a_walk()
elif tickets_are_available:
    go_to_the_theater()
elif table_is_available:
    go_for_lunch()
else:
    play_chess_at_home()
```

The way to assemble subsequent _if-elif-else_ statements is sometimes called a **cascade**.

Notice again how the indentation improves the readability of the code.

Some additional attention has to be paid in this case:

- you **mustn't use else without a preceding if**;
- else is always the **last branch of the cascade**, regardless of whether you've used elif or not;
- else is an **optional** part of the cascade, and may be omitted;
- if there is an else branch in the cascade, only one of all the branches is executed;
- if there is no else branch, it's possible that none of the available branches is executed.

---

## Analyzing code samples

Now we're going to show you some simple yet complete programs. We won't explain them in detail, because we consider the comments (and the variable names) inside the code to be sufficient guides.

All the programs solve the same problem – they **find the largest of several numbers and print it out**.

**Example 1:**

We'll start with the simplest case – **how to identify the larger of two numbers**:

```python
# Read two numbers
number1 = int(input("Enter the first number: "))
number2 = int(input("Enter the second number: "))

# Choose the larger number
if number1 > number2:
    larger_number = number1
else:
    larger_number = number2

# Print the result
print("The larger number is:", larger_number)
```

**Example 2:**

Now we're going to show you one intriguing fact. Python has an interesting feature – look at the code below:

```python
# Read two numbers
number1 = int(input("Enter the first number: "))
number2 = int(input("Enter the second number: "))

# Choose the larger number
if number1 > number2: larger_number = number1
else: larger_number = number2

# Print the result
print("The larger number is:", larger_number)
```

Note: if any of the _if-elif-else_ branches contains just one instruction, you may code it in a more comprehensive form (you don't need to make an indented line after the keyword, but just continue the line after the colon).

This style, however, may be misleading, and we're not going to use it in our future programs, but it's definitely worth knowing if you want to read and understand someone else's programs.

There are no other differences in the code.

**Example 3:**

It's time to complicate the code – let's find the largest of three numbers. Will it enlarge the code? A bit.

We assume that the first value is the largest. Then we verify this hypothesis with the two remaining values.

Look at the code below:

```python
# Read three numbers
number1 = int(input("Enter the first number: "))
number2 = int(input("Enter the second number: "))
number3 = int(input("Enter the third number: "))

# We temporarily assume that the first number
# is the largest one.
# We will verify this soon.
largest_number = number1

# We check if the second number is larger than the current largest_number
# and update the largest_number if needed.
if number2 > largest_number:
    largest_number = number2

# We check if the third number is larger than the current largest_number
# and update the largest_number if needed.
if number3 > largest_number:
    largest_number = number3

# Print the result
print("The largest number is:", largest_number)
```

---

## Pseudocode and introduction to loops

You should now be able to write a program which finds the largest of four, five, six, or even ten numbers.

You already know the scheme, so extending the size of the problem will not be particularly complex.

But what happens if we ask you to write a program that finds the largest of two hundred numbers? Can you imagine the code?

You'll need two hundred variables. If two hundred variables isn't bad enough, try to imagine searching for the largest of a million numbers.

Imagine a code that contains 199 conditional statements and two hundred invocations of the `input()` function. Luckily, you don't need to deal with that. There's a simpler approach.

We'll ignore the requirements of Python syntax for now, and try to analyze the problem without thinking about the real programming. In other words, we'll try to write the **algorithm**, and when we're happy with it, we'll implement it.

In this case, we'll use a kind of notation which is not an actual programming language (it can be neither compiled nor executed), but it is formalized, concise and readable. It's called **pseudocode**.

Let's look at our pseudocode below:

```python
largest_number = -999999999
number = int(input())
if number == -1:
    print(largest_number)
    exit()
if number > largest_number:
    largest_number = number
# Go to line 02
```

What's happening in it?

Firstly, we can simplify the program if, at the very beginning of the code, we assign the variable largest_number with a value which will be smaller than any of the entered numbers. We'll use -999999999 for that purpose.

Secondly, we assume that our algorithm will not know in advance how many numbers will be delivered to the program. We expect that the user will enter as many numbers as she/he wants – the algorithm will work well with one hundred and with one thousand numbers. How do we do that?

We make a deal with the user: when the value -1 is entered, it will be a sign that there are no more data and the program should end its work.

Otherwise, if the entered value is not equal to -1, the program will read another number, and so on.

The trick is based on the assumption that any part of the code can be performed more than once – precisely, as many times as needed.

Performing a certain part of the code more than once is called a **loop**. The meaning of this term is probably obvious to you.

Lines 02 through 08 make a loop. We'll **pass through them as many times as needed** to review all the entered values.

Can you use a similar structure in a program written in Python? Yes, you can.

**Extra Info**  

Python often comes with a lot of built-in functions that will do the work for you. For example, to find the largest number of all, you can use a Python built-in function called max(). You can use it with multiple arguments. Analyze the code below:

```python
# Read three numbers.
number1 = int(input("Enter the first number: "))
number2 = int(input("Enter the second number: "))
number3 = int(input("Enter the third number: "))

# Check which one of the numbers is the greatest
# and pass it to the largest_number variable.

largest_number = max(number1, number2, number3)

# Print the result.
print("The largest number is:", largest_number)
```

By the same fashion, you can use the min() function to return the lowest number. You can rebuild the above code and experiment with it in the Sandbox.

---

**LAB**   Comparison operators and conditional execution

## Scenario

[Spathiphyllum](https://upload.wikimedia.org/wikipedia/commons/b/bd/Spathiphyllum_cochlearispathum_RTBG.jpg), more commonly known as a peace lily or white sail plant, is one of the most popular indoor houseplants that filters out harmful toxins from the air. Some of the toxins that it neutralizes include benzene, formaldehyde, and ammonia.

Imagine that your computer program loves these plants. Whenever it receives an input in the form of the word `Spathiphyllum`, it involuntarily shouts to the console the following string: `"Spathiphyllum is the best plant ever!"`

Write a program that utilizes the concept of conditional execution, takes a string as input, and:

- prints the sentence `"Yes - Spathiphyllum is the best   plant ever!"` to the screen if the inputted string is `"Spathiphyllum"` (upper-case)
- prints `"No, I want a big Spathiphyllum!"` if the inputted string is `"spathiphyllum"` (lower-case)
- prints `"Spathiphyllum! Not [input]!"` otherwise. Note: `[input]` is the string taken as input.

Test your code using the data we've provided for you. And get yourself a Spathiphyllum, too!

```python
question = input(("What is my favourite plant?: "))
if question == "spathiphyllum":
    print("No, I want a big Spathiphyllum!")
    
elif question == "pelargonium":
    print("Spathiphyllum! Not pelargonium!")
    
elif question == "Spathiphyllum":
    print("Yes - Spathiphyllum is the best plant ever!")
    
else:
    print("I don't like your answer!")
```

---

**LAB**   Essentials of the if-else statement

## Scenario

Once upon a time there was a land – a land of milk and honey, inhabited by happy and prosperous people. The people paid taxes, of course – their happiness had limits. The most important tax, called the _Personal Income Tax_ (_PIT_ for short) had to be paid once a year, and was evaluated using the following rule:

- if the citizen's income was not higher than 85,528 thalers, the tax was equal to 18% of the income minus 556 thalers and 2 cents (this was what they called _tax relief_)
- if the income was higher than this amount, the tax was equal to 14,839 thalers and 2 cents, plus 32% of the surplus over 85,528 thalers.

Your task is to write a **tax calculator**.

- It should accept one floating-point value: the income.
- Next, it should print the calculated tax, rounded to full thalers. There's a function named `round()` which will do the rounding for you – you'll find it in the skeleton code in the editor.

Note: this happy country never returned any money to its citizens. If the calculated tax was less than zero, it would only mean no tax at all (the tax was equal to zero). Take this into consideration during your calculations.

Look at the code in the editor – it only reads one input value and outputs a result, so you need to complete it with some smart calculations.

Test your code using the data we've provided.

```python
income = float(input("Enter the annual income: "))

if income < 85528:
	tax = income * 0.18 - 556.02
# Write the rest of your code here.

else income > 85528:
	tax = income * 0.32 - 556.02

tax = round(tax, 0)
print("The tax is:", tax, "thalers")
```

2.
```python
income = float(input("Enter the annual income: "))

if income < 85528:
	tax = income * 0.18 - 556.02
else:
	tax = (income - 85528) * 0.32 + 14839.02

if tax < 0.0:
	tax = 0.0

tax = round(tax, 0)
print("The tax is:", tax, "thalers")
```

---

## Scenario

As you surely know, due to some astronomical reasons, years may be _leap_ or _common_. The former are 366 days long, while the latter are 365 days long.

Since the introduction of the Gregorian calendar (in 1582), the following rule is used to determine the kind of year:

- if the year number isn't divisible by four, it's a _common year_;
- otherwise, if the year number isn't divisible by 100, it's a _leap year_;
- otherwise, if the year number isn't divisible by 400, it's a _common year_;
- otherwise, it's a _leap year_.

Look at the code in the editor – it only reads a year number, and needs to be completed with the instructions implementing the test we've just described.

The code should output one of two possible messages, which are `Leap year` or `Common year`, depending on the value entered.

It would be good to verify if the entered year falls into the Gregorian era, and output a warning otherwise: `Not within the Gregorian calendar period`. Tip: use the `!=` and `%` operators.

Test your code using the data we've provided.

```python
year = int(input("Enter a year: "))

if year < 1582:
	print("Not within the Gregorian calendar period")
elif year not / 4:
	print("Common year")

else:
    #  Write the if-elif-elif-else block here.
	
```

2.
```python
year = int(input("Enter a year: "))

if year < 1582:
	print("Not within the Gregorian calendar period")
else:
	if year % 4 != 0:
		print("Common year")
	elif year % 100 != 0:
		print("Leap year")
	elif year % 400 != 0:
		print("Common year")
	else:
		print("Leap year")
```

---

**SECTION SUMMARY**

The **comparison** (otherwise known as _relational_) operators are used to compare values. The table below illustrates how the comparison operators work, assuming that `x = 0`, `y = 1`, and `z = 0`:

![[../IMG/Pasted image 20240626082233.png]]

When you want to execute some code only if a certain condition is met, you can use a **conditional statement**:

- a single if statement, e.g.:

```python
x = 10

if x == 10: # condition
    print("x is equal to 10")  # Executed if the condition is True.
```

- a series of if statements, e.g.:

```python
x = 10

if x > 5: # condition one
    print("x is greater than 5")  # Executed if condition one is True.

if x < 10: # condition two
    print("x is less than 10")  # Executed if condition two is True.

if x == 10: # condition three
    print("x is equal to 10")  # Executed if condition three is True.
```

Each if statement is tested separately.

- an if-else statement, e.g.:

```python
x = 10

if x < 10: # condition
    print("x is less than 10")  # Executed if the condition is True.

else:
    print("x is greater than or equal to 10")  # Executed if the condition is False.
```

- a series of if statements followed by an else, e.g.:

```python
x = 10

if x > 5: # condition one
    print("x is greater than 5")  # Executed if condition one is True.

if x < 10: # condition two
    print("x is less than 10")  # Executed if condition two is True.

if x == 10: # condition three
     print("x is equal to 10")  # Executed if condition three is True.
```

Each if is tested separately. The body of else is executed if the last if is False.

- The if-elif-else statement, e.g.:

```python
x = 10

if x == 10: # True
    print("x == 10")

if x > 15: # False
    print("x > 15")

elif x > 10: # False
    print("x > 10")

elif x > 5: # True
    print("x > 5")

else:
    print("else will not be executed")
```

If the condition for if is False, the program checks the conditions of the subsequent elif blocks - the first elif block that is True is executed. If all the conditions are False, the else block will be executed.

- Nested conditional statements, e.g.:

```python
x = 10

if x > 5: # True
    if x == 6: # False
        print("nested: x == 6")
    elif x == 10: # True
        print("nested: x == 10")
    else:
        print("nested: else")
else:
    print("else")
```

