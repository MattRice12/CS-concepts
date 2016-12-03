# What are symbols
  	sum = {one: 1, two: 2, three: "yay"}
  	sym[:one] #=> 1
  	sym[:three] #=> "yay"

  	Symbols are immutable. Their value remains constant during the entirety of the program.
      *Symbol Object ID stays the same*
        :mysymbol.object_id = 3087068
        :mysymbol.object_id = 3087068
      *Strong Object ID changes*
        "mystring".object_id = 70096215673440
        "mystring".object_id = 70096241443620

# Advantages: (performance, conserves memory, immutable)
  *Performance*
    Symbols generally have performance benefits. Each symbol is identified to the programmer by its name (for instance, :mysymbol), but the program can identify it by its numeric representation, which of course is a quicker lookup.

    When two strings are compared, somewhere in some abstraction layer pointers must walk both strings, looking for a mismatch. When two Ruby symbols are compared, if their numeric representation is equal, then the symbols are equal. If you were to use :mysymbol twenty times in your program, every usage of :mysymbol would refer to exactly the same object with exactly the same numeric representation and exactly the same string representation.  This can enhance performance.

  *Memory Conservation*
    Because every :mysymbol refers to exactly one object and yet "defines" (I use the term loosely) a literal string, it saves considerable memory over using a literal string every time, because each true literal string consumes memory, whereas once a symbol is defined, additional usages consume no additional memory. So if you use the same literal string tens or hundreds of times, substitute symbols. Hash keys are an excellent example.

  *Immutable*
    The big advantage of symbols is that they are immutable (can't be changed at runtime), and sometimes that's exactly what you want.
