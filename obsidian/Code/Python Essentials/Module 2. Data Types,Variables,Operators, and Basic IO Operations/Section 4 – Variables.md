If you want to **give a name to a variable**, you must follow some strict rules:

- the name of the variable must be composed of upper-case or lower-case letters, digits, and the character _ (underscore)
- the name of the variable must begin with a letter;
- the underscore character is a letter;
- upper- and lower-case letters are treated as different (a little differently than in the real world – _Alice_ and _ALICE_ are the same first names, but in Python they are two different variable names, and consequently, two different variables);
- the name of the variable must not be any of Python's reserved words (the keywords – we'll explain more about this soon).

Note that the same restrictions apply to function names.

Here are some **correct**, but not always convenient variable names:

- `MyVariable`
- `i`
- `l`
- `t34`
- `Exchange_Rate`
- `counter`
- `days_to_christmas`
- `TheNameIsTooLongAndHardlyReadable`
- `_`

These variable names are also **correct**:

- `Adiós_Señora`
- `sûr_la_mer`
- `Einbahnstraße`
- `переменная`.

And now for some **incorrect** names:

- `10t` (does not begin with a letter)
- `!important` (does not begin with a letter)
- `exchange rate` (contains a space).

The [PEP 8 -- Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/) recommends the following naming convention for variables and functions in Python:

- variable names should be lowercase, with words separated by underscores to improve readability (e.g., var, my_variable)
- function names follow the same convention as variable names (e.g., fun, my_function)
- it's also possible to use mixed case (e.g., myVariable), but only in contexts where that's already the prevailing style, to retain backward compatibility with the adopted convention.

---

## Keywords

Take a look at the list of words that play a very special role in every Python program.

`['False', 'None', 'True', 'and', 'as', 'assert', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']`

They are called **keywords** or (more precisely) **reserved keywords**. They are reserved because **you mustn't use them as names**: neither for your variables, nor functions, nor any other named entities you want to create.

The meaning of the reserved word is **predefined**, and mustn't be changed in any way.

Fortunately, due to the fact that Python is case-sensitive, you can modify any of these words by changing the case of any letter, thus creating a new word, which is not reserved anymore.

For example ‒ **you can't name** your variable like this:

`import`

You mustn't have a variable named in such a way ‒ it is prohibited. But you can do this instead:

`Import`

These words might be a mystery to you now, but you'll soon learn the meaning of them.

---

Your task is to:

- create the variables: `john`, `mary`, and `adam`;
- assign values to the variables. The values must be equal to the numbers of fruit possessed by John, Mary, and Adam respectively;
- having stored the numbers in the variables, print the variables on one line, and separate each of them with a comma;
- now create a new variable named `total_apples` equal to the addition of the three previous variables.
- print the value stored in `total_apples` to the console;
- **experiment with your code**: create new variables, assign different values to them, and perform various arithmetic operations on them (e.g., +, -, *, /, //, etc.). Try to print a string and an integer together on one line, e.g., `"Total number of apples:"` and `total_apples`.

```python
john = 3
mary = 5
adam = 6

print(f"{john}, {mary}, {adam}")

total_apples = john + mary + adam

print(f"The total amount of apples is: {total_apples}")
```

![[../IMG/Pasted image 20240625114940.png]]

---

**LAB**   Variables ‒ a simple converter

Miles and kilometers are units of length or distance.

Bearing in mind that `1` mile is equal to approximately `1.61` kilometres, complete the program in the editor so that it converts:

- miles to kilometres;
- kilometres to miles.

 Expected output:

7.38 miles is 11.88 kilometres
12.25 kilometres is 7.61 miles

```python
kilometers = 12.25
miles = 7.38

miles_to_kilometers = 11.88
kilometers_to_miles = 7.61

print(miles, "miles is", round(miles_to_kilometers, 2), "kilometers")
print(kilometers, "kilometers is", round(kilometers_to_miles, 2), "miles")
```

---

## Scenario

Take a look at the code in the editor: it reads a `float` value, puts it into a variable named `x`, and prints the value of a variable named `y`. Your task is to complete the code in order to evaluate the following expression:

3x3 - 2x2 + 3x - 1

The result should be assigned to `y`.

Remember that classical algebraic notation likes to omit the multiplication operator ‒ you need to use it explicitly. Note how we change data type to make sure that `x` is of type `float`.

Keep your code clean and readable, and test it using the data we've provided, each time assigning it to the `x` variable (by hardcoding it). Don't be discouraged by any initial failures. Be persistent and inquisitive.

```python
x = 0
x = float(x)
y = 3 * x**3 - 2 * x**2 + 3 * x - 1
print("y =", y)

x = 1
x = float(x)
y = 3 * x**3 - 2 * x**2 + 3 * x - 1
print("y =", y)

x = -1
x = float(x)
y = 3 * x**3 - 2 * x**2 + 3 * x - 1
print("y =", y)
```

---

**SECTION SUMMARY**

1. A **variable** is a named location reserved to store values in the memory. A variable is created or initialized automatically when you assign a value to it for the first time. (2.1.4.1)
  
3. Each variable must have a unique name ‒ an **identifier**. A legal identifier name must be a non-empty sequence of characters, must begin with the underscore(`_`), or a letter, and it cannot be a Python keyword. The first character may be followed by underscores, letters, and digits. Identifiers in Python are case-sensitive.
  
5. Python is a **dynamically-typed** language, which means you don't need to _declare_ variables in it. (2.1.4.3) To assign values to variables, you can use a simple assignment operator in the form of the equal (`=`) sign, i.e., `var **=** 1`.
  
7. You can also use **compound assignment operators** (shortcut operators) to modify values assigned to variables, for example: `var **+=** 1`, or `var **/=** 5 * 2`.
  
9. You can assign new values to already existing variables using the assignment operator or one of the compound operators, for example:

