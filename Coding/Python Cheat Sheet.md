# Python Cheat Sheet

## Print

- Print a string

```
print "Python Cheat Sheet"
print 'Python Cheat Sheet'
```

- Print a concatenate string

```
print "Python " + "Cheat Sheet"
```

- Print a multi-line string

```
print """Python
Cheat
Sheet"""
```

- Print a string escaping backslashes

```
print "There\'s"
```

- Print a format string

```
name = "Python"
print "Hello %s" % (name)
```

```
print "This is the %s %s %s" % ("Python", "Cheat", "Sheet")
```

## Variables

- String

```
cheat_sheet = "Python"
```

- Number

```
number = 5
```

- Boolean

```
guess = True
```

- Raw input

```
answer = raw_input("What is your name?")
```

## Arithmetic

- Addition

```
12381 + 91817
>>> 104198
```

- Subtraction

```
981 - 312
>>> 669
```

- Multiplication

```
38 * 902
>>> 34276
```

- Division

```
540 / 45
>>> 12
```

- Exponent

```
10 ** 2
>>> 100
```

- Modulo (remainder)

```
15 % 2
>>> 1
```

- PEMDAS

```
129 * 1345 + 120 / 6 - 12
>>> 173513
```

## Updating Variables

- Update a variable

```
number = 50
print "This is a number"
new_number = 10
number = number - new_number
```

- Update a variable (short-hand)

```
money = 40
price = 7.50
sales_tax = .08 * price
price += sales_tax
money -= price
```

## Comments

- Write a comment

```
# this is a comment
```

- Write a multi-line comment

```
"""this is
a
multi-line comment"""
```

## Numbers

- Integer

```
1 = integer
```

- Float

```
0.1 = float
```

- Rounding

```
quotient = 7/2 = 3
quotient1 = 7./2 = 3.5
quotient2 = 7/2. = 3.5
quotient3 = 7./2. = 3.5
quotient4 = float(7)/2 = 3.5
```

## Booleans

- TRUE/FALSE

```
a = True
b = False
```

- AND/OR/NOT

not is evaluated first;
and is evaluated next;
or is evaluated last.

```
True and True = True
True and False = False
False and True = False
False and False = False

True or True = True
True or False = True
False or True = True 
False or False = False

not True = False
not False = True
```

## Data Types

- String, Integer, Float data types

```
print type('spam')
print type(42)
print type(4.2)
>>> <type 'str'>
>>> <type 'int'>
>>> <type 'float'>
```

- Cast a integer as a string

```
age = 28
print "I am " + str(age) + " years old!"
>>> "I am 28 years old!"
```

- Cast a string as a integer

```
number1 = "100"
number2 = "10"
string_addition = number1 + number2
print string_addition
>>> "10010"
int_addition = int(number1) + int(number2)
print int_addition
>>> 110
```

- Cast a string as a float

```
string_num = "7.5"
print float(string_num)
>>> 7.5
```

- Cast a string and integer as a float

```
string_int = "10"
numeric_int = 12
print float(string_int)
print float(numeric_int)
>>> 10.0
>>> 12.0
```

## Index

```
p = "python"[0]
a = "cheat"[3]
```

## String Methods

Methods that use dot notation only work with strings.
On the other hand, len() and str() can work on other data types.

- Length

```
word = "Python Cheat Sheet"
print len(word)
>>> 18
```

- Lowercase

```
word = "Python Cheat Sheet"
print word.lower()
>>> python cheat sheet
```

- Uppercase

```
word = "Python Cheat Sheet"
print word.upper()
>>> PYTHON CHEAT SHEET
```

- Alpha

```
word = "PythonCheatSheet"
print word.isalpha()
>>> True

word = "Python Cheat Sheet"
print word.isalpha()
>>> False
```

- Startswith

```
word = "Python Cheat Sheet"
print word.startswith("P")
>>> True
```

- Index

```
word = "Python Cheat Sheet"
print word.index("Cheat")
>>> 7
```

- Strip

```
word = "Python Cheat Sheet"
print word.strip()
>>> Python Cheat Sheet
```

- Replace

