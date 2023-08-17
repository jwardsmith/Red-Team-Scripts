# Python Cheat Sheet

### Print

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

### Variables

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

### Arithmetic

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

### Updating Variables

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

### Comments

```
# this is a comment
```

### Numbers

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

### Booleans

```
a = True
b = False
```

### Data Types

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

### Index

```
p = "python"[0]
a = "cheat"[3]
```

### String Methods

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
```

### Control Flow

```
equal to ==
not equal to !=
less than <
greater than >
less than or equal to <=
greater than or equal to>=
```

### AND/OR

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

### Conditional Statement

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

### Functions

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

### Modules

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

### Lists

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

backpack = ['xylophone', 'dagger', 'tent', 'bread loaf']
backpack.remove('dagger')
print backpack

>>> ['xylophone', 'tent', 'bread loaf']

n = [1, 3, 5]
n.pop(1)
# Returns 3 (the item at index 1)
print n
# prints [1, 5]

n.remove(1)
# Removes 1 from the list,
# NOT the item at index 1
print n
# prints [3, 5]

del(n[1])
# Doesn't return anything
print n
# prints [1, 5]
```

### Loops

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

start_list = [5, 3, 1, 2, 4]
square_list = []
# Your code here!
for number in start_list:
  square_list.append(number ** 2)
square_list.sort()
print square_list

>>> [1, 4, 9, 16, 25]

names = ["Adam","Alex","Mariah","Martine","Columbus"]
for name in names:
  print name

>>> Adam
>>> Alex
>>> Mariah
>>> Martine
>>> Columbus

webster = {
  "Aardvark" : "A star of a popular children's cartoon show.",
  "Baa" : "The sound a goat makes.",
  "Carpet": "Goes on the floor.",
  "Dab": "A small amount."
}

# Add your code below!
for word in webster:
  print webster[word]

>>> A star of a popular children's cartoon show.
>>> Goes on the floor.
>>> A small amount.
>>> The sound a goat makes.

a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
for number in a:
  if number % 2 == 0:
    print number

>>> 0
>>> 2
>>> 4
>>> 6
>>> 8
>>> 10
>>> 12
```

### Dictionaries

```
# Assigning a dictionary with three key-value pairs to residents:
residents = {'Puffin' : 104, 'Sloth' : 105, 'Burmese Python' : 106}
print residents['Puffin'] # Prints Puffin's room number
# Your code here!
print residents['Sloth']
print residents['Burmese Python']

>>> 104
>>> 105
>>> 106

menu = {} # Empty dictionary
menu['Chicken Alfredo'] = 14.50 # Adding new key-value pair
print menu['Chicken Alfredo']
# Your code here: Add some dish-price pairs to menu!
menu['Hamburger'] = 8.50
menu['Pizza Slice'] = 3.50
menu['Salad'] = 10.00
print "There are " + str(len(menu)) + " items on the menu."
print menu

>>> 14.5
>>> There are 4 items on the menu.
>>> {'Chicken Alfredo': 14.5, 'Pizza Slice': 3.5, 'Hamburger': 8.5, 'Salad': 10.0}

# key - animal_name : value - location 
zoo_animals = { 'Unicorn' : 'Cotton Candy House',
'Sloth' : 'Rainforest Exhibit',
'Bengal Tiger' : 'Jungle House',
'Atlantic Puffin' : 'Arctic Exhibit',
'Rockhopper Penguin' : 'Arctic Exhibit'}
# A dictionary (or list) declaration may break across multiple lines
# Removing the 'Unicorn' entry. (Unicorns are incredibly expensive.)
del zoo_animals['Unicorn']
# Your code here!
del zoo_animals['Sloth']
del zoo_animals['Bengal Tiger']
zoo_animals['Rockhopper Penguin'] = 'Plains Exhibit'
print zoo_animals

>>> {'Atlantic Puffin': 'Arctic Exhibit', 'Rockhopper Penguin': 'Plains Exhibit'}

inventory = {
  'gold' : 500,
  'pouch' : ['flint', 'twine', 'gemstone'], # Assigned a new list to 'pouch' key
  'backpack' : ['xylophone','dagger', 'bedroll','bread loaf']
}
# Adding a key 'burlap bag' and assigning a list to it
inventory['burlap bag'] = ['apple', 'small ruby', 'three-toed sloth']
# Sorting the list found under the key 'pouch'
inventory['pouch'].sort() 
# Your code here
inventory['pocket'] = ['seashell', 'strange berry', 'lint']
inventory['backpack'].sort()
inventory['backpack'].remove('dagger')
inventory['gold'] = inventory['gold'] + 50

shopping_list = ["banana", "orange", "apple"]

stock = {
  "banana": 6,
  "apple": 0,
  "orange": 32,
  "pear": 15
}
prices = {
  "banana": 4,
  "apple": 2,
  "orange": 1.5,
  "pear": 3
}
# Write your code below!
def compute_bill(food):
  total = 0
  for item in food:
    if stock[item] > 0:
      total = total + prices[item]
      stock[item] = stock[item] - 1
  return total
print compute_bill(shopping_list)

>>> 5.5
```
