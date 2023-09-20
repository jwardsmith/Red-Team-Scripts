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
