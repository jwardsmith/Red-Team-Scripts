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