```
word = "Python Cheat Sheet!"
print word.replace("!","?")
>>> Python Cheat Sheet?
```

- Encode

```
word = "Python Cheat Sheet"
print word.encode("utf-8")
>>> b'Python Cheat Sheet'
```

Rjust/Ljust

```
word = "Python Cheat Sheet"
print word.rjust(25)
>>>                          Python Cheat Sheet
```

## Control Flow

- Equal to

```
==
```

- Not equal to

```
!=
```

- Less than

```
<
```

- Greater than

```
>
```

- Less than or equal to

```
<=
```

- Greater than or equal to

```
>=
```

## Conditional Statement

- If/Elif/Else

```
if 8 < 9:
  print "Eight is less than nine!"

if 8 > 9:
  print "I don't get printed!"
else:
  print "I get printed!"

if 8 > 9:
  print "I don't get printed!"
elif 8 < 9:
  print "I get printed!"
else:
  print "I also don't get printed!"
```

## Functions

Typically, when you call a function, you should pass in the same number of arguments as there are parameters.
When defining a function, placeholder [variables] are called parameters.
When using, or calling, a function, inputs into the function are called arguments.

- Create a function

```
def square(n):
  """Returns the square of a number."""
  squared = n ** 2
  print "%d squared is %d." % (n, squared)
  return squared
square(10)
>>> 10 sqaured is 100
```

## Modules

- Import a module

```
import math
print math.sqrt(25)
```

- Import a function from a module

```
from math import sqrt
print sqrt(25)
```

- Import everything from a module

```
from module import *
```

- List all functions within a module

```
import math
everything = dir(math)
print everything
```

## Tuples

- Create a tuple

```
tuple = ("item1", "item2", "item3")
print tuple
>>> ("item1", "item2", "item3")
```

## Lists

- Create a list

```
names = ["python", "cheat", "sheet"]
print names[1]
>>> cheat
```

- Append to a list

```
letters = ['a', 'b', 'c']
letters.append('d')
print len(letters)
>>> 4
print letters
>>> ['a', 'b', 'c', 'd']
```

- List slicing

```
letters = ['a', 'b', 'c', 'd', 'e']
slice = letters[1:3]
print slice
>>> ['b', 'c']
print letters
>>> ['a', 'b', 'c', 'd', 'e']
```

```
soc = ["security", "analyst", "siem", "edr", "tip", "soar"]
# The first and second items (index zero and one)
first = soc[0:2]
# Third and fourth items (index two and three)
middle = soc[2:4]
# The last two items (index four and five)
last = soc[4:6]
```

- String slicing

```
name = "pythoncheatsheet"
# The first three characters of name
pyt = name[:3]
# The fourth through sixth characters
hon = name[3:6]
# From the seventh character to the end
cheatsheet = name[6:]
```

- Insert an item to a list

```
soc = ["security", "analyst", "siem", "edr", "tip"]
siem_index = soc.index("siem")
soc.insert(siem_index,"soar")
print soc
>>> ["security", "analyst", "tip", "siem", "edr", "tip"]
```

- Remove an item from a list

```
soc = ['security', 'analyst', 'siem', 'edr']
soc.remove('siem')
print soc
>>> ['security', 'analyst', 'edr']
```

- Pop an item from a list

```
n = [1, 3, 5]
n.pop(1)
# Returns 3 (the item at index 1)
print n
>>> [1, 5]
```

- Remove an item from a list

```
n = [1, 3, 5]
n.remove(1)
# Removes 1 from the list, NOT the item at index 1
print n
>>> [3, 5]
```

- Delete an item from a list

```
n = [1, 3, 5]
del(n[1])
# Doesn't return anything
print n
>>> [1, 5]
```

- Print the max of a list

```
letters = ['a', 'b', 'c', 'd', 'e']
print max(letters)
>>> e
```

- Print the min of a list

```
letters = ['a', 'b', 'c', 'd', 'e']
print min(letters)
>>> a
```

- Reverse a list

```
letters = ['a', 'b', 'c', 'd', 'e']
print letters.reverse()
>>> ['e', 'd', 'c', 'b', 'a']
```

- Clear a list

