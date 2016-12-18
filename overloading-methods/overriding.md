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
  |  #=> "In class B"

# Super

The way super handles arguments is as follows:

  1. When you invoke super with no arguments Ruby sends a message to the parent of the current object, asking it to invoke a method of the same name as the method invoking super. It automatically forwards the arguments that were passed to the method from which it's called.
  2. Called with an empty argument list - super()-it sends no arguments to the higher-up method, even if arguments were passed to the current method.
  3. Called with specific arguments - super(a, b, c) - it sends exactly those arguments.

  The following is a simple example of super in action:
    class A
      def greeting
        p "Hi there!"
      end
    end

    class B < A
      def greeting
        super
        p "Hello!"
      end
    end

    b = B.new
    b.greeting
    #=> "Hi there!"
    #=> "Hello!"

  By including super, class B is reaching up to its parent class and invoking the method by the same name. Thus, we get "Hi there!" printed out followed by "Hello!" (the return value being only "Hello", since it's the final line of the method). If we left `p super` out, only "Hello" would get printed.

  Super can be used to chain inherited classes together. Let's continue off of the above example:

    class C < B
      def greeting
        super
        p "Good Day!"
      end
    end

    c = C.new
    c.greeting
    #=> "Hi there!"
    #=> "Hello!"
    #=> "Good Day!"

  However, if there is no parent method of the same name, Ruby will raise an exception:

    class D < C
      def goodbye
        super
        p "Goodbye!"
      end
    end

    d = D.new
    d.goodbye
    #=> NoMethodError: super: no superclass method goodbye’

  Super is also great if you want to overload methods from a superclass or module. Method overloading is (as explained here) a feature that allows a class to have two or more methods with the same name but with different arguments--either by type or number. Here's an example of super being used with method overloading:
    module A
      def combine(first, last)
        first + last
      end
    end

    class B
      include A
      def combine(first, last)
        if first.is_a?(String) || last.is_a?(String)
          first + " " + last
        else
          super
        end
      end
    end

    b = B.new
    b.combine("Matt", "Rice") #=> "Matt Rice"
    b.combine(5, 7) => 12




# Sources and Continued Reading
"Ruby Overriding Methods", http://rubylearning.com/satishtalim/ruby_overriding_methods.html

"Super keyword in Ruby", http://stackoverflow.com/questions/4632224/super-keyword-in-ruby
