Computer logic

Have you noticed that the conditions we've used so far have been very simple, not to say, quite primitive? The conditions we use in real life are much more complex. Let's look at this sentence:

_If we have some free time, ==and== the weather is good, we will go for a walk._

We've used the conjunction and, which means that going for a walk depends on the simultaneous fulfilment of these two conditions. In the language of logic, such a connection of conditions is called a **conjunction**. And now another example:

_If you are in the mall ==or== I am in the mall, one of us will buy a gift for Mom._

The appearance of the word or means that the purchase depends on at least one of these conditions. In logic, such a compound is called a **disjunction**.

It's clear that Python must have operators to build conjunctions and disjunctions. Without them, the expressive power of the language would be substantially weakened. They're called **logical operators**.

# The _and_ operator

One logical conjunction operator in Python is the word _and_. It's a **binary operator with a priority that is lower than the one expressed by the comparison operators**. It allows us to code complex conditions without the use of parentheses like this one:

```python
counter > 0 and value == 100
```

The result provided by the and operator can be determined on the basis of the **truth table**.

If we consider the conjunction of A ==and== B, the set of possible values of arguments and corresponding values of the conjunction looks as follows:

![[../IMG/Pasted image 20240628074725.png]]

# The _or_ operator

A disjunction operator is the word or. It's a **binary operator with a lower priority than and** (just like + compared to *). Its truth table is as follows:

![[../IMG/Pasted image 20240628074813.png]]

# The _not_ operator

In addition, there's another operator that can be applied to the construction of conditions. It's a **unary operator performing a logical negation**. Its operation is simple: it turns truth into falsehood and falsehood into truth.

This operator is written as the word not, and its **priority is very high: the same as the unary + and -**. Its truth table is simple:

![[../IMG/Pasted image 20240628074834.png]]

---

## Bitwise operators

However, there are four operators that allow you to **manipulate single bits of data**. They are called **bitwise operators**.

They cover all the operations we mentioned before in the logical context, and one additional operator. This is the xor (as in **exclusive or**) operator, and is denoted as ^ (caret).

Here are all of them:

- & (ampersand) ‒ bitwise conjunction;
- | (bar) ‒ bitwise disjunction;
- ~ (tilde) ‒ bitwise negation;
- ^ (caret) ‒ bitwise exclusive or (xor).

![[../IMG/Pasted image 20240628075846.png]]

Let's make it easier:

- & requires exactly two 1s to provide 1 as the result;
- | requires at least one 1 to provide 1 as the result;
- ^ requires exactly one 1 to provide 1 as the result.

Let us add an important remark: the arguments of these operators **must be integers**; we must not use floats here.

The difference in the operation of the logical and bit operators is important: **the logical operators do not penetrate into the bit level of its argument**. They're only interested in the final integer value.

Bitwise operators are stricter: they deal with **every bit separately**. If we assume that the integer variable occupies 64 bits (which is common in modern computer systems), you can imagine the bitwise operation as a 64-fold evaluation of the logical operator for each pair of bits of the arguments. This analogy is obviously imperfect, as in the real world all these 64 operations are performed at the same time (simultaneously).

---

## Logical vs. bit operations

We'll now show you an example of the difference in operation between the logic and bit operations. Let's assume that the following assignments have been performed:

```python
i = 15
j = 22
```

If we assume that the integers are stored with 32 bits, the bitwise image of the two variables will be as follows:

`i: 00000000000000000000000000001111`
`j: 00000000000000000000000000010110`

The assignment is given:

```python
log = i and j
```

We are dealing with a logical conjunction here. Let's trace the course of the calculations. Both variables i and j are not zeros, so will be deemed to represent True. Consulting the truth table for the and operator, we can see that the result will be True. No other operations are performed.

`log = True`

Now the bitwise operation ‒ here it is:

```python
bit = 1 & j
```

The & operator will operate with each pair of corresponding bits separately, producing the values of the relevant bits of the result. Therefore, the result will be as follows:

![[../IMG/Pasted image 20240628080609.png]]

These bits correspond to the integer value of six.

Let's look at the negation operators now. First the logical one:

```python
logneg = not 1
```

The `logneg` variable will be set to `False` ‒ nothing more needs to be done.

The bitwise negation goes like this:

```python
bitneg = ~1
```

It may be a bit surprising: the bitneg variable value is -16. This may seem strange, but isn't at all. If you wish to learn more, you should check out the binary numeral system and the rules governing two's complement numbers.

![[../IMG/Pasted image 20240628080928.png]]

Each of these two-argument operators can be used in **abbreviated form**. These are the examples of their equivalent notations:

![[../IMG/Pasted image 20240628080953.png]]

---

## How do we deal with single bits?

We'll now show you what you can use bitwise operators for. Imagine that you're a developer obliged to write an important piece of an operating system. You've been told that you're allowed to use a variable assigned in the following way:

`flag_register = 0x1234`

You may be faced with the following tasks:

