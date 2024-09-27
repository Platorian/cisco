**A literal is data whose values are determined by the literal itself**.

As this is a difficult concept to understand, a good example may be helpful.

Take a look at the following set of digits: `123`

Can you guess what value it represents? Of course you can ‒ it's _one hundred twenty three_.
But what about this: `c`

Does it represent any value? Maybe. It can be the symbol of the speed of light, for example. It can also be the constant of integration. Or even the length of a hypotenuse in the sense of a Pythagorean theorem. There are many possibilities.

You cannot choose the right one without some additional knowledge.

And this is the clue: **123** is a literal, and **c** is not.

You use literals **to encode data and to put them into your code**.

Types of literals:

```python
print("2")
print(2)
```

The first line looks familiar. The second seems to be erroneous due to the visible lack of quotes.

Try to run it.

If everything goes okay, you'll now see two identical lines.

What happened? What does it mean?

Through this example, you encounter two different types of literals:

- a **string**, which you already know,
- and an **integer** number, something completely new.

##### Integers

Numbers handled by modern computers are of two types:

- **integers**, that is, those which are devoid of the fractional part;
- and **floating-point** numbers (or simply **floats**), that contain (or are able to contain) the fractional part.

The characteristic of the numeric value which determines its kind, range, and application, is called the **type**.

If you encode a literal and place it inside Python code, the form of the literal determines the representation (type) Python will use to **store it in the memory**.

 Python does allow the use of **underscores** in numeric literals. Therefore, you can write this number either like this: `11111111`, or like this: `11_111_111`.

And how do we code negative numbers in Python? As usual ‒ by adding a **minus**. You can write: `-11111111`, or `-11_111_111`.

#####  Octal and hexadecimal numbers

There are two additional conventions in Python that are unknown to the world of mathematics. The first allows us to use numbers in an **octal** representation.

If an integer number is preceded by an 0O or 0o prefix (zero-o), it will be treated as an octal value. This means that the number must contain digits taken from the [0..7] range only.

0o123 is an **octal** number with a (decimal) value equal to 83.

The print() function does the conversion automatically. Try this:

```python
print(0o123)
```

The second convention allows us to use **hexadecimal** numbers. Such numbers should be preceded by the prefix 0x or 0X (zero-x).

0x123 is a **hexadecimal** number with a (decimal) value equal to 291. The print() function can manage these values too. Try this:

```python
print(0x123)
```

##### Floats

Now it's time to talk about another type, which is designed to represent and to store the numbers that (as a mathematician would say) have a **non-empty decimal fraction**.

They are the numbers that have (or may have) a fractional part after the decimal point, and although such a definition is very poor, it's certainly sufficient for what we wish to discuss.

Whenever we use a term like _two and a half_ or _minus zero point four_, we think of numbers which the computer considers **floating-point** numbers:

```output
 2.5
-0.4
```

##### Coding floats

Let's see how this convention is used to record numbers that are very small (in the sense of their absolute value, which is close to zero).

A physical constant called _Planck's constant_ (and denoted as _h_), according to the textbooks, has the value of: **6.62607 x 10-34**.

If you would like to use it in a program, you should write it this way:

**` 6.62607E-34 `**

Note: the fact that you've chosen one of the possible forms of coding float values doesn't mean that Python will present it the same way.

---

We've shown it already, but we want to emphasize this phenomenon once more: **a string can be empty** ‒ it may contain no characters at all.

**LAB**

```python
print('"I\'m\n""learning""')
print('"""python"""')
```

Expected output:

![[../IMG/Pasted image 20240625095028.png]]

---

**SECTION SUMMARY**

1. **Literals** are notations for representing some fixed values in code. Python has various types of literals - for example, a literal can be a number (numeric literals, e.g., `123`), or a string (string literals, e.g., "I am a literal.").

2. The **binary system** is a system of numbers that employs _2_ as the base. Therefore, a binary number is made up of 0s and 1s only, e.g., `1010` is _10_ in decimal.

Octal and hexadecimal numeration systems, similarly, employ _8_ and _16_ as their bases respectively. The hexadecimal system uses the decimal numbers and six extra letters.

3. **Integers** (or simply **int**s) are one of the numerical types supported by Python. They are numbers written without a fractional component, e.g., `256`, or `-1` (negative integers).

4. **Floating-point** numbers (or simply **float**s) are another one of the numerical types supported by Python. They are numbers that contain (or are able to contain) a fractional component, e.g., `1.27`.

5. To encode an apostrophe or a quote inside a string, you can either use the escape character, e.g., `'I\'m happy.'`, or open and close the string using an opposite set of symbols to the ones you wish to encode, e.g., `"I'm happy."` to encode an apostrophe, and `'He said "Python", not "typhoon"'` to encode a (double) quote.

6. **Boolean values** are the two constant objects `True` and `False` used to represent truth values (in numeric contexts `1` is `True`, while `0` is `False`.

  

**Extra**  

There is one more, special literal that is used in Python: the `None` literal. This literal is a `NoneType` object, and it is used to represent **the absence of a value**. We'll tell you more about it soon.