```
letters = ['a', 'b', 'c', 'd', 'e']
letters.clear()
print letters
>>> []
```

- Sort a list

```
numbers = [18, 34, 1, 4, 98]
numbers.sort()
print numbers
>>> [1, 4, 18, 34, 98]
```

- Map a list

```
numbers = ["1", "2", "3"]
print list(map(float, numbers))
>>> [1.0, 2.0, 3.0]
```

## Loops

- For Loop

```
my_list = [1, 9, 3, 8, 5, 7]
for number in my_list:
  print 2 * number
>>> 2
>>> 18
>>> 6
>>> 16
>>> 10
>>> 14
```

- While Loop

```
a = 1
while a < 5:
  a += 1
  print a
>>> 2
>>> 3
>>> 4
>>> 5
```

- Range

```
for i in range(5):
  print i+6
>>> 6
>>> 7
>>> 8
>>> 9
>>> 10
```

## Dictionaries

- Create a dictionary

```
letters = {'a' : 1, 'b' : 2, 'c' : 3}
print letters['a']
>>> 1
print letters['b']
>>> 2
print letters['c']
>>> 3
```

- Print the keys of a dictionary

```
letters = {'a' : 1, 'b' : 2, 'c' : 3}
print letters.keys()
>>> letters{'a', 'b', 'c'}
```

- Print the values of a dictionary

```
letters = {'a' : 1, 'b' : 2, 'c' : 3}
print letters.values()
>>> letters{1, 2, 3}
```

- Print the items of a dictionary

```
letters = {'a' : 1, 'b' : 2, 'c' : 3}
print letters.items()
>>> letters{'a' : 1, 'b' : 2, 'c' : 3}
```

- Update a dictionary

```
letters = {'a' : 1, 'b' : 2, 'c' : 3}
letters.update({"a": 0})
print letters
>>> {'a' : 0, 'b' : 2, 'c' : 3}
```

- Pop an item from a dictionary

```
letters = {'a' : 1, 'b' : 2, 'c' : 3}
letters.pop("a")
print letters
>>> {'b' : 2, 'c' : 3}
```

- Delete an item from a dictionary

```
letters = {'a' : 1, 'b' : 2, 'c' : 3}
del letters['a']
print letters
>>> {'b' : 2, 'c' : 3}
```

## Classes

- Create a class

```
class Person(object):
  def __init__(self, name, age, is_hungry):
    self.name = name
    self.age = age
    self.is_hungry = is_hungry

man = Person("James", 2, True)
woman = Person("Splunk", 1, False)
baby = Person("Defender", 7, True)

print man.name, man.age, man.is_hungry
print woman.name, woman.age, woman.is_hungry
print baby.name, baby.age, baby.is_hungry
```

- Create a class with functions (methods)

```
class Person(object):
  is_alive = True
  def __init__(self, name, age):
    self.name = name
    self.age = age
  def description(self):
    print self.name
    print self.age
    
man = Person("James", 36)
man.description()
```

- Create a class with inheritance

```
class Customer(object):
  """Produces objects that represent customers."""
  def __init__(self, customer_id):
    self.customer_id = customer_id

  def display_cart(self):
    print "I'm a string that stands in for the contents of your shopping cart!"

class ReturningCustomer(Customer):
  """For customers of the repeat variety."""
  def display_order_history(self):
    print "I'm a string that stands in for your order history!"

monty_python = ReturningCustomer("ID: 12345")
monty_python.display_cart()
monty_python.display_order_history()
```

## Files

- Read a file

```
f = open("top-100.txt")
print f.read()
```

- Readline a file

```
f = open("top-100.txt")
print f.readlines()
```

- Write a file

```
f = open("top-100.txt", "w")
print f.write("Python Cheat Sheet!")
f.close()
```

- Append a file

```
f = open("top-100.txt", "1")
print f.write("Python Cheat Sheet!")
f.close()
```

## Exceptions & Error Handling

- Try/Except/Finally

```
try:
  f = open("top-100.txt")
except FileNotFoundError:
  print "The file does not exist"
except Exception as e:
  print e
finally:
  print "this message"
```
