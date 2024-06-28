## Indexing lists

How do you change the value of a chosen element in the list?

Let's **assign a new value of 111 to the first element** in the list. We do it this way:

```python
numbers = [10, 5, 7, 2, 1]
print("Original list contents:", numbers)  # Printing original list contents.

numbers[0] = 111
print("New list contents: ", numbers)  # Current list contents.
```

And now we want **the value of the fifth element to be copied to the second element** ‒ can you guess how to do it?

```python
numbers = [10, 5, 7, 2, 1]
print("Original list contents:", numbers)  # Printing original list contents.

numbers[0] = 111
print("\nPrevious list contents:", numbers)  # Printing previous list contents.

numbers[1] = numbers[4]  # Copying value of the fifth element to the second.
print("New list contents:", numbers)  # Printing current list contents.
```

The value inside the brackets which selects one element of the list is called an **index**, while the operation of selecting an element from the list is known as **indexing**.

We're going to use the print() function to print the list content each time we make the changes. This will help us follow each step more carefully and see what's going on after a particular list modification.

Note: all the indices used so far are literals. Their values are fixed at runtime, but **any expression can be the index**, too. This opens up lots of possibilities.

## Accessing list content

Each of the list's elements may be accessed separately. For example, it can be printed:

```python
print(numbers[0]) # Accessing the list's first element.
```

Assuming that all of the previous operations have been completed successfully, the snippet will send 111 to the console.

```python
numbers = [10, 5, 7, 2, 1]
print("Original list contents:", numbers)  # Printing original list contents.

numbers[0] = 111
print("\nPrevious list contents:", numbers)  # Printing previous list contents.

numbers[1] = numbers[4]  # Copying value of the fifth element to the second.
print("Previous list contents:", numbers)  # Printing previous list contents.

print("\nList length:", len(numbers))  # Printing the list's length.
```

## The _len()_ function

The **length of a list** may vary during execution. New elements may be added to the list, while others may be removed from it. This means that the list is a very dynamic entity.

If you want to check the list's current length, you can use a function named len() (its name comes from _length_).

The function takes the **list's name as an argument, and returns the number of elements currently stored** inside the list (in other words ‒ the list's length).

## Removing elements from a list

Any of the list's elements may be **removed** at any time ‒ this is done with an instruction named del (delete). Note: it's an **instruction**, not a function.

You have to point to the element to be removed ‒ it'll vanish from the list, and the list's length will be reduced by one.

```python
del numbers[1]
print(len(numbers))
print(numbers)
```

**You can't access an element which doesn't exist** ‒ you can neither get its value nor assign it a value. Both of these instructions will cause runtime errors now:

---

## Negative indices are legal

It may look strange, but negative indices are legal, and can be very useful.

An element with an index equal to -1 is **the last one in the list**.

```python
numbers = [111, 7, 2, 1]
print(numbers[-1])
```

---

**LAB**   The basics of lists

## Scenario

There once was a hat. The hat contained no rabbit, but a list of five numbers: 1, 2, 3, 4, and 5.

Your task is to:

- write a line of code that prompts the user to replace the middle number in the list with an integer number entered by the user (Step 1)
- write a line of code that removes the last element from the list (Step 2)
- write a line of code that prints the length of the existing list (Step 3).

Ready for this challenge?

```python
hat_list = [1, 2, 3, 4, 5] # This is an existing list of numbers hidden in the hat.

# Step 1: write a line of code that prompts the user
# to replace the middle number with an integer number entered by the user.
hat_list[2] = input("Replace: ")
 
# Step 2: write a line of code that removes the last element from the list.
hat_list.pop(-1)
  
# Step 3: write a line of code that prints the length of the existing list.
print("")
print(len(hat_list))
print(hat_list)
```

---

## Functions vs. methods

A **method is a specific kind of function** ‒ it behaves like a function and looks like a function, but differs in the way in which it acts, and in its invocation style.

A **function doesn't belong to any data** ‒ it gets data, it may create new data and it (generally) produces a result.

A method does all these things, but is also able to **change the state of a selected entity**.

**A method is owned by the data it works for, while a function is owned by the whole code**.

This also means that invoking a method requires some specification of the data from which the method is invoked.

It may sound puzzling here, but we'll deal with it in depth when we delve into object-oriented programming.

In general, a typical function invocation may look like this:

`result = function(arg)`

The function takes an argument, does something, and returns a result.

A typical method invocation usually looks like this:

`result = data.method(arg)`

