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

Take a look at the snippet:

```python
for i in range(100):
    # do_something()
    pass
```

There are some new elements. Let us tell you about them:

- the _for_ keyword opens the for loop; note – there's no condition after it; you don't have to think about conditions, as they're checked internally, without any intervention;
- any variable after the _for_ keyword is the **control variable** of the loop; it counts the loop's turns, and does it automatically;
- the _in_ keyword introduces a syntax element describing the range of possible values being assigned to the control variable;
- the range() function (this is a very special function) is responsible for generating all the desired values of the control variable; in our example, the function will create (we can even say that it will **feed** the loop with) subsequent values from the following set: 0, 1, 2 .. 97, 98, 99; note: in this case, the range() function starts its job from 0 and finishes it one step (one integer number) before the value of its argument;
- note the _pass_ keyword inside the loop body – it does nothing at all; it's an **empty instruction** – we put it here because the for loop's syntax demands at least one instruction inside the body (by the way – if, elif, else and while express the same thing)

Our next examples will be a bit more modest in the number of loop repetitions.

```python
for i in range(10):
    print("The value of i is currently", i)
```

Note:

- the loop has been executed ten times (it's the range() function's argument)
- the last control variable's value is 9 (not 10, as **it starts from 0**, not from 1)

The range() function invocation may be equipped with two arguments, not just one:

```python
for i in range(2, 8):
	print("The value of i is currently", i)
```

In this case, the first argument determines the initial (first) value of the control variable.

The last argument shows the first value the control variable will not be assigned.

Note: the range() function **accepts only integers as its arguments**, and generates sequences of integers.

Can you guess the output of the program? Run it to check if you were right now, too.

