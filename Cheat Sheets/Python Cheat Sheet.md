# Python Cheat Sheet

- PRINT

```
print "Python Cheat Sheet"
print 'Python Cheat Sheet'
print "Python " + "Cheat Sheet"

print """Python
Cheat
Sheet"""

print "There\'s"

name = "Python"
print "Hello %s" % (name)

print "This is the %s %s %s" % ("Python", "Cheat", "Sheet")
```

- VARIABLES

```
cheat_sheet = "Python"
number = 5
guess = True
answer = raw_input("What is your name?")
```

- ARITHMETIC

```
addition = 12381 + 91817
subtraction = 981 - 312
multiplication = 38 * 902
division = 540 / 45
modulo = 15 % 2
PEMDAS = 129 * 1345 + 120 / 6 - 12
```

- UPDATING VARIABLES

```
number = 50
print "This is a number"
new_number = 10
number = number - new_number

money = 40
price = 7.50
sales_tax = .08 * price
price += sales_tax
money -= price
```

- COMMENTS

```
# this is a comment
```

- NUMBERS

```
1 = integer
0.1 = float
5.6 = float

quotient = 7/2 = 3
quotient1 = 7./2 = 3.5
quotient2 = 7/2. = 3.5
quotient3 = 7./2. = 3.5
quotient4 = float(7)/2 = 3.5
```

- BOOLEANS

```
a = True
b = False
```

- DATA TYPES

```
age = 28
print "I am " + str(age) + " years old!"
>>> "I am 28 years old!"

number1 = "100"
number2 = "10"
string_addition = number1 + number2 
# string_addition now has a value of "10010"
int_addition = int(number1) + int(number2)
# int_addition has a value of 110

string_num = "7.5"
print float(string_num)
>>> 7.5

string_int = "10"
numeric_int = 12
print float(string_int)
print float(numeric_int)
>>> 10.0
>>> 12.0
```

- INDEX

```
p = "python"[0]
a = "cheat"[3]
```

- STRING METHODS

```
word = "Python Cheat Sheet"
print len(word)
>>> 18

word = "Python Cheat Sheet"
print word.lower()
>>> python cheat sheet

word = "Python Cheat Sheet"
print word.upper()
>>> PYTHON CHEAT SHEET

word = "PythonCheatSheet"
print word.isalpha()
>>> True

word = "Python Cheat Sheet"
print word.isalpha()
>>> False

pi = 3.14
print str(pi)
>>> 3.14

Methods that use dot notation only work with strings.
On the other hand, len() and str() can work on other data types.

print type(42)
print type(4.2)
print type('spam')

>>> <type 'int'>
>>> <type 'float'>
>>> <type 'str'>

```

- CONTROL FLOW

```
equal to ==
not equal to !=
less than <
greater than >
less than or equal to <=
greater than or equal to>=
```

- AND/OR

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

not is evaluated first;
and is evaluated next;
or is evaluated last.
```

- CONDITIONAL STATEMENT

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

- FUNCTIONS

```
def square(n):
  """Returns the square of a number."""
  squared = n ** 2
  print "%d squared is %d." % (n, squared)
  return squared
print square(10)

def power(base, exponent):  # Add your parameters here!
  result = base ** exponent
  print "%d to the power of %d is %d." % (base, exponent, result)

power(37, 4)  # Add your arguments here!

Typically, when you call a function, you should pass in the same number of arguments as there are parameters.
When defining a function, placeholder [variables] are called parameters.
When using, or calling, a function, inputs into the function are called arguments.

def one_good_turn(n):
  return n + 1
def deserves_another(n):
  return one_good_turn(n) + 2

def cube(number):
  return number * number * number

def by_three(number):
  if number % 3 == 0:
    return cube(number)
  else:
    return False

def biggest_number(*args):
  print max(args)
  return max(args)
    
def smallest_number(*args):
  print min(args)
  return min(args)

def distance_from_zero(arg):
  print abs(arg)
  return abs(arg)

biggest_number(-10, -5, 5, 10)
smallest_number(-10, -5, 5, 10)
distance_from_zero(-10)

>>> 10
>>> -10
>>> 10

def hotel_cost(nights):
  return 140 * nights

def plane_ride_cost(city):
  if city == "Charlotte":
    return 183
  elif city == "Tampa":
    return 220
  elif city == "Pittsburgh":
    return 222
  elif city == "Los Angeles":
    return 475

def rental_car_cost(days):
  cost = days * 40
  if days >= 7:
    cost -= 50
  elif days >= 3:
    cost -= 20
  return cost

def trip_cost(city, days, spending_money):
  return rental_car_cost(days) + hotel_cost(days) + plane_ride_cost(city) + spending_money

print trip_cost("Los Angeles", 5, 600)
```

- MODULES

```
import math
print math.sqrt(25)

from math import sqrt
print sqrt(25)

from module import *

import math # Imports the math module
everything = dir(math) # Sets everything to a list of things from math
print everything # Prints 'em all!
```

- LISTS

```
names = ["python", "cheat", "sheet"]
print names[1]
>>> cheat

letters = ['a', 'b', 'c']
letters.append('d')
print len(letters)
print letters

>>> 4
>>> ['a', 'b', 'c', 'd']

letters = ['a', 'b', 'c', 'd', 'e']
slice = letters[1:3]
print slice
print letters

>>> ['b', 'c']
>>> ['a', 'b', 'c', 'd', 'e']

suitcase = ["sunglasses", "hat", "passport", "laptop", "suit", "shoes"]
# The first and second items (index zero and one)
first = suitcase[0:2]
# Third and fourth items (index two and three)
middle = suitcase[2:4]
# The last two items (index four and five)
last = suitcase[4:6]

animals = "catdogfrog"
# The first three characters of animals
cat = animals[:3]
# The fourth through sixth characters
dog = animals[3:6]
# From the seventh character to the end
frog = animals[6:]

animals = ["aardvark", "badger", "duck", "emu", "fennec fox"]
duck_index = animals.index("duck")# Use index() to find "duck"
# Your code here!
animals.insert(duck_index,"cobra")
print animals # Observe what prints after the insert operation

>>> ['aardvark', 'badger', 'cobra', 'duck', 'emu', 'fennec fox']
```

- Loops

```
my_list = [1,9,3,8,5,7]
for number in my_list:
  # Your code here
  print 2 * number

>>> 2
>>> 18
>>> 6
>>> 16
>>> 10
>>> 14
```