Note: the name of the method is preceded by the name of the data which owns the method. Next, you add a **dot**, followed by the **method name**, and a pair of **parenthesis enclosing the arguments**.

The method will behave like a function, but can do something more ‒ it can **change the internal state of the data** from which it has been invoked.

You may ask: why are we talking about methods, not about lists?

This is an essential issue right now, as we're going to show you how to add new elements to an existing list. This can be done with methods owned by all the lists, not by functions.

---

## Adding elements to a list: append() and insert()

A new element may be _glued_ to the end of the existing list:

```python
list.append(value)
```

Such an operation is performed by a method named append(). It takes its argument's value and puts it **at the end of the list** which owns the method.

The list's length then increases by one.

The insert() method is a bit smarter ‒ it can add a new element **at any place in the list**, not only at the end.

```python
list.insert(location, value)
```

It takes two arguments:

- the first shows the required location of the element to be inserted; note: all the existing elements that occupy locations to the right of the new element (including the one at the indicated position) are shifted to the right, in order to make space for the new element;
- the second is the element to be inserted.

```python
print(numbers)

###

numbers.append(4)

print(len(numbers))
print(numbers)

###

numbers.insert(0, 222)
print(len(numbers))
print(numbers)

#
numbers.insert(1, 333)
```

You can **start a list's life by making it empty** (this is done with an empty pair of square brackets) and then adding new elements to it as needed.

Take a look at the snippet in the editor. Try to guess its output after the for loop execution. Run the program to check if you were right.

```python
my_list = []  # Creating an empty list.

for i in range(5):
    my_list.append(i + 1)

print(my_list)
```

It'll be a sequence of consecutive integer numbers from 1 (you then add one to all the appended values) to 5.

---

## Making use of lists

The `for` loop has a special variant that can **process lists** very effectively ‒ let's take a look at that.

```python
my_list = [10, 1, 8, 3, 5]
total = 0

for i in range(len(my_list)):
    total += my_list[i]

print(total)
```

Let's assume that you want to **calculate the sum of all the values stored in the my_list list**.

