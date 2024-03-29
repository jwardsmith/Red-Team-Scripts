# ZP C# Cheat Sheet

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

| Type | Description | Size (bytes) | .NET Type | Range |
|------|-------------|--------------|-----------|-------|
| int | Whole numbers | 4 | System.Int32 | -2,147,483,648 to 2,147,483,647 |
| long | Whole numbers (bigger range) | 8 | System.Int64 | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 |
| float | Floating point numbers | 4 | System.Single | +-3.4 x 10^38 |
| double | Double precision (more accurate) floating point numbers | 8 | System.Double | +=1.7 x 10^308 |
| decimal | Monetary values | 16 | System.Decimal | 28 significant figures |
| char | Single character | 2 | System.Char | N/A |
| bool | Boolean | 1 | System.Boolean | True or False |
| DateTime | Moments in time | 8 | System.DateTime | 0:0:00 on 01/01/0001 to 23:59:59 on 12/31/9999 |
| string | Sequence of characters | 2 per character | System.String | N/A |

### Integers and Floating Points

An integer is whole number, -2, -1, 0, 1, 2, etc.

If we want an integer to be negative, it should be declared as a "signed" integer.  Otherwise, it can be "unsigned".  Unsigned integers can be larger than signed integers because we're not wasting a "sign" bit.  We can allocate different sizes for an integer in multiples of 8 bits:  8, 16, 32 and 64 bits.

The naming of these types can be a little hard to remember - they are:

| Keyword | Size |
|--------|-------|
| sbyte | Signed 8-bit |
| byte |	Unsigned 8-bit |
| short |	Signed 16-bit |
| ushort |	Unsigned 16-bit |
| int	| Signed 32-bit |
| uint |	Unsigned 32-bit |
| long |	Signed 64-bit |
| ulong |	Unsigned 64-bit |

```
int SInt = -20;
uint UInt = 20;

byte sByte = 256;
```

Most IDEs will know if you're trying to assign an invalid value to these types.  Since byte is only 8-bits (and unsigned), it cannot accommodate a value larger than 255.

A floating point is a number that can have decimal places, 8.2, 3.14, etc.

There are three types (all of which are signed):

| Keyword |	Size |
|---------|---------|
| float |	4 bytes |
| double |	8 bytes |
| decimal |	16 bytes |

When declaring a float or double, the letter F or D should be appended to the value.  You can declare a value that is more precise than the specified data type, but it will only "use" the range that it is able when carrying out any mathematics, etc.

```
float piFloat = 3.14159265359F
double piDouble = 3.14159265359D;

Console.WriteLine("pi as float: {0}", piFloat);
Console.WriteLine("pi as double: {0}", piDouble);
```

```
pi as float: 3.1415927
pi as double: 3.14159265359
```

### Booleans and Characters

A bool is a true or false value.  It's a fundamental type as most "decisions" in a program are made based on a boolean expression (something that evaluates to true or false).

A char is a single letter or number, represented by an integer.  Those "integers" are standardised in the ASCII and Unicode tables.  Different languages allow different byte sizes for characters, from 1 to 4 bytes.  C# uses 2 bytes, which allows it to use any character in UTF-16.

A character is defined with single quotes.

```
bool myBool = true;
char myChar = 'A';
```

### Arrays and Tuples

The array and tuple are both types of collections.  An array can hold multiple values of a single data type; whereas a tuple can hold multiple values but of various data types.  Both types are fast to use at runtime, but they are fixed size.  To initialise an array with values, we can do something like:

```
int[] intArray = {1, 2, 3, 4, 5};
```

You can also create an empty array by declaring the number of elements you want to have.  The values in the array are assigned the default value for the relevant data type.  For an integer, that would be 0.

```
int[] intArray = new int[5];
```

An element in an array can be accessed by its index.  Arrays are "zero-indexed" which means the first element is index 0, the second is index 1 and so on.  The index of an array is accessed using square brackets, e.g. array[0].

To print the 3rd element:

```
int[] intArray = {1, 2, 3, 4, 5};
Console.WriteLine("{0}", intArray[2]);
```

A tuple is declared using parenthesise for both the data types and initial values; and instead of accessing a tuple index via square brackets, we use the period, ..  Each item is given a name like Item1, Item2, etc.

```
(string, string, int) tuple = ("Charles", "Dickens", 1812);
Console.WriteLine("{0} {1} was born in {2}.", tuple.Item1, tuple.Item2, tuple.Item3);
```

You may also use a concept called "deconstruction" to assign friendly variable names to your elements.

```
(string, string, int) tuple = ("Charles", "Dickens", 1812);
(string firstName, string lastName, int dob) = tuple;
Console.WriteLine("{0} {1} was born in {2}.", firstName, lastName, dob);
```

### Strings

C# has made it very easy to work and manage strings.  A string can be declared using double quotes.

```
string name = "Rasta Mouse";
```

There are multiple ways to concatenate strings.  One way is via interpolation, denoted by a prepended $.

```
string firstName = "Rasta";
string lastName = "Mouse";
string fullName = $"{firstName} {lastName}";
Console.WriteLine(fullName);
```

Another is by using the + operator.

```
string firstName = "Rasta";
string lastName = "Mouse";
string fullName = firstName + " " + lastName;
Console.WriteLine(fullName);
```

Or by using the string.Concat() method.

```
string firstName = "Rasta";
string lastName = "Mouse";
string fullName = string.Concat(firstName, " ", lastName);
Console.WriteLine(fullName);
```

In fact, string has lots of really useful methods including Split, Join, Equals, and IsNullOrEmpty/IsNullOrWhiteSpace.

## Variables

### Declaring

A variable is simply a "place to hold and use data".  C# allows you to declare a variable in a few different ways.  The method we've been using up until now is to declare the data type keyword, a variable name, and its value.  Declaring the data type tells the compiler specifically what type of data the variable will hold, which is called "explicit typing".

```
// explicit
int i1 = 10;
```

However, you may have noticed the green dotted line underneath the keywords, such as int above.  The tooltip in Rider suggests that we use the var keyword instead.  This is "implicit typing" where the compiler infers the data type based on the value assigned to it.

```
// implicit
var i2 = 10;
```

One of the main benefits of using implicit typing is that it can shorten your code and make it more readable.

```
// explicit
(string, string, int) t1 = ("Charles", "Dickens", 1812);

// implicit
var t2 = ("Charles", "Dickens", 1812);

// implicit with deconstruction
var (firstName:string, lastName:string, dob:int) = ("Charles", "Dickens", 1812);
```

There are instances where var cannot be used.  One is when declaring a variable without assigning it a value, and another is when the compiler cannot infer from context what the data type is meant to be.

```
// ok
int i1;

// not ok
var i2;
```

Every variable declared in C# is mutable, which means it can be changed.  To make a variable immutable, prepend it with the const keyword.

```
var i1 = 10;
i1 = 20;

const int i2 = 10;
i2 = 20;
```

### Name Conventions

C# uses different text casing depending on where it's being declared.  Here is a summary of the conventions:

