# C# Cheat Sheet

C# is an object-oriented programming language developed by Microsoft in 2000.  It's a high-level language which makes it easy to read and learn, as many of the complexities are abstracted away underneath developer-friendly constructs.

It is also a managed language, which means developers do not have to worry about issues such as memory management.  Unlike unmanaged language like C++, where memory has to be manually allocated and freed, C# features a garbage collector which handles this for you automatically.   C# source code compiles into an Intermediate Language (IL), which when executed, runs inside a Common Language Runtime (CLR).  This CLR translates the IL into machine code on the fly and handles the aforementioned management.

C# and .NET are often used synonymously, but they are different things.  .NET is effectively a set of programming APIs, which expose various functionality as written by Microsoft.  C# is a programming language that is built on top of .NET - as in, C# is used to call .NET APIs.  F# and Visual Basic are also built on top of .NET.

## Data Types

### Value vs Reference

Data types in C# are referred to as "value types" and "reference types".

When a value type is declared, the data is stored in the memory location of the variable.  When a reference type is declared, the data is stored somewhere else in memory and the variable contains a pointer to it.

Reference types are always allocated in heap memory, but value types can be allocated on the heap or on the stack depending on where they're declared.  If a value type is declared inside a method, then it's stored on the stack.  If it's declared in a class, then the data is stored on the heap.  This is because a class is a reference type, which must always be stored on the heap.  Classes and methods will be covered in detail later.

Value types include int, byte, bool, and char.  Reference types include string, arrays and class.
