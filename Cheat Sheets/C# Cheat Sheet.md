# C# Cheat Sheet

## Print

- Print a string

```
Console.WriteLine("Hello World!");
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