| Object | Casing |
|--------|-----------|
| Classes |	PascalCase |
| Public Members |	PascalCase |
| Private Members |	_camelCase |
| Methods	| PascalCase |
| Variables	| camelCase |
| Enums	| PascalCase |

We'll see many of these other types as we progress through the course.

### Casting

Casting is the process of converting one data type to another, which comes in two flavours:  "implicit" and "explicit".  In this example, we're declaring an int and then casting it to a double.  This is an implicit cast.

```
// implicit cast
var i = 20;
double d = i;
```

However, you cannot implicitly cast a double to an integer - it must be explicitly cast:

```
// invalid cast
double d1 = 3.14D;
int i1 = d1;

// explicit cast
double d2 = 3.14D;
int i2 = (int)d2;
```

These two methods exist because explicit casting is typically more "dangerous", as it can result in a loss of data precision.  An integer is a whole number and cannot hold decimal places.  Converting 20 from an integer simply results in 20 as a double.  But converting 3.14 from a double results in 3 as an integer - we lose the .14 precision on the conversion.

Explicit casting exists because the compiler is forcing you to think about (and acknowledge) the conversion, rather than having it handled automatically for you.

Other data types can be cast to each other where it makes sense.  For example, because a char is a really just a Unicode value, you can cast between char's and int's.

```
var c = 'A';
int i = c;
Console.WriteLine($"{c} == {i}");

c = (char)i;
Console.WriteLine($"{i} == {c}");
```

However, you cannot convert nonsensically such as a string to a float.

## Collections

### Lists

