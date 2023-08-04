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

pi = 3.14
print str(pi)
>>> 3.14

Methods that use dot notation only work with strings.
On the other hand, len() and str() can work on other data types.
```