1. **Check the state of your bit** ‒ you want to find out the value of your bit; comparing the whole variable to zero will not do anything, because the remaining bits can have completely unpredictable values, but you can use the following conjunction property:

```python
x & 1 = x
x & 0 = 0
```

If you apply the & operation to the flag_register variable along with the following bit image:

`00000000000000000000000000001000`

(note the 1 at your bit's position) as the result, you obtain one of the following bit strings:

- 0000000000000000000000000000==1==000 if your bit was set to 1
- 0000000000000000000000000000==0==000 if your bit was reset to 0

Such a sequence of zeros and ones, whose task is to grab the value or to change the selected bits, is called a **bit mask**.

Let's build a bit mask to detect the state of your bit. It should point to **the third bit**. That bit has the weight of 23 = 8. A suitable mask could be created by the following declaration:

```python
the_mask = 8
```

You can also make a sequence of instructions depending on the state of your bit. Here it is:

```python
if flag_register & the_mask:
    # My bit is set.
else:
    # My bit is reset.
```

**Reset your bit** ‒ you assign a zero to the bit while all the other bits must remain unchanged; let's use the same property of the conjunction as before, but let's use a slightly different mask ‒ exactly as below:

`11111111111111111111111111110111`

Note that the mask was created as a result of the negation of all the bits of the_mask variable. Resetting the bit is simple, and looks like this (choose the one you like more):

```python
flag_register = flag_register & ~the_mask
flag_register &= ~the_mask
```

**Set your bit** ‒ you assign a 1 to your bit, while all the remaining bits must remain unchanged; use the following disjunction property:

```python
x | 1 = 1
x | 0 = x
```

You're now ready to set your bit with one of the following instructions:

```python
flag_register = flag_register | the_mask
flag_register |= the_mask
```

**Negate your bit** ‒ you replace a 1 with a 0 and a 0 with a 1. You can use an interesting property of the xor operator:

```python
x ^ 1 = ~x
x ^ 0 = x
```

and negate your bit with the following instructions:

```python
flag_register = flag_register ^ the_mask
flag_register ^= the_mask
```

---

## Binary left shift and binary right shift

Python offers yet another operation relating to single bits: **shifting**. This is applied only to **integer** values, and you mustn't use floats as arguments for it.

You already apply this operation very often and quite unconsciously. How do you multiply any number by ten? Take a look:

12345 × 10 = 123450

As you can see, **multiplying by ten is in fact a shift** of all the digits to the left and filling the resulting gap with zero.

Division by ten? Take a look:

12340 ÷ 10 = 1234

Dividing by ten is nothing but shifting the digits to the right.

The same kind of operation is performed by the computer, but with one difference: as two is the base for binary numbers (not 10), **shifting a value one bit to the left thus corresponds to multiplying it by two**; respectively, **shifting one bit to the right is like dividing by two** (notice that the rightmost bit is lost).

he **shift operators** in Python are a pair of **digraphs**: << and >>, clearly suggesting in which direction the shift will act.

```python
value << bits
value >> bits
```

**The left argument of these operators is an integer value whose bits are shifted. The right argument determines the size of the shift.**

It shows that this operation is certainly not commutative.

```python
var = 17
var_right = var >> 1
var_left = var << 2
print(var, var_left, var_right)
```

Note:

- 17 >> 1 → 17 // 2 (**17** floor-divided by **2 to the power of 1**) → 8 (shifting to the right by one bit is the same as integer division by two)
- 17 << 2 → 17 * 4 (**17** multiplied by **2 to the power of 2**) → 68 (shifting to the left by two bits is the same as integer multiplication by four)

And here is the **updated priority table**, containing all the operators introduced so far:

![[../IMG/Pasted image 20240628082904.png]]

---

**SECTION SUMMARY**

Python supports the following logical operators:

- `and` → if both operands are true, the condition is true, e.g., (True and True) is True,
- `or` → if any of the operands are true, the condition is true, e.g., (True or False) is True,
- `not` → returns false if the result is true, and returns true if the result is false, e.g., not True is False.

2. You can use bitwise operators to manipulate single bits of data. The following sample data:

- `x = 15`, which is `0000 1111` in binary,
- `y = 16`, which is `0001 0000` in binary.

will be used to illustrate the meaning of bitwise operators in Python. Analyze the examples below:

- `&` does a _bitwise and_, e.g., `x & y = 0`, which is `0000 0000` in binary,
- `|` does a _bitwise or_, e.g., `x | y = 31`, which is `0001 1111` in binary,
- `˜` does a _bitwise not_, e.g.,` ˜ x = 240*`, which is `1111 0000` in binary,
- `^` does a _bitwise xor_, e.g., `x ^ y = 31`, which is `0001 1111` in binary,
- `>>` does a _bitwise right shift_, e.g., `y >> 1 = 8`, which is `0000 1000` in binary,
- `<<` does a _bitwise left shift_, e.g., y `<< 3 = 128`, which is `1000 0000` in binary.

* `-16` (decimal from signed 2's complement) -- read more about the [Two's complement](https://en.wikipedia.org/wiki/Two%27s_complement) operation.



