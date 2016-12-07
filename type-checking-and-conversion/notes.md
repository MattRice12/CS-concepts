# General Overview
The first and biggest point that almost every discussion of Static/Dynamic and Strong/Weak typing is that they are not the same thing.

The next big point is that one should be cautious to use the terms Strong and Weak typing, since they don't have a universally agreed upon technical meaning. Despite this shortcoming, understanding these concepts can be useful in a relative manner for understanding languages.

Static and Dynamic typing, however, have a much more agreed upon definition. They describe *when* type information (e.g., string, integer, boolean, etc.) is acquired--either at compile time or at runtime.

To contrast, Strong and Weak typed languages describ *how strictly* types are distinguished from each other (e.g. whether the language tries to do implicit conversion from strings to numbers).

# Static vs. Dynamic
As stated above, static and dynamic typing describe when type information is acquired. Static typing checks types at compile time, while dynamic typing checks types at runtime.

*Statically typed language*
To put it concisely, type is acquired at @compile time. Because of this, once you set a variable to a type, you cannot change it--i.e., the type is static. If you try to change a variable's type (e.g., from a string to an integer), the program will refuse to compile, even if the program would have never even used the variable. Thus, you CANNOT declare x to be an integer and, a few lines later, redeclare it to be a string.

  Example of a statically typed language (pseudo-Java):
    |  int x;
    |  x = 3;
    |  x = "hello";
    |
    |  //=> this will produce a compiler error because the type cannot be changed from integer to string.

  Example where the type conversion is never encountered (pseudo-Java):
    |  int x = 2;
    |  if (x > 1) {
    |    System.out.println("Success.");
    |  } else {
    |    x = true;
    |  }
    |
    |  //=> this will still produce a compiler error even though the erroneous line of code is never run.

*Dynamically typed language*
By contrast, type is acquired at @runtime with dynamic typing. Thus, the variable's type can change (e.g., from a string to an integer) and be resolved at the moment it gets parsed by the interpreter.

Example of dynamically typed language (Ruby):
  |  x = 2
  |  x = []
  |  x = {one: 1, two: "shoe", three: [6, 9]}
  |  x = true
  |  x = "hi"
  |
  |  #=> "hi"

In this example, even though the variable type for 'x' changed repeatedly, no compile error occurred because type is checked at runtime--i.e., when the variable is finally called.

Yet although type can change, poorly typed operations might still cause the program to raise an exception. Take the following for example:
  |  x = 2
  |  x + "hi"
  |
  |  #=> TypeError: no implicit conversion of Fixnum into String

However, this exception is not the focus of static/dynamic typing, but of strongly/weakly typed languages. Which leads to a discussion about...

# Strongly vs. Weakly typed
As mentioned above, the distinction between strongly and weakly typed languages is not so well defined. Yet even if the distinction is not clear, there is an underlying topic that is worth discussing. In addition, it may contribute to a better understanding of static/dynamic typing.

As a brief introduction, strongly typed languages do not implicitly convert type at runtime (e.g., they will raise an exception rather than convert an integer to a string when there is a type mismatch). A weakly typed language will make this type conversion; however, it may produce unpredictable results.

*Strongly Typed Languages*:
Once the language knows the type of an object, it expects you to do something that makes sense with it. If you start mixing several different types together in an expression, a strong language won't understand what it means.

  Example that works:
  |  x = "7"
  |  y = x + "eleven"
  |  #=> "7eleven"

  Example that doesn't work:
  |  x = "7"
  |  y = x + 11
  |  #=> TypeError: no implicit conversion of Fixnum into String

*Weakly Typed Languages*
By contrast, a weakly typed language lets you mix types together in your expressions without throwing an exception at runtime. This can lead to unpredictable results:
  Example of type mixing in JavaScript:
  |  x = '3'
  |  5 + x
  |  #=> '53' // this is because 5 is converted into a string and then concatinated with '3'

*The distinction*
So why is there no universally agreed upon technical meanings for strongly and weakly typed languages? The difference between the two appears clear-cut. Well, the problem comes with treating these terms as categories and trying to fit languages into one or the other.

Does a language that raises an error on most mismatched types fit into the strongly typed category? Or is it considered weakly typed since it allows some implicit type conversion? Or does it fit into neither since it is, strictly speaking, neither?

Even though I label these as categories, I think most people consider them different ends of a spectrum. Thus, the concepts help us classify one language relative to other languages. Though, doing so is still muddy, and somewhat less informative than taking the categorical approach.

*Static/Dynamic + Weakly/Strongly typed languages*
  Setting aside the hangup with distinguishing strongly and weakly typed languages, let's try to figure out what it means for a language to have static or dynamic typing AND be strongly or weakly typed.

  Static Typing + Strongly Typed Language: This is a language that checks type at compile time (not runtime), and will raise an exception if different types are mixed together.

  Static Typing + Weakly Typed Language: This is a language that checks type at compile time (not runtime), and will not raise an exception if different types are mixed together. (very rare)

  Dynamic Typing + Strongly Typed Language: This is a language that checks type at runtime (not compile time), and will raise an exception if different types are mixed together.

  Dynamic Typing + Weakly Typed Language: This is a language that checks type at runtime (not compile time), and will not raise an exception if different types are mixed together.

*Summary*
  Static/Dynamic typing --> Describe when variable types are acquired.
  Strongly/Weakly typed languages --> Describe whether differently typed variables can be mixed and matched.

  Static typing --> Types are checked at compile time (cannot change type)
  Dynamic typing --> Types are checked at runtime (can change type)

  Strongly typed languages --> No implicit type conversion
  Weakly typed languages --> Implicit type conversion

*Sources & Further Reading*
  Lamontagne, F., "Ruby is dynamically AND strongly typed", http://www.rubyfleebie.com/ruby-is-dynamically-and-strongly-typed/ (July 2007)
  "Wikipedia: Type Safety", https://en.wikipedia.org/wiki/Type_safety
  "Wikipedia: Strong and Weak Typing", https://en.wikipedia.org/wiki/Strong_and_weak_typing
  "StackOverflow: Static/Dynamic vs. Strong/Weak", http://stackoverflow.com/questions/2351190/static-dynamic-vs-strong-weak
  "StackOverflow: What is the difference between statically typed and dynamically typed languages?", http://stackoverflow.com/questions/1517582/what-is-the-difference-between-statically-typed-and-dynamically-typed-languages
  "Stack Overflow: Is there a statically weak typed language?" http://stackoverflow.com/questions/14046246/is-there-a-statically-weak-typed-language
