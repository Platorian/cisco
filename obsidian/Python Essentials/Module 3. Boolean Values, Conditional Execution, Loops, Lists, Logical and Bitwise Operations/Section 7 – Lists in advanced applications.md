### Lists in lists
Lists can consist of scalars (namely numbers) and elements of a much more complex structure (you've already seen such examples as strings, booleans, or even other lists in the previous Section Summary lessons). Let's have a closer look at the case where a **list's elements are just lists**.

We often find such **arrays** in our lives. Probably the best example of this is a **chessboard**.

A chessboard is composed of rows and columns. There are eight rows and eight columns. Each column is marked with the letters A through H. Each line is marked with a number from one to eight.

The location of each field is identified by letter-digit pairs. Thus, we know that the bottom left corner of the board (the one with the white rook) is A1, while the opposite corner is H8.

Let's assume that we're able to use the selected numbers to represent any chess piece. We can also assume that **every row on the chessboard is a list**.

```python
row = []

for i in range(8):
    row.append(WHITE_PAWN)
```

It builds a list containing eight elements representing the second row of the chessboard ‒ the one filled with pawns (assume that WHITE_PAWN is a **predefined symbol** representing a white pawn).

###  List comprehensions

The same effect may be achieved by means of a **list comprehension**, the special syntax used by Python in order to fill massive lists.

A list comprehension is actually a list, but **created on-the-fly during program execution, and is not described statically**.

Take a look at the snippet:

```python
row = [WHITE_PAWN for i in range(8)]
```

The part of the code placed inside the brackets specifies:

- the data to be used to fill the list (WHITE_PAWN)
- the clause specifying how many times the data occurs inside the list (for i in range(8))

Take a look at some other **list comprehension examples**:

**Example #1:**

```python
squares = [x ** 2 for x in range(10)]
```

The snippet produces a ten-element list filled with squares of ten integer numbers starting from zero `(0, 1, 4, 9, 16, 25, 36, 49, 64, 81)`

**Example #2:**

```python
twos = [2 ** i for i in range(8)]
```

The snippet creates an eight-element array containing the first eight powers of two `(1, 2, 4, 8, 16, 32, 64, 128)`

**Example #3:**

```python
odds = [x for x in squares if x % 2 != 0 ]
```

The snippet makes a list with only the odd elements of the squares list.

---

