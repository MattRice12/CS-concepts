# What they are
  Data types are types of “things” that are mainly used to represent data, such as numbers, text, and other values.

# Data types:
  - Numbers
  - Strings (texts)
  - True, False, and Nil
  - Symbols
  - Arrays
  - Hashes

# Numbers
  - A number is defined by a series of digits, using a dot as a decimal mark, and optinally an underscore as a thousands separator.
  - Integers and Floats
  - When dividing, use floats.
    3 / 2   #=> 1
    3.0 / 2 #=> 1.5

# Strings (texts)

# True, False, and Nil
  - nil represents “nothing”.

# Symbols
  - Symbols are like strings, except they are code.

  - When to Use Symbols:
    1. *Code* - If the text at hand is “data”, then use a string. If it’s code, then use a symbol, especially when used as keys in hashes
    2. *Re-use* - If you use strings that contain the same text in your code multiple times, then a new string object will be created every time. If you’d use a symbol for this and do puts :hello 10 times, then only one single object will be created, and re-used.
    3. *Unique Identifiers* - Symbols are unique identifiers. While strings represent data that can change, symbols represent unique values, which are static.

# Arrays
  - An Array is an object that stores other objects.

# Hashes



http://ruby-for-beginners.rubymonstas.org/built_in_classes.html
