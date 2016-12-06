# Overloading Methods
Method overloading can be achieved by declaring two methods with the same name and different signatures. These different signatures can be either:
  1. Arguments with different data types
    `method(int a, int b)` vs `method(String a, String b)`
  2. Variable number of arguments
    `method(a)` vs `method(a, b)`

  We cannot achieve method overloading using the first way because there is no data type declaration in ruby (dynamic typed language). So the only way to define the above method is def(a,b)

  With the second option, it might look like we can achieve method overloading, but we can't. Let say I have two methods with different number of arguments:

  |  def method(a); end;
  |  def method(a, b = true); end;
  |
  |  method(10)

  Because the second value has a default value = true, calling method(10) can match the first method as well as the second one, which is the problem.

  Therefore, Ruby needs to maintain one method in the method look up chain with a unique name.
____________________________

# Arguments with different data types
  |  def method(param)
  |      case param
  |      when String
  |           method_for_String(param)
  |      when Type1
  |           method_for_Type1(param)
  |      else
  |           #default implementation
  |      end
  |  end

____________________________

# Variable number of arguments
  *Situation:* You want to create two different versions of a method with the same name: two methods that differ in the arguments they take.

  *Problem:* A Ruby class can have only one method with a given name (if you define a method with the same name twice, the latter method definition prevails).

  *Solution:* However, within that single method you can put logic that branches depending on how many and what kinds of objects were passed in as arguments.

  *Example 1*

    @Problem
    |  def my_method(arg1)
    |    ...
    |  end
    |
    |  def my_method(arg1, arg2)
    |    ...
    |  end

    @Solution1 --> @Splats
    |  def my_method(\*args)
    |    if args.length == 1
    |      #method 1
    |    else
    |      #method 2
    |    end
    |  end

    @Solution2 --> @Hashes
    |  def my_method(options)
    |    if options[:arg1] and options[:arg2]
    |      #method 2
    |    elsif options[:arg1]
    |      #method 1
    |    end
    |  end

    |  my_method(arg1: 'hello', arg2: 'world')


  *Example2*
    Here's a Rectangle class that represents a rectangular shape on a grid. You can instantiate a Rectangle by one of two ways:
      1. By passing in the coordinates of its top-left and bottom-right corners
        `Rectangle.new([x_top, y_left], [x_bottom, y_right])`

        -OR-

      2. By passing in its top-left corner along with its length and width.
        `Rectangle.new([x_top, y_left], length, width)`

    There's only one initialize method, but you can act as though there were two.

  |  class Rectangle  
  |    def initialize(\*args)  
  |      if args.size == 2  
  |        puts 'Two arguments'  
  |      else  
  |        puts 'Three arguments'  
  |      end  
  |    end  
  |  end  
  |
  |  Rectangle.new([10, 23], 4, 10)  
  |  Rectangle.new([10, 23], [14, 13])
