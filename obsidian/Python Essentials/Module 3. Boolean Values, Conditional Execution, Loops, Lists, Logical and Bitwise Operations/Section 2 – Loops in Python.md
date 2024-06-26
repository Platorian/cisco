## Looping your code with while

In general, in Python, a loop can be represented as follows:

```python
while
	instruction
```

If you notice some similarities to the _if_ instruction, that's quite all right. Indeed, the syntactic difference is only one: you use the word while instead of the word if.

The semantic difference is more important: when the condition is met, _if_ performs its statements **only once**; _while_ **repeats the execution as long as the condition evaluates to True**.

- if you want to execute **more than one statement inside one while loop**, you must (as with if) **indent** all the instructions in the same way;
- an instruction or set of instructions executed inside the while loop is called the **loop's body**;
- if the condition is False (equal to zero) as early as when it is tested for the first time, the body is not executed even once (note the analogy of not having to do anything if there is nothing to do);
- the body should be able to change the condition's value, because if the condition is True at the beginning, the body might run continuously to infinity – notice that doing a thing usually decreases the number of things to do).

---

## An infinite loop

An infinite loop, also called an **endless loop**, is a sequence of instructions in a program which repeat indefinitely (loop endlessly.)

Here's an example of a loop that is not able to finish its execution:

```python
while True:
    print("I'm stuck inside a loop.")
```

This loop will infinitely print "I'm stuck inside a loop." on the screen.

To terminate your program, just press _Ctrl-C_ (or _Ctrl-Break_ on some computers). This will cause a KeyboardInterrupt exception and let your program get out of the loop.

Let's go back to the sketch of the algorithm we showed you recently. We're going to show you how to use this newly learned loop to find the largest number from a large set of entered data.

Analyze the program carefully. See where the loop starts (line 8). Locate the loop's body and find out **how the body is exited**:

```python
# Store the current largest number here.
largest_number = -999999999

# Input the first value.
number = int(input("Enter a number or type -1 to stop: "))

# If the number is not equal to -1, continue.
while number != -1:
    # Is number larger than largest_number?
    if number > largest_number:
        # Yes, update largest_number.
        largest_number = number
    # Input the next number.
    number = int(input("Enter a number or type -1 to stop: "))

# Print the largest number.
print("The largest number is:", largest_number)
```

```python
# A program that reads a sequence of numbers
# and counts how many numbers are even and how many are odd.
# The program terminates when zero is entered.

odd_numbers = 0
even_numbers = 0

# Read the first number.
number = int(input("Enter a number or type 0 to stop: "))

# 0 terminates execution.
while number != 0:
    # Check if the number is odd.
    if number % 2 == 1:
        # Increase the odd_numbers counter.
        odd_numbers += 1
    else:
        # Increase the even_numbers counter.
        even_numbers += 1
    # Read the next number.
    number = int(input("Enter a number or type 0 to stop: "))

# Print results.
print("Odd numbers count:", odd_numbers)
print("Even numbers count:", even_numbers)
```

Certain expressions can be simplified without changing the program's behavior.

Try to recall how Python interprets the truth of a condition, and note that these two forms are equivalent:

while number != 0: and while number:.

The condition that checks if a number is odd can be coded in these equivalent forms, too:

if number % 2 == 1: and if number % 2:.

---

## Using a counter variable to exit a loop

Look at the snippet below:

```python
counter = 5
while counter != 0:
    print("Inside the loop.", counter)
    counter -= 1
print("Outside the loop.", counter)
```

This code is intended to print the string "Inside the loop." and the value stored in the counter variable during a given loop exactly five times. Once the condition has not been met (the counter variable has reached 0), the loop is exited, and the message "Outside the loop." as well as the value stored in counter is printed.

But there's one thing that can be written more compactly – the condition of the while loop.

Can you see the difference?

```python
counter = 5
while counter:
    print("Inside the loop.", counter)
    counter -= 1
print("Outside the loop.", counter)
```

Is it more compact than previously? A bit. Is it more legible? That's disputable.

  **REMEMBER**  

Don't feel obliged to code your programs in a way that is always the shortest and the most compact. Readability may be a more important factor. Keep your code ready for a new programmer.

---

**LAB**   Guess the secret number

## Scenario

A junior magician has picked a secret number. He has hidden it in a variable named secret_number. He wants everyone who runs his program to play the _Guess the secret number_ game, and guess what number he has picked for them. Those who don't guess the number will be stuck in an endless loop forever! Unfortunately, he does not know how to complete the code.

Your task is to help the magician complete the code in the editor in such a way so that the code:

- will ask the user to enter an integer number;
- will use a while loop;
- will check whether the number entered by the user is the same as the number picked by the magician. If the number chosen by the user is different than the magician's secret number, the user should see the message "Ha ha! You're stuck in my loop!" and be prompted to enter a number again. If the number entered by the user matches the number picked by the magician, the number should be printed to the screen, and the magician should say the following words: "Well done, muggle! You are free now."

The magician is counting on you! Don't disappoint him.

  **EXTRA INFO**  

By the way, look at the print() function. The way we've used it here is called _multi-line printing_. You can use **triple quotes** to print strings on multiple lines in order to make text easier to read, or create a special text-based design. Experiment with it.

```python
secret_number = 777
guess = int(input("Guess the magicians secret number: "))
# print(guess)

while True:
	if guess == secret_number:
	print("Well done, muggle! You are free now.")
	exit()

	elif guess != secret_number:
	print("Ha ha! You're stuck in my loop!")
	guess = int(input("Guess num: "))
```

---

## Looping your code with for

Another kind of loop available in Python comes from the observation that sometimes it's more important to **count the "turns" of the loop** than to check the conditions.

Imagine that a loop's body needs to be executed exactly one hundred times. If you would like to use the while loop to do it, it may look like this:

```python
i = 0
while i < 100:
    # do_something()
    i += 1
```

It would be nice if somebody could do this boring counting for you. Is that possible?

Of course it is – there's a special loop for these kinds of tasks, and it is named for.

Actually, the for loop is designed to do more complicated tasks – **it can "browse" large collections of data item by item**. We'll show you how to do that soon, but right now we're going to present a simpler variant of its application.

