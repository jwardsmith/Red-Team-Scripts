# C# Cheat Sheet

## Introduction

C# is an object-oriented programming language developed by Microsoft in 2000.  It's a high-level language which makes it easy to read and learn, as many of the complexities are abstracted away underneath developer-friendly constructs.

It is also a managed language, which means developers do not have to worry about issues such as memory management.  Unlike unmanaged language like C++, where memory has to be manually allocated and freed, C# features a garbage collector which handles this for you automatically.   C# source code compiles into an Intermediate Language (IL), which when executed, runs inside a Common Language Runtime (CLR).  This CLR translates the IL into machine code on the fly and handles the aforementioned management.

C# and .NET are often used synonymously, but they are different things.  .NET is effectively a set of programming APIs, which expose various functionality as written by Microsoft.  C# is a programming language that is built on top of .NET - as in, C# is used to call .NET APIs.  F# and Visual Basic are also built on top of .NET.

## Data Types

### Value vs Reference

Data types in C# are referred to as "value types" and "reference types".

When a value type is declared, the data is stored in the memory location of the variable.  When a reference type is declared, the data is stored somewhere else in memory and the variable contains a pointer to it.

Reference types are always allocated in heap memory, but value types can be allocated on the heap or on the stack depending on where they're declared.  If a value type is declared inside a method, then it's stored on the stack.  If it's declared in a class, then the data is stored on the heap.  This is because a class is a reference type, which must always be stored on the heap.  Classes and methods will be covered in detail later.

Value types include int, byte, bool, and char.  Reference types include string, arrays and class.

### Integers and Floating Points

An integer is whole number, -2, -1, 0, 1, 2, etc.

If we want an integer to be negative, it should be declared as a "signed" integer.  Otherwise, it can be "unsigned".  Unsigned integers can be larger than signed integers because we're not wasting a "sign" bit.  We can allocate different sizes for an integer in multiples of 8 bits:  8, 16, 32 and 64 bits.

The naming of these types can be a little hard to remember - they are:

Keyword | Size
sbyte |	Signed 8-bit
byte |	Unsigned 8-bit
short |	Signed 16-bit
ushort |	Unsigned 16-bit
int	| Signed 32-bit
uint |	Unsigned 32-bit
long |	Signed 64-bit
ulong |	Unsigned 64-bit

int SInt = -20;
uint UInt = 20;

byte sByte = 256;
Most IDEs will know if you're trying to assign an invalid value to these types.  Since byte is only 8-bits (and unsigned), it cannot accommodate a value larger than 255.

A floating point is a number that can have decimal places, 8.2, 3.14, etc.

There are three types (all of which are signed):

Keyword |	Size
float |	4 bytes
double |	8 bytes
decimal |	16 bytes

When declaring a float or double, the letter F or D should be appended to the value.  You can declare a value that is more precise than the specified data type, but it will only "use" the range that it is able when carrying out any mathematics, etc.

float piFloat = 3.14159265359F
double piDouble = 3.14159265359D;

Console.WriteLine("pi as float: {0}", piFloat);
Console.WriteLine("pi as double: {0}", piDouble);

pi as float: 3.1415927
pi as double: 3.14159265359

### Booleans and Characters

A bool is a true or false value.  It's a fundamental type as most "decisions" in a program are made based on a boolean expression (something that evaluates to true or false).

A char is a single letter or number, represented by an integer.  Those "integers" are standardised in the ASCII and Unicode tables.  Different languages allow different byte sizes for characters, from 1 to 4 bytes.  C# uses 2 bytes, which allows it to use any character in UTF-16.

A character is defined with single quotes.

bool myBool = true;
char myChar = 'A';

### Arrays and Tuples

The array and tuple are both types of collections.  An array can hold multiple values of a single data type; whereas a tuple can hold multiple values but of various data types.  Both types are fast to use at runtime, but they are fixed size.  To initialise an array with values, we can do something like:

