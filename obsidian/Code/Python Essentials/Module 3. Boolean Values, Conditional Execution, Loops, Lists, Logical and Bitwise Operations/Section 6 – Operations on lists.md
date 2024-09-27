Now we want to show you one important, and very surprising, feature of lists, which strongly distinguishes them from ordinary variables.

We want you to memorize it ‒ it may affect your future programs, and cause severe problems if forgotten or overlooked.

Take a look at the snippet in the editor.

```python
list_1 = [1]
list_2 = list_1
list_1[0] = 2
print(list_2)
```

```output
[2]
```

The program:

- creates a one-element list named list_1;
- assigns it to a new list named list_2;
- changes the only element of list_1;
- prints out list_2.

The surprising part is the fact that the program will output: [2], not [1], which seems to be the obvious solution.

Lists (and many other complex Python entities) are stored in different ways than ordinary (scalar) variables.

You could say that:

- the name of an ordinary variable is the **name of its content**;
- the name of a list is the name of a **memory location where the list is stored**.

Read these two lines once more ‒ the difference is essential for understanding what we are going to talk about next.

The assignment: list_2 = list_1 copies the name of the array, not its contents. In effect, the two names (list_1 and list_2) identify the same location in the computer memory. Modifying one of them affects the other, and vice versa.

---

Fortunately, the solution is at your fingertips ‒ it's called a **slice**.

A slice is an element of Python syntax that allows you to **make a brand new copy of a list, or parts of a list**.

It actually copies the list's contents, not the list's name.

This is exactly what you need. Take a look at the snippet below:

```python
list_1 = [1]
list_2 = list_1[:]
list_1[0] = 2
print(list_2)
```

Its output is [1].

This inconspicuous part of the code described as [:] is able to produce a brand new list.

One of the most general forms of the slice looks as follows:

`my_list[start:end]`

As you can see, it resembles indexing, but the colon inside makes a big difference.

A slice of this form **makes a new (target) list, taking elements from the source list ‒ the elements of the indices from start to end - 1**.

Note: not to end but to end - 1. An element with an index equal to end is the first element which **does not take part in the slicing**.

Using negative values for both start and end is possible (just like in indexing).

```python
# Copying the entire list.
list_1 = [1]
list_2 = list_1[:]
list_1[0] = 2
print(list_2)

# Copying some part of the list.
my_list = [10, 8, 6, 4, 2]
new_list = my_list[1:3]
print(new_list)
```

---

This is how **negative indices** work with the slice:

```python
my_list = [10, 8, 6, 4, 2]
new_list = my_list[1:-1]
print(new_list)
```

```output
[8, 6, 4]
```

