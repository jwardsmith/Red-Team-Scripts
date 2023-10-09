# C# Cheat Sheet

https://learn.microsoft.com/en-us/dotnet/csharp/

## Print

- Print a string

```
Console.WriteLine("Hello World!");
```

- Print a concatenate string

```
Console.WriteLine("My name is " + "James" );
```

- Print a interpolation string

```
string name = "James"
Console.WriteLine($"My name is {name}.");
```

- Print a string escaping backslashes

```
string withSlash = "Ifemelu said, \"Hello!\"";
```

## Input

- Read a string

```
string input = Console.ReadLine();
Console.WriteLine($"You are {input} years old!");
```

## Comments

- Write a comment

```
// This is a another comment
```

- Write a multi-line comment

```
/* This is a comment */
```

## Data Types

- Date types table

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

- Implicit conversion (happens automatically if no data will be lost in the conversion. That’s why it’s possible to convert an int (which can hold less data) to a double (which can hold more), but not the other way around)

```
int myInt = 3;
double myDouble = myInt;
```

- Explicit conversion (requires a cast operator to convert a data type into another one. So if we do want to convert a double to an int, we could use the operator (int))

```
double myDouble = 3.2;
int myInt = (int)myDouble;
```

## Variables

- Assign a variable

```
int myAge;
myAge = 28;

string countryName = "Australia";
```

## Numbers

- Integer

```
int variableName = 7;
```

- Double (A double is usually the best choice of the three because it is more precise than a float, but faster to process than a decimal)

```
double variableName = 39.76876;
```

- Decimal (make sure to use a decimal for financial applications, since it is the most precise)

```
decimal variableName = 489872.76m;
```

## Booleans

- TRUE/FALSE

```
bool a = True;
bool b = False;
```

- AND/OR/NOT

not is evaluated first;
and is evaluated next;
or is evaluated last.

```
True && True = True
True && False = False
False && True = False
False && False = False

True || True = True
True || False = True
False || True = True 
False || False = False

!True = False
!False = True
```

## Arithmetic

- Addition

```
Console.WriteLine(4 + 19);
```

- Subtraction

```
Console.WriteLine(18 - 3);
```

- Multiplication

```
Console.WriteLine(23 * 4);
```

- Division

```
Console.WriteLine(5 / 3);
```

- Modulo

```
Console.WriteLine(4 % 2);
```

- PEMDAS

```
Console.WriteLine(8 + (9 * 3));
```

## Updating Variables

- Update a variable

```
int apple = 0;
apple++;
Console.Write(apple);
```

- Update a variable by 3

```
int apple = 0;
apple += 3;
Console.Write(apple);
```

## String Methods

- Find how many characters in a string

```
string userTweet = Console.ReadLine();
userTweet.Length;
```

- Find the position of a character in a string

```
string word = "radio";
word.IndexOf("a"); // returns 1
```

- Grab part of a string using the specified character position, continues until the end of the string, and returns a new string

```
string plantName = "Cactaceae, Cactus";
string commonName = plantName.Substring(charPosition); // returns Cactus
```

- Change a string to uppercase

```
string shouting = "I'm not shouting, you're shouting".ToUpper();
Console.WriteLine(shouting);
// prints I'M NOT SHOUTING, YOU'RE SHOUTING.
```

- Change a string to lowercase

```
string shouting = "I'M NOT SHOUTING, YOU'RE SHOUTING".ToLower();
Console.WriteLine(shouting);
// prints I'm not shouting, you're shouting.
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
string color = "red";

if (color == "blue")
{
  Console.WriteLine("color is blue");
} 
else if (color == "red")
{
  Console.WriteLine("color is NOT blue");
} 
else
{
  Console.WriteLine("color is NOT blue OR red");
}
```

- Switch statements

```
string color;

switch (color)
{
   case "blue":
      Console.WriteLine("color is blue");
      break;
   case "red":
      Console.WriteLine("color is red");
      break;
   case "green":
      Console.WriteLine("color is green");
      break;
   default:
      break;
}
```

- Ternary opeators

```
string color = "blue";
string result = (color == "blue") ? "blue" : "NOT blue";

Console.WriteLine(result);
```

## Methods

- Create a method

```
static void YourMethodName()
{
  Console.WriteLine("Hi there!");
}
```

- Create a method with parameters

```
 static void Main(string[] args)
    {
      YourMethodName("James", 28);
    }

static void YourMethodName(string identity, int age)
{
  Console.WriteLine($"{identity} is {age} years old.");
}
```

- Create a method with optional parameters

```
static void Main(string[] args)
{
  YourMethodName("I'm hungry", "!"); // prints "I'm hungry!"
  YourMethodName("I'm hungry");  // prints "I'm hungry."
}

static void YourMethodName(string message, string punctuation = ".")
{
  Console.WriteLine(message + punctuation);
}
```

## Alternate Expressions

- Rewrite a method

```
bool IsEven(int num)
{
  return num % 2 == 0;
}

bool isEven(int num) => num % 2 == 0;
```

- Lambda

```
int[] numbers = {1, 3, 5, 6, 7, 8};

public static bool IsEven(int num)
{
  return num % 2 == 0;
}

bool hasEvenNumber = Array.Exists(numbers, IsEven);

bool hasEvenNumber = Array.Exists(numbers, (int num) => num % 2 == 0 );
```

## Arrays

- Create an array

```
int[] plantHeights = { 3, 4, 6 };
```

- Create and initialise an array

```
int[] plantHeights = new int[] { 3, 4, 6 };
```

- Get an array length

```
int[] plantHeights = { 3, 4, 6 };

// arrayLength will be 3
int arrayLength = plantHeights.Length 
```

- Access an array item

```
int[] plantHeights = {3, 4, 6};

// plantTwoHeight will be 4
int plantTwoHeight = plantHeights[1];
```

## Loops

- Create a while loop

```
while (spacebar == "down") 
{
 RiseUp();
}
```

- Create a do...while loop

```
bool startGame = false;

do
{
  ShowStartScreen();
} while (!startGame);
```

- Create a for loop

```
for (int i = 0; i < 10; i++)
{
  DisplayFlag();
}
```

- Create a for each loop

```
string[] melody = { "a", "b", "c", "c", "b" };

foreach (string note in melody)
{
  PlayMusic(note);
}

```

## Classes

- Create a class

```
class Forest {
  public string name;
  public int trees;
}
```

- Make an instance of a class

```
Forest f = new Forest();
f.name = "Amazon";
Console.WriteLine(f.name); // Prints "Amazon"

Forest f2 = new Forest();
f2.name = "Congo";
Console.WriteLine(f2.name); // Prints "Congo"
```
