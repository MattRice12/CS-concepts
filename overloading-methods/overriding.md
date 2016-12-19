#Method Overriding
Method overriding allows a subclass to provide a specific implementation of a method that is already provided by one of its superclasses. The implementation in the subclass overrides (replaces) the implementation in the superclass.

In other words, assume we have two classes, a subclass (child class) and a superclass (parent class). Normally, the child class inherits the methods in the parent class, so you can call the parent class's method through the child class. However, let's further assume that both parent and child classes have one method each, and both methods have the same name. By calling this method through the child class, the method in the parent class is overridden and ignored. Instead, the method in the child class trumps and is returned.

  Example:
    class A  
      def method
        p "Class A's method"
      end  
    end  

    class B < A
      def method
        p "Class B's method"
      end  
    end  

    b = B.new  
    b.method  
    #=> "Class B's method"

# Super
`Super` prevents method overriding. By including `super` in the child method, the parent method gets pulled into the child method and both get run.

  Let's look at a example of `super` in action:
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

  By including `super`, class B is reaching up to its parent class and invoking the method by the same name. Thus, we get "Hi there!" printed out followed by "Hello!" (the return value being only "Hello", since it's the final line of the method). If we left `super` out, only "Hello" would get printed.

  `Super` can be used to chain inherited classes together. Let's continue with the above example:

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

    class C
      def greeting
        p "Good Day!"
      end
    end

    class D < C
      def goodbye
        super
        p "Goodbye!"
      end
    end

    d = D.new
    d.goodbye
    #=> NoMethodError: super: no superclass method goodbye’

##Super with Method overloading
  `Super` is also great if we want to overload methods from a superclass or module. Method overloading (as explained here) is a feature that allows a class to have two or more methods with the same name but with different arguments--either by type or number. Here's an example of super being used with method overloading:
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

##Super with Arguments
    Ruby helps us out when using super with methods that require arguments. We'll look at three situations when calling super when the methods of the same name require arguments.

      1. `super(a, b, c)` -- Called with specific arguments, super sends exactly those arguments.
      2. `super` -- Invoking super with no arguments sends a message to the parent object, asking it to invoke a method of the same name as the method invoking super. It automatically forwards the arguments that were passed to the method from which it's called.
      3. `super()` -- Called with an empty argument list, super sends no arguments to the higher-up method, even if arguments were passed to the current method.

    # 1. super(a, b, c)
    The first point seems pretty straightforward, once you realize how `super` generally works. Since we are invoking the parent method, we need to pass arguments into the parent method. In this case, `super` is essentially just a method call to a parent method that would otherwise be overridden.

      class Person
        def vice(name, age)
          p "#{name} just turned #{age} and wants to do something fun."
        end
      end

      class Activities < Person
        def vice(name, age)
          super(name, age)
          if age >= 21
            p "#{name} can drink."
          else
            p "#{name} is too young to drink."
          end
        end
      end

      timmy = Activities.new
      timmy.vice("Lil' Timmy", 21)
      #=> "Lil' Timmy just turned 21 and wants to do something fun."
      #=> "Lil' Timmy can drink."

    # 2. super
    The second point helps keep our code DRY. Rather than calling `super(name, age)`, we can just call `super` without any parentheses or arguments. Doing so automatically passes the arguments to the parent method. This is not a huge change, but it keeps things tight.

    # 3. super()
    The third point is a bit trickier. Unlike `super` without parentheses, `super()` with parentheses will compare the number of arguments you passed in with the parent parameters. If there is a mismatch, then Ruby will raise an error. So predictably, if the parent class has two parameters, but you call `super()` without passing any arguments, Ruby will raise the exception that the wrong number of arguments were passed in.

      class MathSuper
        def math(a, b)
          p "We have numbers #{a} and #{b}"
        end
      end

      class MathChild < MathSuper
        def math(a, b)
          super()
          p a + b
        end
      end

      b = MathChild.new
      b.math(5, 2)
      #=> ArgumentError: wrong number of arguments (given 0, expected 2)

    However! There is a small case where using `super()` is useful. That is when the method in the parent class does not ask for any arguments, even though the one in the child class requires arguments. Because Ruby automatically passes arguments to the parent method when you use `super` without parentheses, unless the parent method has parameters, Ruby will raise an exception. Thus using `super()` with parentheses explicitly tells Ruby to pass no arguments to the parent method.

      class MathSuper
        def math
          p "Do the monster math."
        end
      end

      class MathChild < MathSuper
        def math(a, b)
          super()
          p a + b
        end
      end

      b = MathChild.new
      b.math(5, 2)

      #=> "Do the monster math."
      #=> "7"

# Sources and Continued Reading
"Ruby Overriding Methods", http://rubylearning.com/satishtalim/ruby_overriding_methods.html

"Super keyword in Ruby", http://stackoverflow.com/questions/4632224/super-keyword-in-ruby

"Initialize and super with parameters", https://www.ruby-forum.com/topic/158543