If the start specifies an element lying further than the one described by the end (from the list's beginning), the slice will be **empty.** 

If you omit the start in your slice, it is assumed that you want to get a slice beginning at the element with index 0.

Similarly, if you omit the end in your slice, it is assumed that you want the slice to end at the element with the index len(my_list).

---

**More about the _del_ instruction**

The previously described del instruction is able to **delete more than just a list's elements at once ‒ it can delete slices too**:

```python
my_list = [10, 8, 6, 4, 2]
del my_list[1:3]
print(my_list)
```

Note: in this case, the slice **doesn't produce any new list**!

The snippet's output is: [10, 4, 2].

You can **all the elements** at once **[:],** The list becomes empty, and the output is: [].

Removing the slice from the code changes its meaning dramatically.
The del instruction will **delete the list itself, not its content**.

The print() function invocation will then cause a runtime error.

---

**The in and not in operators**

Python offers two very powerful operators, able to **look through the list in order to check whether a specific value is stored inside the list or not**.

These operators are:

```python
elem in my_list
elem not in my_list
```

The first of them (in) checks if a given element (its left argument) is currently stored somewhere inside the list (the right argument) ‒ the operator returns True in this case.

The second (not in) checks if a given element (its left argument) is absent in a list ‒ the operator returns True in this case.

Look at the code in the editor. The snippet shows both operators in action. Can you guess its output? Run the program to check if you were right.

```python
my_list = [0, 3, 12, 8, 2]

print(5 in my_list)
print(5 not in my_list)
print(12 in my_list)
```

```output
False
True
True
```

---

**Lists – some simple programs**

Now we want to show you some simple programs utilizing lists.

The first of them tries to find the greater value in the list. Look at the code in the editor.

```python
my_list = [17, 3, 11, 5, 1, 9, 7, 15, 13]
largest = my_list[0]

for i in range(1, len(my_list)):
    if my_list[i] > largest:
        largest = my_list[i]

print(largest)
```

Output: **17**

The concept is rather simple ‒ we temporarily assume that the first element is the largest one, and check the hypothesis against all the remaining elements in the list.

The code outputs 17 (as expected).

The code may be rewritten to make use of the newly introduced form of the for loop:

```python
my_list = [17, 3, 11, 5, 1, 9, 7, 15, 13]
largest = my_list[0]

for i in my_list:
    if i > largest:
        largest = i

print(largest)
```

The program above performs one unnecessary comparison, when the first element is compared with itself. If you need to save computer power, you can use a slice:

```python
my_list = [17, 3, 11, 5, 1, 9, 7, 15, 13]
largest = my_list[0]

for i in my_list[1:]:
    if i > largest:
        largest = i

print(largest)
```

The question is: which of these two actions consumes more computer resources ‒ just one comparison, or slicing almost all of a list's elements?

Now let's find the location of a given element inside a list:

```python
my_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
to_find = 5
found = False

for i in range(len(my_list)):
    found = my_list[i] == to_find
    if found:
        break

if found:
    print("Element found at index", i)
else:
    print("absent")
```

Note:

- the target value is stored in the to_find variable;
- the current status of the search is stored in the found variable (True/False)
- when found becomes True, the for loop is exited.

Let's assume that you've chosen the following numbers in the lottery: `3, 7, 11, 42, 34, 49`.

The numbers that have been drawn are: `5, 11, 9, 42, 3, 49`.

The question is: how many numbers have you hit?

This program will give you the answer:

```python
drawn = [5, 11, 9, 42, 3, 49]
bets = [3, 7, 11, 42, 34, 49]
hits = 0

for number in bets:
    if number in drawn:
        hits += 1

print(hits)
```

Note:

- the drawn list stores all the drawn numbers;
- the bets list stores your bets;
- the hits variable counts your hits.

The program output is: 4.

---

**LAB**   Operating with lists ‒ basics

## Scenario

Imagine a list ‒ not very long, not very complicated, just a simple list containing some integer numbers. Some of these numbers may be repeated, and this is the clue. We don't want any repetitions. We want them to be removed.

Your task is to write a program which removes all the number repetitions from the list. The goal is to have a list in which all the numbers appear not more than once.

Note: assume that the source list is hard-coded inside the code ‒ you don't have to enter it from the keyboard. Of course, you can improve the code and add a part that can carry out a conversation with the user and obtain all the data from her/him.

Hint: we encourage you to create a new list as a temporary work area ‒ you don't need to update the list in situ.

We've provided no test data, as that would be too easy. You can use our skeleton instead.

```python
my_list = [1, 2, 4, 4, 1, 4, 2, 6, 2, 9]
#
# Write your code here.
#
print("The list with unique elements only:")
print(my_list)
```

> **Solution**

```python
my_list = [1, 2, 4, 4, 1, 4, 2, 6, 2, 9]
new = []

for dupe in my_list:
	if dupe not in new:
		new.append(dupe)

print("The list with unique elements only:")
print(new)
```

---

**SECTION SUMMARY**

- If you have a list list_1, then the following assignment: list_2 = list_1 does not make a copy of the list_1 list, but makes the variables list_1 and list_2 **point to one and the same list in memory**. For example:

```python
vehicles_one = ['car', 'bicycle', 'motor']
print(vehicles_one) # outputs: ['car', 'bicycle', 'motor']

vehicles_two = vehicles_one
del vehicles_one[0] # deletes 'car'
print(vehicles_two) # outputs: ['bicycle', 'motor']
```

- If you want to copy a list or part of the list, you can do it by performing **slicing**:

```python
colors = ['red', 'green', 'orange']

copy_whole_colors = colors[:]  # copy the entire list
copy_part_colors = colors[0:2]  # copy part of the list
```

- You can use **negative indices** to perform slices, too. For example:

```python
sample_list = ["A", "B", "C", "D", "E"]
new_list = sample_list[2:-1]
print(new_list)  # outputs: ['C', 'D']
```

- The start and end parameters are **optional** when performing a slice: list[start:end], e.g.:

```python
my_list = [1, 2, 3, 4, 5]
slice_one = my_list[2: ]
slice_two = my_list[ :2]
slice_three = my_list[-2: ]

print(slice_one)  # outputs: [3, 4, 5]
print(slice_two)  # outputs: [1, 2]
print(slice_three)  # outputs: [4, 5]
```

- You can **delete slices** using the del instruction:

```python
my_list = [1, 2, 3, 4, 5]
del my_list[0:2]
print(my_list)  # outputs: [3, 4, 5]

del my_list[:]
print(my_list)  # deletes the list content, outputs: []
```

- You can test if some items **exist in a list or not** using the keywords in and not in, e.g.:

```python
my_list = ["A", "B", 1, 2]

print("A" in my_list)  # outputs: True
print("C" not in my_list)  # outputs: True
print(2 not in my_list)  # outputs: False
```