int[] intArray = {1, 2, 3, 4, 5};

You can also create an empty array by declaring the number of elements you want to have.  The values in the array are assigned the default value for the relevant data type.  For an integer, that would be 0.

int[] intArray = new int[5];

An element in an array can be accessed by its index.  Arrays are "zero-indexed" which means the first element is index 0, the second is index 1 and so on.  The index of an array is accessed using square brackets, e.g. array[0].

To print the 3rd element:

int[] intArray = {1, 2, 3, 4, 5};
Console.WriteLine("{0}", intArray[2]);

A tuple is declared using parenthesise for both the data types and initial values; and instead of accessing a tuple index via square brackets, we use the period, ..  Each item is given a name like Item1, Item2, etc.

(string, string, int) tuple = ("Charles", "Dickens", 1812);
Console.WriteLine("{0} {1} was born in {2}.", tuple.Item1, tuple.Item2, tuple.Item3);

You may also use a concept called "deconstruction" to assign friendly variable names to your elements.

(string, string, int) tuple = ("Charles", "Dickens", 1812);
(string firstName, string lastName, int dob) = tuple;
Console.WriteLine("{0} {1} was born in {2}.", firstName, lastName, dob);

### Strings

C# has made it very easy to work and manage strings.  A string can be declared using double quotes.

string name = "Rasta Mouse";

There are multiple ways to concatenate strings.  One way is via interpolation, denoted by a prepended $.

string firstName = "Rasta";
string lastName = "Mouse";
string fullName = $"{firstName} {lastName}";
Console.WriteLine(fullName);

Another is by using the + operator.

string firstName = "Rasta";
string lastName = "Mouse";
string fullName = firstName + " " + lastName;
Console.WriteLine(fullName);

Or by using the string.Concat() method.

string firstName = "Rasta";
string lastName = "Mouse";
string fullName = string.Concat(firstName, " ", lastName);
Console.WriteLine(fullName);

In fact, string has lots of really useful methods including Split, Join, Equals, and IsNullOrEmpty/IsNullOrWhiteSpace.

## Variables

### Declaring

A variable is simply a "place to hold and use data".  C# allows you to declare a variable in a few different ways.  The method we've been using up until now is to declare the data type keyword, a variable name, and its value.  Declaring the data type tells the compiler specifically what type of data the variable will hold, which is called "explicit typing".

// explicit
int i1 = 10;

However, you may have noticed the green dotted line underneath the keywords, such as int above.  The tooltip in Rider suggests that we use the var keyword instead.  This is "implicit typing" where the compiler infers the data type based on the value assigned to it.

// implicit
var i2 = 10;

One of the main benefits of using implicit typing is that it can shorten your code and make it more readable.

// explicit
(string, string, int) t1 = ("Charles", "Dickens", 1812);

// implicit
var t2 = ("Charles", "Dickens", 1812);

// implicit with deconstruction

var (firstName:string, lastName:string, dob:int) = ("Charles", "Dickens", 1812);

There are instances where var cannot be used.  One is when declaring a variable without assigning it a value, and another is when the compiler cannot infer from context what the data type is meant to be.

// ok
int i1;

// not ok
var i2;

Every variable declared in C# is mutable, which means it can be changed.  To make a variable immutable, prepend it with the const keyword.

var i1 = 10;
i1 = 20;

const int i2 = 10;
i2 = 20;

### Name Conventions

C# uses different text casing depending on where it's being declared.  Here is a summary of the conventions:


Object | Casing
Classes |	PascalCase
Public Members |	PascalCase
Private Members |	_camelCase
Methods	| PascalCase
Variables	| camelCase
Enums	| PascalCase

We'll see many of these other types as we progress through the course.

### Casting

Casting is the process of converting one data type to another, which comes in two flavours:  "implicit" and "explicit".  In this example, we're declaring an int and then casting it to a double.  This is an implicit cast.

// implicit cast
var i = 20;
double d = i;

