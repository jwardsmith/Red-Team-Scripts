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
