#Method Overriding
Method overriding, in object oriented programming, is a language feature that allows a subclass to provide a specific implementation of a method that is already provided by one of its superclasses. The implementation in the subclass overrides (replaces) the implementation in the superclass.
  Example:
  |  class A  
  |    def a  
  |      puts 'In class A'  
  |    end  
  |  end  

  |  class B < A  
  |    def a  
  |      puts 'In class B'  
  |    end  
  |  end  

  |  b = B.new  
  |  b.a  

# Super

The way super handles arguments is as follows:

  1. When you invoke super with no arguments Ruby sends a message to the parent of the current object, asking it to invoke a method of the same name as the method invoking super. It automatically forwards the arguments that were passed to the method from which it's called.
  2. Called with an empty argument list - super()-it sends no arguments to the higher-up method, even if arguments were passed to the current method.
  3. Called with specific arguments - super(a, b, c) - it sends exactly those arguments.






# Sources and Continued Reading
"Ruby Overriding Methods", http://rubylearning.com/satishtalim/ruby_overriding_methods.html