However, you cannot implicitly cast a double to an integer - it must be explicitly cast:

// invalid cast
double d1 = 3.14D;
int i1 = d1;

// explicit cast
double d2 = 3.14D;
int i2 = (int)d2;

These two methods exist because explicit casting is typically more "dangerous", as it can result in a loss of data precision.  An integer is a whole number and cannot hold decimal places.  Converting 20 from an integer simply results in 20 as a double.  But converting 3.14 from a double results in 3 as an integer - we lose the .14 precision on the conversion.

Explicit casting exists because the compiler is forcing you to think about (and acknowledge) the conversion, rather than having it handled automatically for you.

Other data types can be cast to each other where it makes sense.  For example, because a char is a really just a Unicode value, you can cast between char's and int's.

var c = 'A';
int i = c;
Console.WriteLine($"{c} == {i}");

c = (char)i;
Console.WriteLine($"{i} == {c}");

However, you cannot convert nonsensically such as a string to a float.

## Collections

### Lists

A List<T> is a collection of generic data types (we'll cover generics in more detail later) that can be accessed by index.  It also contains methods for adding, inserting, removing, searching and sorting the values.  A list can only hold one type of data at a time.

We can create an empty list, or create one with values.

using System.Collections.Generic;

var list1 = new List<int>();
var list2 = new List<int> {1, 2, 3, 4, 5 };

Adding new values can be done with the Add method.

using System;
using System.Collections.Generic;

var integers = new List<int>();

integers.Add(item:1);
integers.Add(item:2);
integers.Add(item:3);
integers.Add(item:4);
integers.Add(item:5);

Console.WriteLine($"The value at index 2 is {integers[2]}.");

Items can be removed based on their known value, or from a given index.

var integers = new List<int> {1, 2, 3, 4, 5 };

// remove a known value
integers.Remove(item:1);

// remove from a given index
integers.RemoveAt(index:3);

foreach(var i:int in integers)
  Console.WriteLine(i);

The Contains method returns a bool if the given value is in the list.

var integers = new List<int> {1, 2, 3, 4, 5 };

if (integers.Contains(item:1))
  Console.WriteLine(1 is present);

And Find can be used to search the list for a value.  The method takes a "predicate" which is written as a lambda expression.  We won't dive into that too much here, but we'll see it again in the LINQ module.  Here I'm searching for the value 3.

var integers = new List<int> {1, 2, 3, 4, 5 };
var item:int = integers.Find(match:v:int => v == 3);

Console.WriteLine(item);

Note that if the value does not exist, the method returns the default value for the list's data type, T.  Another aspect to watch out for is that a list does allow you to add the same value multiple times, and methods such as Remove, Find, and IndexOf return the first occurrence of that data.

### Dictionary

A dictionary stores data in key-value pairs.  The key and value do not need to be of the same type.  In this example, I'm creating a dictionary that will use an int for the keys and a string for the data.

using System;
using System.Collections.Generic;

var dict = new Dictionary<int, string>();

dict.Add(0, "Charles Dickens");
dict.Add(1, "George Orwell");
dict.Add(2, "Mark Twain");

foreach(var kvp:KeyValuePair<int,string> in dict)
  Console.WriteLine($"Key: {kvp.Key} contains: {kvp.Value}.");

Even though I've done it here, the keys do not need to be sequential - they can be any arbitrary values.  Values are usually found by a known key.  The safest way is by using the TryGetValue method, which will return a bool and the associated value.

if (dict.TryGetValue(2, out var value:string))
  Console.WriteLine(value);

Each key in a dictionary must be unique - the program will throw an exception if you attempt to add the same key twice.

var dict = new Dictionary<int, string>();

dict.Add(0, "Charles Dickens");
dict.Add(1, "George Orwell");
dict.Add(2, "Mark Twain");

// this will throw an exception
dict.Add(2, "Jane Austen");

The value associated with a key can be changed:

var dict = new Dictionary<int, string>();

dict.Add(0, "Charles Dickens");
dict.Add(1, "George Orwell");
dict.Add(2, "Mark Twain");

if (dict.ContainsKey(2))
  dict[2] = "Jane Austen";

Note that in this example, 2 is not an "index" it's the literal value of the key.

### Hashtable

The Hashtable is like a stripped-down dictionary that is designed for pure performance.  It does not maintain any order in the collection and allows values to be looked up very quickly.  It's a good candidate when computing against large data sets but for general use, the dictionary is friendlier.

using System;
using System.Collections;

var table = new Hashtable
{
  { 0, "Charles Dickens" },
  { 1, "George Orwell" },
  { 2, "Mark Twain" },
  { 3, "Jane Austen" }
};

foreach(DictionaryEntry entry in table)
  Console.WriteLine($"{entry.Key} : {entry.Value}");

### Queue

There are two main types of queue:  the Queue and the Stack.  The queue is a first-in-first-out (FIFO) collection and the stack is last-in-first-out (LIFO).  These are useful when the order of data is of the strictest importance and can be used in places such as message queues.

To push an object into a queue, use the Enqueue method.  To remove and return the next object, use  Dequeue.

var queue = new Queue<int>();

// add items
queue.Enqueue(item:1);
queue.Enqueue(item:2);
queue.Enqueue(item:3);

// dequeue them all
while (queue.TryDequeue(out var value:int))
  Console.WriteLine(value);

In this example, the printed order is 1, 2, and 3.

The stack functions in the same way using the Push and Pop methods.

var stack = new Stack<int>();

// add items
stack.Push(item:1);
stack.Push(item:2);
stack.Push(item:3);

// remove them all
while (stack.TryPop(out var value:int))
  Console.WriteLine(value);
  
This time, the printed order is 3, 2, and 1.

## Operators

### Mathematical Operators

I'm sure we've all come across mathematical operators before.  There is not much interesting to say about them.  Common ones include:

+ for add.
- for subtract.
* for multiply.
/ for divide.
% for modulus.

using System;

Console.WriteLine(23 + 54); // addition
Console.WriteLine(32 - 12); //subtraction
Console.WriteLine(4 * 5); // multiplication
Console.WriteLine(321 / 44); // division
Console.WriteLine(798 % 8); // modulus

### Logical Operators

Logical operators are used when we want to evaluate an expression in order to obtain a true or false outcome.  This could be as simple as comparing the size of two numbers.  The most common operators are:

== for equals.
> for greater than.
< for less than.
>= for greater than or equal to.
<= for less than or equal to.

The bang ! is used to flip the logic of an operator, most commonly paired with equals.
!= for not equal.

using System;

// generate some random numbers between 0 and 100
var rand = new Random();
var i1:int = rand.Next(0,100);
var i2:int = rand.Next(0,100);

if (i1 == i2) Console.WriteLine("Values are equal");
if (i1 != i2) Console.WriteLine("Values are not equal");
if (i1 > i2) Console.WriteLine("i1 is greater than i2");
if (i1 < i2) Console.WriteLine("i1 is less than i2");
if (i1 >= i2) Console.WriteLine("i1 is greater or equal to i2");
if (i1 <= i2) Console.WriteLine("i1 is less or equal to i2");

### Bitwise Operators

A bitwise operators changes a value at the binary level.   The common bitwise operators are

& for AND.
| for OR.
^ for XOR.
<< for left shift.
>> for right shift.

using System;

// generate some random numbers between 0 and 100
var rand = new Random();
var i1:int = rand.Next(0,100);
var i2:int = rand.Next(0,100)

Console.WriteLine(i1 & i2); // AND
Console.WriteLine(i1 | i2); // OR
Console.WriteLine(i1 ^ i2); // XOR
Console.WriteLine(i1 << i2); // Left Shift
Console.WriteLine(i1 >> i2); // Right Shift

## Control Flow

### If / Else

We've already seen examples of the if statement in a previous module, although it was not explained.  The construct of the statement goes if "condition", followed by the code to execute.  The code inside the curly braces only executes if the condition evaluates to true.

if (condition)
{
  // do something
}

You can add an additional code block that will execute if the condition is false, rather than true.  This is done with the else keyword.

if (condition)
{
  // do something
}
else
{
  // do something else
}

You can also add additional branches using else if.

if (condition)
{
  // do something
}
else if (condition2)
{
  // do something else
}
else
{
  // catch all
}

Each condition is evaluated from top to bottom.  If one is true, the relevant code will execute, the flow will break out and no other conditions will be evaluated.  This allows the final else case to be a kind of "catch all" in the event that every condition evaluates to false.

Multiple logical operators can be combined but this can lead to unexpected results if they're not evaluated in the proper order.  Consider the following example and make a prediction of the outcome.

using System;

var condition1 = true;
var condition2 = false;
var condition3 = false;

if (condition1 || condition2 && condition3)
  Console.WriteLine("Good to go");

It seems that what we're trying to say is that condition1 OR condition2 needs to be true AND condition3 needs to be true as well.  Since condition3 is set to false, the entire expression should come out as false, right?  But it doesn't.

This is due to the order in which the conditions are evaluated - the AND statement is evaluated first, followed by the OR.

"condition2 && condition3" evaluates to "false" because condition2 and condition3 are both currently set to false.  This would also be the case if one of them was true - because it's an AND operator, both condition2 and condition3 would have to be true for that portion to come out as true overall.

The next part of the expression is then evaluated, which is "condition1 || condition2".  Since condition1 is true, this expression comes out as true and the code inside the braces is executed.

To address this, we need to put parenthesise around the OR expression to force it to be evaluated first.

if ((condition1 || condition2) && condition3)
  Console.WriteLine("Good to go");

Now it will evaluate "condition1 || condition2", which is true because condition1 is true.  But then true && condition3 comes out as false, because condition3 is false.  So this time, we don't see the "Good to go" message.  Rider has already correctly evaluated the condition to false.  It has greyed out the line to show that this code is not currently reachable, since as there's no code that changes the state of the conditions.

### Switch

The switch keyword is a pattern-matching construct which allows you to add cases for certain conditions.  This is generally nicer to use than multiple else if statements.  Take the following example:

var animal = "Dog";

if (animal == "Dog")
{
  Console.WriteLine("Woof");
}
else if (animal == "Cat")
{
  Console.WriteLine("Meow");
}
else
{
  Console.WriteLine("Unknown");
}

This can be condensed down into:

var animal = "Dog";
var sound:string = animal switch
{
  "Dog" => "Woof",
  "Cat" => "Meow",
  _ => "Unknown"
};

Console.WriteLine(sound);

The comparison is fairly self-explanatory and to my eye, nicer to read.  The _ => is used as a "catch all" in case none of the cases match.

### Enums

An enum (or enumeration) is a set of pre-defined constants (i.e. values that cannot be changed).  For example, we could have a "status" enum to indicate whether a person is dead or alive.

var (firstName:string, lastName:string, status) = ("Charles", "Dickens", Status.Dead);

internal enum Status
{
  Dead,
  Alive
}

Under the hood, enums are referenced by integer values by default rather than strings or anything else.  In this case "Dead" is 0 and "Alive" is 1.  But this isn't actually a hard limitation - an enum can be based on other data types as well.

You can also use enums with switch.

var (firstName:string, lastName:string, status) = ("Charles", "Dickens", Status.Dead);

switch (status)
{
  case Status.Dead:
    Console.WriteLine($"{firstName} {lastName} is dead.");
    break;
  case Status.Alive:
    Console.WriteLine($"{firstName} {lastName} is alive.");
    break;
  default:
    throw new ArgumentOutOfRangeException();
}

