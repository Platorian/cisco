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