A List<T> is a collection of generic data types (we'll cover generics in more detail later) that can be accessed by index.  It also contains methods for adding, inserting, removing, searching and sorting the values.  A list can only hold one type of data at a time.

We can create an empty list, or create one with values.

```
using System.Collections.Generic;

var list1 = new List<int>();
var list2 = new List<int> {1, 2, 3, 4, 5 };
```

Adding new values can be done with the Add method.

```
using System;
using System.Collections.Generic;

var integers = new List<int>();

integers.Add(item:1);
integers.Add(item:2);
integers.Add(item:3);
integers.Add(item:4);
integers.Add(item:5);

Console.WriteLine($"The value at index 2 is {integers[2]}.");
```

Items can be removed based on their known value, or from a given index.

```
var integers = new List<int> {1, 2, 3, 4, 5 };

// remove a known value
integers.Remove(item:1);

// remove from a given index
integers.RemoveAt(index:3);

foreach(var i:int in integers)
  Console.WriteLine(i);
```

The Contains method returns a bool if the given value is in the list.

```
var integers = new List<int> {1, 2, 3, 4, 5 };

if (integers.Contains(item:1))
  Console.WriteLine(1 is present);
```

And Find can be used to search the list for a value.  The method takes a "predicate" which is written as a lambda expression.  We won't dive into that too much here, but we'll see it again in the LINQ module.  Here I'm searching for the value 3.

```
var integers = new List<int> {1, 2, 3, 4, 5 };
var item:int = integers.Find(match:v:int => v == 3);

Console.WriteLine(item);
```

Note that if the value does not exist, the method returns the default value for the list's data type, T.  Another aspect to watch out for is that a list does allow you to add the same value multiple times, and methods such as Remove, Find, and IndexOf return the first occurrence of that data.

### Dictionary

A dictionary stores data in key-value pairs.  The key and value do not need to be of the same type.  In this example, I'm creating a dictionary that will use an int for the keys and a string for the data.

```
using System;
using System.Collections.Generic;

var dict = new Dictionary<int, string>();

dict.Add(0, "Charles Dickens");
dict.Add(1, "George Orwell");
dict.Add(2, "Mark Twain");

foreach(var kvp:KeyValuePair<int,string> in dict)
  Console.WriteLine($"Key: {kvp.Key} contains: {kvp.Value}.");
```

Even though I've done it here, the keys do not need to be sequential - they can be any arbitrary values.  Values are usually found by a known key.  The safest way is by using the TryGetValue method, which will return a bool and the associated value.

```
if (dict.TryGetValue(2, out var value:string))
  Console.WriteLine(value);
```

Each key in a dictionary must be unique - the program will throw an exception if you attempt to add the same key twice.

```
var dict = new Dictionary<int, string>();

dict.Add(0, "Charles Dickens");
dict.Add(1, "George Orwell");
dict.Add(2, "Mark Twain");

// this will throw an exception
dict.Add(2, "Jane Austen");
```

The value associated with a key can be changed:

```
var dict = new Dictionary<int, string>();

dict.Add(0, "Charles Dickens");
dict.Add(1, "George Orwell");
dict.Add(2, "Mark Twain");

if (dict.ContainsKey(2))
  dict[2] = "Jane Austen";
```

Note that in this example, 2 is not an "index" it's the literal value of the key.

### Hashtable

The Hashtable is like a stripped-down dictionary that is designed for pure performance.  It does not maintain any order in the collection and allows values to be looked up very quickly.  It's a good candidate when computing against large data sets but for general use, the dictionary is friendlier.

```
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
```

### Queue

There are two main types of queue:  the Queue and the Stack.  The queue is a first-in-first-out (FIFO) collection and the stack is last-in-first-out (LIFO).  These are useful when the order of data is of the strictest importance and can be used in places such as message queues.

To push an object into a queue, use the Enqueue method.  To remove and return the next object, use  Dequeue.

```
var queue = new Queue<int>();

// add items
queue.Enqueue(item:1);
queue.Enqueue(item:2);
queue.Enqueue(item:3);

// dequeue them all
while (queue.TryDequeue(out var value:int))
  Console.WriteLine(value);
```

In this example, the printed order is 1, 2, and 3.

The stack functions in the same way using the Push and Pop methods.

```
var stack = new Stack<int>();

// add items
stack.Push(item:1);
stack.Push(item:2);
stack.Push(item:3);

// remove them all
while (stack.TryPop(out var value:int))
  Console.WriteLine(value);
```

This time, the printed order is 3, 2, and 1.

## Operators

### Mathematical Operators

I'm sure we've all come across mathematical operators before.  There is not much interesting to say about them.  Common ones include:

- \+ for add.
- \- for subtract.
- \* for multiply.
- / for divide.
- % for modulus.

```
using System;

Console.WriteLine(23 + 54); // addition
Console.WriteLine(32 - 12); //subtraction
Console.WriteLine(4 * 5); // multiplication
Console.WriteLine(321 / 44); // division
Console.WriteLine(798 % 8); // modulus
```

### Logical Operators

Logical operators are used when we want to evaluate an expression in order to obtain a true or false outcome.  This could be as simple as comparing the size of two numbers.  The most common operators are:

- == for equals.
- \> for greater than.
- < for less than.
- \>= for greater than or equal to.
- <= for less than or equal to.

The bang ! is used to flip the logic of an operator, most commonly paired with equals.
!= for not equal.

```
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
```

### Bitwise Operators

A bitwise operators changes a value at the binary level.   The common bitwise operators are

- & for AND.
- | for OR.
- ^ for XOR.
- << for left shift.
- \>> for right shift.

```
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
```

## Control Flow

### If / Else

We've already seen examples of the if statement in a previous module, although it was not explained.  The construct of the statement goes if "condition", followed by the code to execute.  The code inside the curly braces only executes if the condition evaluates to true.

```
if (condition)
{
  // do something
}
```

You can add an additional code block that will execute if the condition is false, rather than true.  This is done with the else keyword.

```
if (condition)
{
  // do something
}
else
{
  // do something else
}
```

You can also add additional branches using else if.

```
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
```

Each condition is evaluated from top to bottom.  If one is true, the relevant code will execute, the flow will break out and no other conditions will be evaluated.  This allows the final else case to be a kind of "catch all" in the event that every condition evaluates to false.

Multiple logical operators can be combined but this can lead to unexpected results if they're not evaluated in the proper order.  Consider the following example and make a prediction of the outcome.

```
using System;

var condition1 = true;
var condition2 = false;
var condition3 = false;

if (condition1 || condition2 && condition3)
  Console.WriteLine("Good to go");
```

It seems that what we're trying to say is that condition1 OR condition2 needs to be true AND condition3 needs to be true as well.  Since condition3 is set to false, the entire expression should come out as false, right?  But it doesn't.

This is due to the order in which the conditions are evaluated - the AND statement is evaluated first, followed by the OR.

"condition2 && condition3" evaluates to "false" because condition2 and condition3 are both currently set to false.  This would also be the case if one of them was true - because it's an AND operator, both condition2 and condition3 would have to be true for that portion to come out as true overall.

The next part of the expression is then evaluated, which is "condition1 || condition2".  Since condition1 is true, this expression comes out as true and the code inside the braces is executed.

To address this, we need to put parenthesise around the OR expression to force it to be evaluated first.

```
if ((condition1 || condition2) && condition3)
  Console.WriteLine("Good to go");
```

Now it will evaluate "condition1 || condition2", which is true because condition1 is true.  But then true && condition3 comes out as false, because condition3 is false.  So this time, we don't see the "Good to go" message.  Rider has already correctly evaluated the condition to false.  It has greyed out the line to show that this code is not currently reachable, since as there's no code that changes the state of the conditions.

### Switch

The switch keyword is a pattern-matching construct which allows you to add cases for certain conditions.  This is generally nicer to use than multiple else if statements.  Take the following example:

```
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
```

This can be condensed down into:

```
var animal = "Dog";
var sound:string = animal switch
{
  "Dog" => "Woof",
  "Cat" => "Meow",
  _ => "Unknown"
};

Console.WriteLine(sound);
```

The comparison is fairly self-explanatory and to my eye, nicer to read.  The _ => is used as a "catch all" in case none of the cases match.

### Enums

An enum (or enumeration) is a set of pre-defined constants (i.e. values that cannot be changed).  For example, we could have a "status" enum to indicate whether a person is dead or alive.

```
var (firstName:string, lastName:string, status) = ("Charles", "Dickens", Status.Dead);

internal enum Status
{
  Dead,
  Alive
}
```

Under the hood, enums are referenced by integer values by default rather than strings or anything else.  In this case "Dead" is 0 and "Alive" is 1.  But this isn't actually a hard limitation - an enum can be based on other data types as well.

You can also use enums with switch.

```
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

internal enum Status
{
  Dead,
  Alive
}
```

### Loops

There are two main types of general purpose loops called for and while.  In almost all cases, we want to perform some loop until a pre-determined condition has been met.

A for loop is made up of three statements:

Statement 1 is executed one time at the start of the loop.
Statement 2 defines the condition for executing the loop code.
Statement 3 is executed after every loop.

```
using System;

for (var i = 0; i < 10; i++)
  Console.WriteLine($"i is {i}");
```

In this example:
Statement 1: Initialises the starting value of a counter, i to 0.
Statement 2: states that if i is less than 10, then execute the code.
Statement 3: increments i by 1 after each loop

Once i is no longer less than 10, the loop will break.  These loops are commonly used to iterate over elements in a collection, using the length of the collection.

```
var array = new[] {1,2,3,4,5};
for (var i = 0; i < array.Length; i++)
  Console.WriteLine(array[i]);
```

A while loop can be more flexible than a for loop, because we do not need a predetermined range to iterate over (although they can be written like that).  A while loop will loop forever whilst the condition is met.  This condition is usually defined outside of the loop itself but can be manipulated from inside the loop.

```
var i = 0;
while (i < 10)
{
  Console.WriteLine(i);
  i++;
}
```

Another way to write this could be.

```
var i = 0;
while (true)
{
  if (i > 10)
    break;
    
  Console.WriteLine(i);
  i++;
}
```

The break keyword can be used to break out of a loop at any time, regardless of whether its condition is met or not.  The continue keyword can be used to skip the remaining code in a loop and move immediately onto the next loop iteration.

```
var i = 0;
while (i < 10)
{
  if (i == 5)
    continue;
    
  Console.WriteLine(i);
  i++;
}
```

You must be careful however, as this can introduce unexpected runtime bugs.  The code above will actually loop infinitely, because we continue before incrementing the counter.  Therefore never allowing it to go beyond 5.

The foreach loop provides an easier way to loop over a collection without having to have a counter.

```
var list = new List<int> { 1, 2, 3, 4, 5 };
foreach(var i:int in list)
  Console.WriteLine(i);
```

### Scopes

Variables only exist and are accessible within a given scope hierarchy.  A scope is created any time the curly braces, { } are used.  That means every loop and method has their own scope.  I used the word hierarchy, because as we've seen with loops, some scopes can exist inside other scopes.

```
{
  // "outer" scope

  {
    // "inner" scope
  }

  // "outer" scope
}
```

Variable accessibility is relatively simple in these cases.  Anything declared in an "outer" scope is accessible from an "inner" scope.  This must be possible, otherwise loops would not function.  However, variables declared within an "inner" scope cannot be accessed in an "outer" scope.

For example, the following code will throw the error "cannot find value `foo` in this scope" and will not compile.

```
{
  // "outer" scope

  {
    // "inner" scope
    var foo = "foo";
  }

  // "outer" scope
  Console.WriteLine(foo);
}
```

### Command Line Arguments

In old versions of C#, you were required to structure the entry of your program with an explicit namespace, class and Main method.  The command line arguments were read in Main as a string array called args.  

```
namespace HelloWorld;

internal static class Program
{
  public static void Main(string[] args)
  {
    // do stuff
  }
}
```

All of this boilerplate code is no longer required, but the args variable still exists and can be used as normal.

```
using System;

for (var i = 0; i < args.Length; i++)
  Console.WriteLine($"Argument {i} is {args[i]}");
```

```
PS C:\> dotnet run arg1 arg2 arg3
Argument 0 is arg1
Argument 1 is arg2
Argument 2 is arg3
```

If your application has mandatory arguments, it's common to do a length check and exit from the program if not enough are provided.

```
using System;

if (args.Length < 2)
{
  Console.WriteLine("Not enough arguments");
  ShowUsage();
  return;
}

void ShowUsage()
{
  Console.WriteLine("Usage: app.exe <arg1> <arg2>");
}
```

```
PS C:\> dotnet run arg1
Not enough arguments
Usage: app.exe <arg1> <arg2>
```

### Prompting for Input

In addition to reading command line arguments when the program first runs, you may want to prompt the user for additional input whilst the program is running.  C# makes this unbelievably easy.

```
using System;

while (true)
{
  // print a pseudo prompt
  Console.Write("> ");

  // read from stdin
  var input:string = Console.ReadLine();

  // loop again if the string was empty
  if (string.IsNullOrWhiteSpace(input))
    continue;

  // print to stdout
  Console.WriteLine($"You said: {input}");
}
```

```
PS C:\> dotnet run
> hello world
You said: hello world
>
```

String comparisons can be used to take action on certain input.  For example, typing "exit" to break out of the loop and close the program.  The string type has an Equals() method which is perfect for this.

```
// break if "exit"
if (input.Equals("exit"))
  break;
```

By default, this method is case-sensitive which means "EXIT", "eXiT", etc would not match.  You can provide a StringComparison enum to make it case-insensitive.

```
// break if "exit"
if (input.Equals(value:"exit", StringComparison.OrdinalIgnoreCase))
  break;
```

## Classes & Methods

### Classes

Classes in C# are the heart of how it handles object-oriented programming and can be thought of as templates to store and/or operate on data.  For example, let's create a class to represent a person and the properties of a person that we want to work with.

```
internal class Person
{
  public string FirstName { get; set; }
  public string LastName { get; set; }
  public DateOnly DateOfBirth { get; set; }
}
```

After the class has been defined, we can create an instance of a person.

```
var person = new Person
{
  FirstName = "Charles",
  LastName = "Dickens",
  DateOfBirth = new DateOnly(year:1812, month:2, day:7)
};

internal class Person
{
  public string FirstName { get; set; }
  public string LastName { get; set; }
  public DateOnly DateOfBirth { get; set; }
}
```

### Properties

FirstName, LastName and DateOfBirth are all "properties" on this class.  The get and set methods define how the data can be read or modified.  The accessibility on the properties is marked as public, which allows access from outside of the class.  This makes sense in most cases, but not others.  For example, the date of birth of a person does not change, so we may not want this data to be modified after it has been set.

To that end, we can replace set with init.  This prevents us from changing the data after the initial value has been set.

```
var person = new Person
{
  FirstName = "Charles",
  LastName = "Dickens",
  DateOfBirth = new DateOnly(year:1812, month:2, day:7)
};

person.DateOfBirth = new DateOnly(year:0000, month:0, day:0);

internal class Person
{
  public string FirstName { get; set; }
  public string LastName { get; set; }
  public DateOnly DateOfBirth { get; init; }
}
```

We can also define "computed" properties that can be made up of data from existing properties.  For example, we have FirstName and LastName, but what if we wanted a FullName as well?  No problem.

```
var person = new Person
{
  FirstName = "Charles",
  LastName = "Dickens",
  DateOfBirth = new DateOnly(year:1812, month:2, day:7)
};

Console.WriteLine(person.FullName);

internal class Person
{
  public string FirstName { get; set; }
  public string LastName { get; set; }
  public string FullName => $"{FirstName} {LastName}";
  public DateOnly DateOfBirth { get; init; }
}
```

The lamba acts as a shorthand for:

```
public string FullName
{
  get
  {
    return $"{FirstName} {LastName}";
  }
}
```

An Age property is another good candidate for a computed property, as it could be calculated from the current date and the date of birth.

### Constructors

One potential issue with our code is that it's possible to create a person without setting any of the property values.  We have a "person" but without a name or date of birth.

```
var person = new Person();
```

Constructors can be used to force us to pass data to the object before it can be fully instantiated.  Every class has an implied "empty constructor" which would look like this:

```
internal class Person
{

  public Person()
  {
  }
```

Mandatory parameters can be added to the parentheses, like so:

```
internal class Person
{
  public Person(string firstName, string lastName, DateOnly dateOfBirth)
  {

  }
```

Those parameter values can then be set on the class properties.

```
public Person(string firstName, string lastName, DateOnly dateOfBirth)
{
  FirstName = firstName;
  LastName= lastName;
  DateOfBirth = dateOfBirth;
}
```

We'll now see that a new Person cannot be created without passing this data in on the constructor.

```
var person = new Person();
> Constructor 'Person' has 3 parameter(s) but is invoked with 0 argument(s)
```

```
var person = new Person(
  firstName:"Charles",
  lastName:"Dickens",
  dateOfBirth:new DateOnly(year:1812, month:2, day:7)
  );
```

It's worth noting that C# often doesn't care if something is split across multiple lines and it is often preferable to improve readability.

A class can also have multiple constructors if you want to allow different ways to instantiate the class.

### Methods

A class can contain methods (sometimes also called functions), that are useful when needing to get or set data associated with a particular instance of a class.  Let's go back to the DateOfBirth property again.  Let's say we do want to allow it to be changed (in case there was a data input error the first time), but we want some data validation logic around it.  For example, we may not want a date of birth to be set to a date in the future.

The first step is to change the accessibility of the DateOfBirth property.  We previously set it to init, but now we want it to change.  It needs to be private set to ensure the data can only be set from inside the class (i.e. the method we're going to write).

```
public DateOnly DateOfBirth { get; private set; }

public bool SetDateOfBirth(DateOnly dob)
{
  if (dob > DateOnly.FromDateTime(DateTime.UtcNow))
    return false;

  DateOfBirth = dob;
  return true;
}
```

This SetDateOfBirth method takes a DateOnly value and return a bool to indicate whether the property was set or not.  It will simply convert the current UTC time to a DateOnly format and compare it with the dob parameter supplied.  If dob is greater, then it must be in the future - in which case the method will return false without changing the property.  Otherwise, it will set the property and return true.

```
// create person with "wrong" dob
var person = new Person(firstName:"Charles", lastName"Dickens", DateOnly.MinValue);

// this should fail
var success:bool = person.SetDateOfBirth(dob:new DateOnly(year:2030, month:1, day:1));
Console.WriteLine(success ? "Successfully set DOB" : "Setting DOB failed");

// this should succeed
success = person.SetDateOfBirth(dob:new DateOnly(year:1812, month:2, day:7));
Console.WriteLine(success ? "Successfully set DOB" : "Setting DOB failed");

//confirm
Console.WriteLine(person.DateOfBirth);
```

### Polymorphism

Polymorphism is a trait of object oriented programming which makes them very versatile by allowing classes to become related by inheritance.  In this example, I have an Animal class which has a single property, Name; and two further classes, Dog and Cat which inherit from Animal (declared using :).

```
internal class Animal
{
  public string Name { get; set; }
}

internal class Dog : Animal
{

}

internal class Cat : Animal
{

}
```

We can then instantiate an instance of Dog and Cat, and they will automatically have a Name property.

```
var dog = new Dog { Name = "Lassie" };
var cat = new Cat { Name = "Salem" };
```

### Abstraction

By default, every (non-static) class can be instantiated, which is not always desirable.  We created some classes to represent different animals in the previous example, but it may not make sense to be able to create an instance of the Animal class itself.

In this case, we can mark the class as abstract.

```
// now we cannot do this
var animal = new Animal();

internal abstract class Animal
{

  public string Name { get; set; }
}
```

As well as properties, classes can inherit methods from their parents.

```
internal abstract class Animal
{

  public string Name { get; set; }

  public void SayYourName()
  {
    Console.WriteLine($"My name is {Name}");
  }
}
```

Even though this method is declared on the Animal class, we can call it on our instance of Dog and Cat, and it will print their own names respectively.

```
var dog = new Dog { Name = "Lassie" };
dog.SayYourName();

var cat = new Cat { Name = "Salem" };
cat.SayYourName();
```

```
My name is Lassie
My name is Salem
```

### Overrides

We can also declare abstract methods on a class, which will force those inheriting it to provide their own implementation.

```
internal abstract class Animal
{

  public string Name { get; set; }

  public void SayYourName()
  {
    Console.WriteLine($"My name is {Name}");
  }

  public abstract void MakeNoise();
}
```

We don't want to define the body of the method on the abstract class, because each inheriting type (Dog, Cat, etc) will want to do this in a different way.  Methods marked as abstract are mandatory, so Rider will alert us that Dog and Cat are not currently implementing them.

```
internal class Dog : Animal
{

}
> Abstract inherited member 'void Animal.MakeNoise()' is not implemented
internal class Cat : Animal
{

}
> Abstract inherited member 'void Animal.MakeNoise()' is not implemented
```

```
internal class Dog : Animal
{
  public override void MakeNoise()
  {
    Console.WriteLine("Woof");
  }
}

internal class Cat : Animal
{
  public override void MakeNoise()
  {
    Console.WriteLine("Meow");
  }
}
```

When called, we'll see the different output for each.

```
var dog = new Dog { Name = "Lassie" };
dog.MakeNoise();

var cat = new Cat { Name = "Salem" };
cat.MakeNoise();
```

```
Woof
Meow
```

### Interfaces

An interface is another form of abstraction - it's like an abstract class, but can only contain methods and properties.  You cannot define methods that also have implementations.

The naming convention for an interface is to have it begin with an "I".

```
internal interface IAnimal
{
  string Name { get; }
  void MakeNoise();
}
```

A class can inherit from an interface in the same way as an abstract class.

```
public class Dog : IAnimal
{

  public string Name { get; }

  public Dog(string name)
  {
    Name = name;
  }

  public void MakeNoise()
  {
    Console.WriteLine($"Woof, my name is {Name}.");
  }
}
```

## Error Handling

### Exception

When bad things happen in C#, they can cause exceptions to be thrown.  If those exceptions are not caught and dealt with, the program will crash.  For example - the following code will throw an IndexOutOfRangeException because we're trying to access the 6th element of an array that only has 5 elements.

It will then crash before it gets to the second Console.WriteLine().

```
var array = new[] {1, 2, 3, 4, 5 };
Console.WriteLine(array[5]);
Console.WriteLine("I'm still alive...");
```

### Try/Catch

Exceptions can be handled using the try / catch keywords.  If we structure the code this way, the exception will be handled safely and we will see the second line get printed, as the program will no longer crash.

```
var array = new[] {1, 2, 3, 4, 5 };

try
{
  Console.WriteLine(array[5]);
}
catch (Exception e)
{
  Console.WriteLine($"Something went wrong: {e.Message}");
}

Console.WriteLine("I'm still alive...");
```

The try/catch blocks add quite a lot of bulk to the code, so instead of being over-reliant on them you should really write your code more safely in the first place.

In addition to try / catch, there's the finally keyword.  Code inside the finally block is always executed, regardless of whether an exception was thrown or not.  This is useful for scenarios such as database access because we would likely want to close the connection in either case.  Failure to do so could lead to connection exhaustion or database locks, etc.

```
var conn = new SqlConnection("blah");
conn.Open();

var command = new SqlCommand(cmdtext:"insert whatever into something...");

try
{
  // execute db query
  command.ExecuteNonQuery();
}
catch
{
  // catch any exceptions
  // raise error to user
}
finally
{
  conn.Close();
}
```

### Catching Specific Exceptions

There are multiple types of exception in C#, all of which inherit from the base Exception class.  The IndexOutOfRangeException mentioned earlier inherits from SystemException, which in turn inherits from Exception.  By putting Exception in the catch block, we're catching every single type of exception that C# can produce.

This is useful in terms of accounting for all possibilities, but there may be cases where we actually want to know what kind of exception is being thrown and act accordingly.  For example, if we're working with threads and cancellation tokens, there are a few exceptions that we could potentially see.

Declaring multiple catch blocks allows us to handle each case.

```
try
{
  // do something
}
catch (TaskCanceledException)
{
  // handle task cancelled
}
catch (ThreadAbortException)
{
  // handle thread aborted
}
catch (OperationCanceledException)
{
  // handle operation cancelled
}
catch (Exception)
{
  // catch all
}
```

### Error Propagation

It's quite common to structure code in such a way that functions will call other functions.  This is generally because modular code is more usable and leads to less code repetition.  In this example, I have a program that opens a file and reads the content as a string.

```
using System;
using System.IO;

var content:string = ReadFile(path:"C:\\test.txt");
Console.WriteLine(content);

string ReadFile(string path)
{
  using var fs:FileStream = OpenFileStream(path);
  using var sr = new StreamReader(fs);

  return sr.ReadToEnd();
}

FileStream OpenFileStream(string path)
{
  return File.OpenRead(path);
}
```

When I run this code, OpenFileStream throws a FileNotFoundException because the path C:\test.txt does not exist on my computer.  So how do we handle such a case?  We could wrap the call to File.OpenRead() in a try/catch block, but the method still has to return a FileStream and we don't have one.

If we return null, ReadFile will then throw an ArgumentNullException because you can't pass null into a StreamReader.  That would force us to implement another try/catch and then figure out how to return data back to the main caller.

All this gets very messy and is really not necessary as exceptions in C# are automatically propagated up the call stack.  This means if any method along the chain throws an exception, it is automatically passed back to the original caller.

```
try
{
  var content:string = ReadFile(path:"C:\\test.txt");
  Console.WriteLine(content);
}
catch (IOException e)
{
  Console.WriteLine(e.Message);
}
```

You should only catch exceptions in a method if that method can reasonably recover from the error.  In this example, maybe we would want OpenFileStream to catch the FileNotFoundException, create a new file and return that FileStream back.

```
FileStream OpenFileStream(string path)
{
  try
  {
    return File.OpenRead(path);
  }
  catch (FileNotFoundException)
  {
    return File.Create(path);
  }
}
```

This is the only exception the method will catch, because it's the only error it can recover from.  Any other exception will still be thrown up the call stack.  Do not catch exceptions in a method that cannot recover it - allow the error to propagate up the stack until it reaches a point where it can be recovered, or the error presented to an end user.

## Generics

### Generic Types

We've seen instances where letters such as T are used to represent a data type, such as List<T>.  This allows you to create a list containing any data type, even custom classes that you create.  For example, we could have a List<Person>.

```
using System.Collections.Generic;

var people = new List<Person>();

internal class Person
{

}
```

This is far more flexible than having specific concrete implementations only for C#'s default data types.  You can also leverage generics in your own classes and methods.  Let's use (de)serialization as a working example.

```
byte[] SerializePerson(Person person)
{
  using var ms = new MemoryStream();
  JsonSerializer.Serialize(ms, person);

  return ms.ToArray();
}

Person DeserializePerson(byte[] json)
{
  using var ms = new MemoryStream(json);
  return JsonSerializer.Deserialize<Person>(ms);
}

[Serialize]

internal class Person
{
  [JsonPropertyName("first_name")] public string FirstName { get; set; }
  [JsonPropertyName("last_name")] public string LastName { get; set; }
}
```

Here we have a Person class that has been decorated with the Serializable attribute and each property in that class has the JsonPropertyName attribute.  The SerializePerson method takes in a Person and uses the .NET System.Text.Json.JsonSerializer to convert it to a JSON string (encoded as bytes).  The DeserializePerson method then does the opposite - it takes in the encoded JSON string and returns a Person object.

```
var person = new Person
{
  FirstName = "Rasta",
  LastName = "Mouse"
};

var json:byte[] = SerializePerson(person);
Console.WriteLine(Encoding.Default.GetString(json));
```

```
{"first_name":"Rasta","last_name":"Mouse"}
```

Now imagine that we have multiple classes that we want to serialize and deserialize - having separate methods for every class is clearly not very efficient and would be a maintenance nightmare.  What we can do instead is refactor these methods to accept generics.  We can do this by replacing the concrete type of Person, with T.

```
byte[] SerializePerson<T>(T obj)
{
  using var ms = new MemoryStream();
  JsonSerializer.Serialize(ms, obj);

  return ms.ToArray();
}

T DeserializePerson<T>(byte[] json)
{
  using var ms = new MemoryStream(json);
  return JsonSerializer.Deserialize<T>(ms);
}
```

### Constraints

One concern that generics introduce is passing a nonsensical data type into the method.  These methods are designed for serializing/deserializing objects to/from JSON, but not everything is serializable.  For example - the compiler allows us to pass an empty memory span which builds just fine, but will throw an InvalidOperationException at runtime.

```
var json:byte[] Serialize(obj:new Memory<string>());
Console.WriteLine(Encoding.Default.GetString(json));
```

```
byte[] Serialize<T>(T obj)
{
  using var ms = new MemoryStream();
  JsonSerializer.Serialize(ms, obj);

> Unhandled exception
> InvalidOperationException
```

We could (and perhaps should) implement a try/catch which will return an empty byte array, but it would also be useful if we could prevent a developer from passing in this data type in the first place.  These are called constraints.

Constraints are declared using the where keyword and are usually found on methods or classes.  The syntax is where T :, followed by a comma-separated list of constraints.

```
byte[] Serialize<T>(T obj) where T : class
```

In this example, the class constraint means that T must be a reference type (classes are reference types, and structs are value types).  All the possible constraints are documented by Microsoft.

Now the compiler won't allow us to build the code.

```
var json:byte[] Serialize(obj:new Memory<string>());
Console.WriteLine(Encoding.Default.GetString(json));

byte[] Serialize<T>(T obj) where T : class

> The type 'System.Memory<string>' must be a reference type in order to use it as paramter 'T'
```

## Concurrency

### Concurrency

A single-core CPU has a single physical core that is designed to run at a given frequency (clock speed), with a single thread.  These CPUs are slow when handling multiple tasks, because each task has to wait for the previous one to finish before it can be dealt with.

CPU architecture began to drastically change in the early 2000's with the introduction of multi-core CPUs and in the mid-2000's, products such as the AMD Athlon 64 X2 and Intel Core 2 duo brought this to the regular desktop-computing space.  Multi-core CPUs contain multiple physical cores on the same die that are linked together, which allow for concurrent tasks to be handled in parallel.

As you can imagine, programming languages that were developed prior to multi-core CPUs were not optimised (or even able) to run concurrent tasks.  There are quite a few ways to run code and methods concurrently in C#.  The three we're going to look at are Thread, Task and Parallel.

### Threads

New threads are easy to create from the System.Threading namespace, with either a ThreadStart or ParameterizedThreadStart delegate.  The former is a method that does not have input parameters, and the later is a method that has one input parameter.  In both cases, the return type is always void.

A new thread will not run until Start is called.

```
using System;
using System.Threading;

var t1 = new Thread(RunLoop);
var t2 = new Thread(RunLoop);

t1.Start();
t2.Start();

void RunLoop()
{
  for (var i = 1; i <= 10; i++)
    Console.WriteLine(i);
}
```

A thread is run in the foreground by default, but can be made to run in the background by setting the IsBackground property to true.

```
var t1 = new Thread(RunLoop)
{
  IsBackground = true
};
```

The only difference being that a program will not automatically close if there are any foreground threads running.  Backgrounds threads will not keep the program alive if all foregrounds threads finish.

A single parameter can be passed to a thread via it's Start method.  The parameter on the method must be declared as an object, which means a type check should be performed on it before use.

```
t1.Start(parameter:10);
t2.Start(parameter:5);

void RunLoop(object obj)
{
  if (obj is not int counter)
    return;

  for (var i = 1; i <= counter; i++)
    Console.WriteLine(i);
}
```

### Task

The Task.Run methods looks the same as when dealing with the thread, but returns a Task<TResult>.  These tasks must be awaited somewhere to prevent the program from closing before they're finished.  A Task can be waited on with the await keyword and execution flow will be blocked until the task is complete.

```
using System;
using System.Threading.Tasks;

var t1:Task = Task.Run(PrintLoop);
var t2:Task = Task.Run(PrintLoop);

await Task.WhenAll(t1, t2);

void PrintLoop()
{
  for (var i = 0; i <= 10; i++)
    Console.WriteLine(i);
}
```

The return value of a Task can be accessed upon completion.

```
var result:int = await Task.Run(RunLoop);
Console.WriteLine(result);

int RunLoop()
{
  var total = 0;

  for (var i = 1; i <= 10; i++)
    total += i;

  return total;
}
```

### Parallel

The Parallel class has a few interesting methods that are designed to run concurrently over a range or collection - like the for and foreach loops.  Parallel.For takes a starting and ending integer, and a method to execute.  The method accepts the integer as a parameter.

```
using System;
using System.Threading.Tasks;

Parallel.For(fromInclusive:1, toExclusive:10, Print);

void Print(int i)
{
  Console.WriteLine($"This is loop #{i}");
}
```
 
Parallel.ForEach takes a collection and a method - the method accepts the datatype, T, of the collection.

```
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

var people = new List<Person>
{
  new(name:"Stephen King"),
  new(name:"George Orwell"),
  new(name:"Charles Dickens"),
  new(name:"Mark Twain")
};

Parallel.ForEach(people, PrintPeople);

void PrintPeople(Person person)
{
  Console.WriteLine(person.Name);
}
```

In each case, you'll see that the values are printed to the console in a seemingly random order.  This is because every loop iteration is run at exactly the same time.

### Channels

Channels can be used as a means of communicating directly between threads and tasks.  They are effectively a thread-safe queue that allows a "producer" to write message into and a "consumer" to read messages from.  There are two main types of channel - unbounded and bounded.  An unbound channel allows for infinite message capacity, whilst a bounded channel explicitly sets a maximum message capacity.

When creating a channel, you must provide a data type, T depending on what you want the channel to handle.

```
using System;
using System.Threading.Channels;
using System.Threading.Tasks;

var channel = Channel.CreateUnbounded<string>();

var task = Task.Run(async () =>
{
  for (var i = 0; i < 10; i++)
    await channel.Writer.WriteAsync(item:$"This is loop {i}");

  channel.Writer.Complete();
});
```

Here, we're creating a new unbounded channel of type string, then dropping into a Task.Run.  Within that task, we're calling WriteAsync on the channel's Writer with a message.  One we've finished writing we call Complete() on the writer, after which, no more messages can be sent.

```
while (!task.IsCompleted)
{
  try
  {
    var message:string = await channel.Reader.ReadAsync();
    Console.WriteLine(message);
  }
  catch (ChannelClosedException)
  {
    Console.WriteLine("Channel has been closed");
    break;
  }
}
```

Outside of the task, we drop into another loop for as long as our task is not complete.  We continuously attempt to read messages from the channel's Reader, using ReadAsync() and write them to the console.  We're catching the ChannelClosedException, which is triggered once Complete is called on the writer.  We use this as a signal to break out of the loop and continue execution flow.

```
This is loop 0
This is loop 1
This is loop 2
This is loop 3
This is loop 4
This is loop 5
This is loop 6
This is loop 7
This is loop 8
This is loop 9
Channel has been closed
```

## LINQ

### LINQ

LINQ is short for Language-Integrated Query and allows you to write queries against strongly typed collections using C# keywords and operators.  It's especially useful when querying objects that have multiple properties.  LINQ can be complicated to explain, so here's a quick example to get started.

We have our Person class again and a collection of random people.

```
internal class Person
{

  public string FirstName { get; init; }

  public string LastName ( get; init; }

  public string FullName
    => $"{FirstName} {LastName}";

  public DateOnly DateOfBirth { get; init; }

  public int Age
    => DateTime.Today.Year - DateOfBirth.Year;
}
```

```
// random people
var people = new List<Person>
{
  new() { FirstName = "Jose", LastName = "Gomez", DateOfBirth = new DateOnly(year:1957, month:2, day:3) },
  new() { FirstName = "Carolyn", LastName = "Farias", DateOfBirth = new DateOnly(year:1972, month:11, day:22) },
  new() { FirstName = "Rosemarie", LastName = "Pickens", DateOfBirth = new DateOnly(year:1993, month:5, day:17) },
  new() { FirstName = "Hester", LastName = "Funk", DateOfBirth = new DateOnly(year:1986, month:11, day:1) },
  new() { FirstName = "Dianne", LastName = "Soria", DateOfBirth = new DateOnly(year:1979, month:7, day:26) }
};
```

How would you go about finding every person that was born after 1975?  LINQ makes this very easy.

```
// find everyone who was born after 1975
var persons:Person[] = people.Where(p:Person => p.DateOfBirth.Year > 1975.ToArray();
Console.WriteLine($"Found {persons.Length} people. They are: ");

// print them
foreach (var person in persons)
  Console.WriteLine($"{person.FullName}, born on {person.DateOfBirth}, age {person.Age}.");
```

```
Found 3 people. They are:
Rosemarie Pickens, born on 17/05/1993, age 30.
Hester Funk, born on 01/11/1986, age 37.
Dianne Soria, born on 26/07/1979, age 44.
```

Over the next few sections, we'll cover some common LINQ methods.

### Where

Where filters the collection based on the provided predicate and returns an IEnumerable<T>.  In the example shown previously, we used this to find people where the Year property of their DateOfBirth was greater than 1975.  The predicate can contain one or multiple conditions and be a combination of AND's, ORs, and so on.

Here, we're looking for people 50 or younger and born on a Monday.

```
// find everyone 50 or younger, born on a Monday
var persons:Person[] = people.Where(p:Person => p.DateOfBirth.DayOfWeek == DayOfWeek.Monday && p.Age <= 50).ToArray();
```

Predicates that have multiple conditions can look a bit unwieldly when written in this way.  You may also extract the code in to a separate method, which is also useful if you need to use it multiple times.

```
var persons:Person[] = people.Where(FiftyOrYoungerBornOnMonday).ToArray();

bool FiftyOrYoungerBornOnMonday(Person person)
{
  return person.Age <= 50 &&
    person.DateOfBirth.DayOfWeek == DayOfWeek.Monday;
}
```

### Any

Any returns a bool, indicating whether a collection has any elements matching the predicate.  If no predicate is provided, it indicates whether or not the collection is empty.

```
if (people.Any())
  Console.WriteLine("People has elements");

if (!people.Any(p:Person => p.Age < 20))
  Console.WriteLine("Nobody is under the age of 20");
```

### First(OrDefault)

First returns the first element of a collection that matches the predicate.  If no predicate is provided, it will just return the first element of the collection.

```
var person = people.First(p:Person => p.LastName.StartsWith("F"));
Console.WriteLine(person.FullName);
```

If no element matches the predicate, an InvalidOperationException, "sequence contains no matching element" exception will be thrown.  FirstOrDefault can be used to return null if no elements are found.  This saves the program from throwing an exception, but a null reference check should be performed on the returned object.

```
var person = people.FirstOrDefault(p:Person => p.LastName.StartsWith("D"));
Console.WriteLine(person is null ? "No matching person found" : person.FullName);
```

### OrderBy(Descending)

OrderBy and OrderByDescending allow you to order a collection based on a key.  It uses the equality comparer for the specific data type.

```
// youngest to oldest
var ascending:|OrderedEnumerable<Person> = people.OrderBy(p:Person => p.Age);

// oldest to youngest
var descending:|OrderedEnumerable<Person> = people.OrderByDescending(p:Person => p.Age);
```

You can implement your own comparer (inherit from IComparer) to compare custom data types.

## Platform Invoke

### Platform Invoke

Platform Invoke, often shortened to P/Invoke, allows you to access functions in unmanaged C libraries from your managed C# code.  The most common use case (particularly in the offensive security world) is to access the native Windows APIs (although since .NET is cross-platform it can be used with any C library).

These functions are declared with the extern keywork and DllImport attribute.  The following example shows how to import the OpenProcess API from kernel32.dll.  We simply define the function signature (i.e. the function name, any input parameters, and the return type).

```
[DllImport(dllName:"kernel32", SetLastError = true)]
static extern nint OpenProcess(unit dwDesiredAccess, bool bInheritHandle, uint dwProcessId);
```

In most cases, you will also want to set SetLastError to true, as this allows you to retrieve the error code should the API call fail, with Marhsal.GetLastWin32Error.

```
var hProcess:nint = OpenProcess(dwDesiredAccess:0xF01FF, bInheritHandle:false, dwProcessId:26768);

if (hProcess == nint.Zero)
  Console.WriteLine("OpenProcess failed: {0}", Marshal.GetLastWin32Error());
else
  Console.WriteLine("hProcess: 0x{0}", hProcess);
```

### Marshalling

Some Windows APIs such as LoadLibraryW require an LPCWSTR, which is a pointer to a null-terminated 16-bit unicode string.  P/Invoke can automatically marshal between managed and unmanaged datatypes using the MarshalAs attribute, so we don't have to do it manually.

```
[DllImport(dllName:"kernel32", SetLastError = true)]
static extern nint LoadLibraryW(
  [MarshalAs(UnmanagedType.LPWStr)] string lpLibFileName);

var hProcess:nint = LoadLibraryW(lpLibFileName:"amsi.dll");
```

### Enums

Enums can be used in conjunction with APIs that have pre-determined values for their parameters.  For instance, OpenProcess requires a set of ProcessAccessRights which are defined here.  Instead of remembering values, we can define then in an enum - as long as the underlying datatype matches (in this case, uint), it will work.

The Flags attribute on the enum tells C# that the values can be treated as a bit field (i.e. you can perform bitwise operations on them).  In the particular case of this API, it allows you to build up a desired access value of the exact privileges that you want the final handle to have.

```
[DllImport(dllName:"kernel32", SetLastError = true)]
static extern nint OpenProcess(ProcessAccessRights dwDesiredAccess, bool bInheritHandle, unit dwProcessId);

var hProcess:nint = OpenProcess(
  dwDesiredAccess:ProcessAccessRights.PROCESS_VM_READ | ProcessAccessRights.PROCESS_VM_WRITE,
  bInheritHandle:false, dwProcessId:26768);

[Flags]

internal enum ProcessAccessRights : uint
{
  // many missing for brevity
  PROCESS_VM_READ = 0x00100,
  PROCESS_VM_WRITE = 0x0020,
  PROCESS_VM_OPERATION = 0x0008
}
```

## NuGet

### NuGet

NuGet is the .NET package manager, which allows you to bring external code into your project.  The most popular NuGet repository is https://www.nuget.org/, where anybody can write and publish libraries.  These packages can be mind-bogglingly useful and can save you a tonne of time as a developer.  Why re-invent the wheel if you don't need to?

One popular package is RestSharp which is a REST API client.  You can search for and install NuGet packages directly in Rider by going to Tools > NuGet > Show NuGet Tool Window.

Packages can also be installed directly from the command line.

```
PS C:\> dotnet add package RestSharp
```

As a test, we can call the CoinGecko API to get the current Bitcoin prices.

```
var client = new RestClient(baseUrl:new Uri("https://api.coingecko.com/api/v3/"));
var req = new RestRequest(resource:"simple/price?ids=bitcoin&vs_currencies=GBP%2CUSD");

Console.WriteLine("Current BTC Price:");
Console.WriteLine($"GBP : ${resp.Bitcoin.Gbp}");
Console.WriteLine($"USD : ${resp.Bitcoin.Usd}");

internal class Bitcoin
{
  [JsonPropertyName("gbp")] public double Gbp { get; set; }
  [JsonPropertyName("usd")] public double Usd { get; set; }
}

internal class Root
{
  [JsonPropertyName("bitcoin")] public Bitcoin Bitcoin { get; set; }
}
```

```
Current BTC Price:
GBP : $17899.03
USD : $21666
```

### dotnet pack

You can create your own libraries and publish them as NuGet packages.  First, create a new .NET Class Library project and implement a simple calculator.

```
using System.Numerics;

namespace Calculator;

public class Calculator<T> where T: IBinaryInteger<T>
{
  public T Add(T i1, T 12)
    => i1 + i2;

  public T Subtract(T i1, T 12)
    => i1 - i2;

  public T Multiply(T i1, T 12)
    => i1 * i2;

  public T Divide(T i1, T 12)
    => i1 / i2;
)
```

The usual build process to output a DLL would be something like:

```
PS C:\> dotnet build -c Release
  Calculator -> C:\Users\James\source\repos\Calculator\Calculator\bin\Release\net7.0\Calculator.dll
```

However, to produce a NuGet package:

```
PS C:\> dotnet pack
    Successfully created package 'C:\Users\James\source\repos\Calculator\Calculator\bin\Debug\Calculator.1.0.0.nupkg'.
```

The resulting nupkg package can be shared as-is, at nuget.org or your own NuGet package server.

## Testing

### Unit Tests

Unit testing is an invaluable skill when it comes to software development.  It allows easy testing of your library code whenever changes are mode, to ensure functionality has not broken.  We can use the Calculator project from the previous module to demonstrate this.

In C#, the actual project code and testing code are separated into different projects.  In Rider, right-click the Calculator solution, go to Add > New Project and select the Unit Test Project template.  Give the project a name and choose xUnit from the Type dropdown.  Then Create the project.

Inside the new project, we get UnitTest1.cs, which contains a little bit of boilerplate code.  The first thing we need to do is add a reference to the Calculator project.  Expand the project in the Explorer view, right-click on Dependencies and select Reference.  From the popup window, tick the Calculator project and click Add.

Now it's time to write our tests - I'll just cover the Add method as an example.

```
public class CalculatorTests
{
  [Theory]
  [InlineData(5, 5, 10)]
  [InlineData(-5, 5, 0)]
  [InlineData(5, -5, 0)]
  [InlineData(-5, -5, -10)]
  public void AddTests(int i1, int i2, int expected)
  {
    var calc = new Calculator<int>();
    var result:int = calc.Add(i1, i2);

    Assert.Equal(expected, actual:result);
  }
}
```

These are relatively simple - we can provide multiple sets of data so that a single test can be run multiple times.  We have to know ahead of time what the result of each test should be so that we can compare an expected value with the actual value.

The tests can be run directly in Rider via the Tests menu.

Or from the command line.

```
PS C:\> dotnet test
    Determining projects to restore...
    All projects are up-to-date for restore.
    Calculator -> C:\Users\James\source\repos\Calculator\Calculator\bin\Debug\net7.0\Calculator.dll
    Calculator.Tests -> C:\Users\James\source\repos\Calculator\Calculator.Tests\bin\Debug\net7.0\Calculator.Tests.dll

Test run for C:\Users\James\source\repos\Calculator\Calculator.Tests\bin\Debug\net7.0\Calculator.Tests.dll (.NETCoreApp,Version=v7.0)
Microsoft (R) Test Execution Command Line Tool Version 17.4.0 (x64)
Copyright (c) Microsoft Corporation.  All rights reserved.

Starting test execution, please wait...
A total of 1 test files matched the specified pattern.

Passed!  - Failed:     0, Passed:     4, Skipped:     0, Total:     4, Duration: 4 ms - Calculator.Tests.dll (net7.0)
```

Unit testing can be integrated into CI/CD pipelines for full automation of test, build, and deploy.  You can find more information about that in our DevOps for Pentesters course.