You need a variable whose sum will be stored and initially assigned a value of 0 ‒ its name will be total. (Note: we're not going to name it sum as Python uses the same name for one of its built-in functions: sum(). **Using the same name would generally be considered bad practice**.) Then you add to it all the elements of the list using the for loop. Take a look at the snippet in the editor.

Let's comment on this example:

- the list is assigned a sequence of five integer values;
- the i variable takes the values 0, 1, 2, 3, and 4, and then it indexes the list, selecting the subsequent elements: the first, second, third, fourth and fifth;
- each of these elements is added together by the += operator to the total variable, giving the final result at the end of the loop;
- note the way in which the len() function has been employed ‒ it makes the code independent of any possible changes in the list's contents.

## The second aspect of the for loop

But the for loop can do much more. It can hide all the actions connected to the list's indexing, and deliver all the list's elements in a handy way.

This modified snippet shows how it works:

```python
my_list = [10, 1, 8, 3, 5]
total = 0

for i in my_list:
    total += i

print(total)
```

What happens here?

- the for instruction specifies the variable used to browse the list (i here) followed by the in keyword and the name of the list being processed (my_list here)
- the i variable is assigned the values of all the subsequent list's elements, and the process occurs as many times as there are elements in the list;
- this means that you use the i variable as a copy of the elements' values, and you don't need to use indices;
- the len() function is not needed here, either.

---

## Lists in action

Let's leave lists aside for a short moment and look at one intriguing issue.

Imagine that you need to rearrange the elements of a list, i.e., reverse the order of the elements: the first and the fifth as well as the second and fourth elements will be swapped. The third one will remain untouched.

Question: how can you swap the values of two variables?

Take a look at the snippet:

```python
variable_1 = 1
variable_2 = 2

variable_2 = variable_1
variable_1 = variable_2
```

If you do something like this, you would **lose the value previously stored** in variable_2. Changing the order of the assignments will not help. You need a **third variable that serves as an auxiliary storage**.

This is how you can do it:

```python
variable_1 = 1
variable_2 = 2

auxiliary = variable_1
variable_1 = variable_2
variable_2 = auxiliary
```

Python offers a more convenient way of doing the swap – take a look:

```python
variable_1 = 1
variable_2 = 2

variable_1, variable_2 = variable_2, variable_1
```

Clear, effective and elegant - isn't it?

Now you can easily **swap** the list's elements to **reverse their order:**

```python
my_list = [10, 1, 8, 3, 5]

my_list[0], my_list[4] = my_list[4], my_list[0]
my_list[1], my_list[3] = my_list[3], my_list[1]

print(my_list)
```

```output
[5, 3, 8, 1, 10]
```

It looks fine with five elements.

Will it still be acceptable with a list containing 100 elements? No, it won't.

Can you use the for loop to do the same thing automatically, irrespective of the list's length? Yes, you can.

This is how we've done it:

```python
for i in range(length // 2):
    my_list[i], my_list[length - i - 1] = my_list[length - i - 1], my_list[i]

print(my_list)
```

Note:

- we've assigned the length variable with the current list's length (this makes our code a bit clearer and shorter)
- we've launched the for loop to run through its body length // 2 times (this works well for lists with both even and odd lengths, because when the list contains an odd number of elements, the middle one remains untouched)
- we've swapped the ith element (from the beginning of the list) with the one with an index equal to (length - i - 1) (from the end of the list); in our example, for i equal to 0 the (length - i - 1) gives 4; for i equal to 1, it gives 3 ‒ this is exactly what we needed.

Lists are extremely useful, and you'll encounter them very often.

---

**LAB**   The basics of lists ‒ the Beatles

## Scenario

The Beatles were one of the most popular music groups of the 1960s, and the best-selling band in history. Some people consider them to be the most influential act of the rock era. Indeed, they were included in _Time_ magazine's compilation of the 20th Century's 100 most influential people.

The band underwent many line-up changes, culminating in 1962 with the line-up of John Lennon, Paul McCartney, George Harrison, and Richard Starkey (better known as Ringo Starr).

  

Write a program that reflects these changes and lets you practice with the concept of lists. Your task is to:

- step 1: create an empty list named beatles;
- step 2: use the append() method to add the following members of the band to the list: John Lennon, Paul McCartney, and George Harrison;
- step 3: use the for loop and the append() method to prompt the user to add the following members of the band to the list: Stu Sutcliffe, and Pete Best;
- step 4: use the del instruction to remove Stu Sutcliffe and Pete Best from the list;
- step 5: use the insert() method to add Ringo Starr to the beginning of the list.


> **Solution**

```python
beatles = []

# step 1

print("Step 1:", beatles)

# step 2

print("Step 2:", beatles)

beatles.append("John Lennon")
beatles.append("Paul McCartney")
beatles.append("George Harrison")

# step 3

print("Step 3:", beatles)

for i in beatles:
	if "pete best" in beatles:
	break

	add = input("ADD: ")
	beatles.append(add)

# step 4

print("Step 4:", beatles)
del beatles[-1]

# step 5

print("Step 5:", beatles)
beatles.insert(0, "Ringo Starr")
 
# testing list legth

print("Step 6:", beatles)
print("The Fab", len(beatles))
```

---

**SECTION SUMMARY**

1. The **list is a type of data** in Python used to **store multiple objects**. It is an **ordered and mutable collection** of comma-separated items between square brackets, e.g.:

```python
my_list = [1, None, True, "I am a string", 256, 0]
```

- Lists can be **indexed and updated**, e.g.:

```python
my_list = [1, None, True, 'I am a string', 256, 0]
print(my_list[3])  # outputs: I am a string
print(my_list[-1])  # outputs: 0

my_list[1] = '?'
print(my_list)  # outputs: [1, '?', True, 'I am a string', 256, 0]

my_list.insert(0, "first")
my_list.append("last")
print(my_list)  # outputs: ['first', 1, '?', True, 'I am a string', 256, 0, 'last']
```

- Lists can be **nested**, e.g.:

```python
my_list = [1, 'a', ["list", 64, [0, 1], False]]
```

- List elements and lists can be **deleted**, e.g.:

```python
my_list = [1, 2, 3, 4]
del my_list[2]
print(my_list)  # outputs: [1, 2, 4]

del my_list  # deletes the whole list
```

- Lists can be **iterated** through using the for loop, e.g.:

```python
my_list = ["white", "purple", "blue", "yellow", "green"]

for color in my_list:
    print(color)
```

- The len() function may be used to **check the list's length**, e.g.:

```python
my_list = ["white", "purple", "blue", "yellow", "green"]
print(len(my_list))  # outputs 5

del my_list[2]
print(len(my_list))  # outputs 4
```

- A typical **function** invocation looks as follows: result = function(arg), while a typical **method** invocation looks like this:result = data.method(arg).