The first value shown is 2 (taken from the range()'s first argument.)

The last is 7 (although the range()'s second argument is 8).

---

The range() function may also accept **three arguments** – take a look at the code in the editor.

```python
for i in range(2, 8, 3):
    print("The value of i is currently", i)
```

The third argument is an **increment** – it's a value added to control the variable at every loop turn (as you may suspect, the **default value of the increment is 1**).

The first argument passed to the range() function tells us what the **starting** number of the sequence is (hence 2 in the output). The second argument tells the function where to **stop** the sequence (the function generates numbers up to the number indicated by the second argument, but does not include it). Finally, the third argument indicates the **step**, which actually means the difference between each number in the sequence of numbers generated by the function.

2 (starting number) → 5 (2 increment by 3 equals 5 – the number is within the range from 2 to 8) → 8 (5 increment by 3 equals 8 – the number is not within the range from 2 to 8, because the stop parameter is not included in the sequence of numbers generated by the function.)

Note: 
- if the set generated by the range() function is empty, the loop won't execute its body at all.
- the set generated by the range() has to be sorted in **ascending order**. There's no way to force the range() to create a set in a different form when the range() function accepts exactly two arguments. This means that the range()'s second argument must be greater than the first.

Let's have a look at a short program whose task is to write some of the first powers of two:

```python
power = 1
for expo in range(16):
    print("2 to the power of", expo, "is", power)
    power *= 2
```

The expo variable is used as a control variable for the loop, and indicates the current value of the _exponent_. The exponentiation itself is replaced by multiplying by two. Since 20 is equal to 1, then 2 × 1 is equal to 21, 2 × 21 is equal to 22, and so on.

---

**LAB**   Essentials of the _for_ loop – counting mississippily

## Scenario

Do you know what Mississippi is? Well, it's the name of one of the states and rivers in the United States. The Mississippi River is about 2,340 miles long, which makes it the second longest river in the United States (the longest being the Missouri River). It's so long that a single drop of water needs 90 days to travel its entire length!

The word _Mississippi_ is also used for a slightly different purpose: to _count mississippily_.

If you're not familiar with the phrase, we're here to explain to you what it means: it's used to count seconds.

The idea behind it is that adding the word _Mississippi_ to a number when counting seconds aloud makes them sound closer to clock-time, and therefore "one Mississippi, two Mississippi, three Mississippi" will take approximately an actual three seconds of time! It's often used by children playing hide-and-seek to make sure the seeker does an honest count.

Your task is very simple here: write a program that uses a for loop to "count mississippily" to five. Having counted to five, the program should print to the screen the final message "Ready or not, here I come!"

Use the skeleton we've provided in the editor.

  **EXTRA INFO**  

Note that the code in the editor contains two elements which may not be fully clear to you at this moment: the import time statement, and the sleep() method. We're going to talk about them soon.

For the time being, we'd just like you to know that we've imported the time module and used the sleep() method to suspend the execution of each subsequent print() function inside the for loop for one second, so that the message outputted to the console resembles an actual counting. Don't worry - you'll soon learn more about modules and methods.

```python
import time

# Write a for loop that counts to five.
for i in range(5):
    # Body of the loop - print the loop iteration number and the word "Mississippi".
    print("Mississippi", )
    # Body of the loop - use: time.sleep(1)
    time.sleep(1)
# Write a print function with the final message.
print("Ready or not, here I come!")
```

---

## The break and continue statements

So far, we've treated the body of the loop as an indivisible and inseparable sequence of instructions that are performed completely at every turn of the loop. However, as a developer, you could be faced with the following choices:

- it appears that it's unnecessary to continue the loop as a whole; you should refrain from further execution of the loop's body and go further;
- it appears that you need to start the next turn of the loop without completing the execution of the current turn.

Python provides two special instructions for the implementation of both these tasks. Let's say for the sake of accuracy that their existence in the language is not necessary – an experienced programmer is able to code any algorithm without these instructions. Such additions, which don't improve the language's expressive power, but only simplify the developer's work, are sometimes called **syntactic candy**, or syntactic sugar.

These two instructions are:

- break – exits the loop immediately, and unconditionally ends the loop's operation; the program begins to execute the nearest instruction after the loop's body;
- continue – behaves as if the program has suddenly reached the end of the body; the next turn is started and the condition expression is tested immediately.

Both these words are **keywords**.

Now we'll show you two simple examples to illustrate how the two instructions work. Look at the code in the editor. Run the program and analyze the output. Modify the code and experiment.

```python
# break - example

print("The break instruction:")
for i in range(1, 6):
    if i == 3:
        break
    print("Inside the loop.", i)
print("Outside the loop.")


# continue - example

print("\nThe continue instruction:")
for i in range(1, 6):
    if i == 3:
        continue
    print("Inside the loop.", i)
print("Outside the loop.")
```

```output
The break instruction:
Inside the loop. 1
Inside the loop. 2
Outside the loop.

The continue instruction:
Inside the loop. 1
Inside the loop. 2
Inside the loop. 4
Inside the loop. 5
Outside the loop.
```

Let's return to our program that recognizes the largest among the entered numbers. We'll convert it twice, using the break and continue instructions.

Analyze the code, and judge whether and how you would use either of them.

The break variant goes here:

```python
largest_number = -99999999
counter = 0

while True:
    number = int(input("Enter a number or type -1 to end the program: "))
    if number == -1:
        break
    counter += 1
    if number > largest_number:
        largest_number = number

if counter != 0:
    print("The largest number is", largest_number)
else:
    print("You haven't entered any number.")
```


And now the continue variant:

```python
largest_number = -99999999
counter = 0

number = int(input("Enter a number or type -1 to end program: "))

while number != -1:
    if number == -1:
        continue
    counter += 1

    if number > largest_number:
        largest_number = number
    number = int(input("Enter a number or type -1 to end the program: "))

if counter:
    print("The largest number is", largest_number)
else:
    print("You haven't entered any number.")
```

Look carefully, the user enters the first number **before** the program enters the while loop. The subsequent number is entered when the program is **already in the loop**.

---

**LAB**   The break statement – Stuck in a loop

## Scenario

The break statement is used to exit/terminate a loop.

Design a program that uses a while loop and continuously asks the user to enter a word unless the user enters "chupacabra" as the secret exit word, in which case the message "You've successfully left the loop." should be printed to the screen, and the loop should terminate.

Don't print any of the words entered by the user. Use the concept of conditional execution and the break statement.

```python
secret_word = "chupacabra"
word = input("Enter a word")

while True:
    if word == secret_word:
        print("You've successfully left the loop.")
        break
        
    else:
        word = input("Enter a word")
```

---

**LAB**   The _continue_ statement – the Ugly Vowel Eater

## Scenario

The continue statement is used to skip the current block and move ahead to the next iteration, without executing the statements inside the loop.

It can be used with both the while and for loops.

Your task here is very special: you must design a vowel eater! Write a program that uses:

- a for loop;
- the concept of conditional execution (_if-elif-else_)
- the continue statement.

Your program must:

- ask the user to enter a word;
- use ==user_word = user_word.upper()== to convert the word entered by the user to upper case; we'll talk about **string methods** and the upper() method very soon – don't worry;
- use conditional execution and the continue statement to "eat" the following vowels _A_, _E_, _I_, _O_, _U_ from the inputted word;
- print the uneaten letters to the screen, each one of them on a separate line.

```python
# Prompt the user to enter a word
user_word = input("Enter a word: ")
# and assign it to the user_word variable.
vowels = "aeiou"
for letter in user_word:
    # Complete the body of the for loop.
	print(letter)
	# How to remove vowels?
    if letter in vowels
    letter = letter.replace(a, "")
	    
    print(letter)
```

2.
```python
user_word = input("Enter a word: ")

for letter in user_word:
#    print(letter)
    x = letter.replace("a", "")
    print(x)
```
