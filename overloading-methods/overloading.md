This post is about the flexibility that Ruby offers to its users. Specifically, I cover the topic of Method Overloading and how it's not, strictly speaking, present in Ruby but still effectively attainable.

# Method Overloading
Method Overloading is a feature that allows a class to have two or more methods with the same name but with different signatures.

Method overloading is achieved by either:
  1. Having arguments with different data types
    `method(int a, int b)` vs `method(String a, String b)`
  2. Having a different number of arguments
    `method(a)` vs `method(a, b)`

___________________________

# Arguments with different data types
  Method overloading makes sense in a language with static typing--that is, in a language where you can distinguish between different types of arguments. However, because Ruby has dynamic typing, overloading methods based on different types of arguments is not allowed.

  Example of method overloading in a language that is statically typed (Java):
  |  class Calculation2{  
  |    void sum(int a,int b){System.out.println(a+b);}  
  |    void sum(double a,double b){System.out.println(a+b);}  
  |
  |    public static void main(String args[]){  
  |    Calculation2 obj=new Calculation2();  
  |    obj.sum(10.5,10.5);  
  |    obj.sum(20,20);  
  |
  |    }  
  |  }  

  |  Output:
  |    21.0
  |    40

  In this example, the methods have the same name (`sum`) and the same number of parameters (2). However, because the parameters are typed differently, the arguments passed in affect which version of `sum` is called.

  However, since Ruby has dynamic typing and thus disallows setting type in the parameters, the only way to define the above sum method is `sum(a, b)`.

  Nevertheless, we can still achieve method overloading by differentiating type in the method body rather than in the parameters. The method body needs to contain logic that branches depending on the arguments' data types. In other words, after we pass in a parameter of any type, we instruct our method to identify the argument type and (e.g.,) handle Strings one way, Fixnums a different way, Arrays a third way, and so on for each type we want to control. For example (Ruby):

    def sum(a, b)
      if (a.class == Fixnum) && (b.class == Fixnum)
        a + b
      elsif (a.class == Float) || (b.class == Float)
        (a + b).round(2)
      end
    end

  puts sum(10.5,10.5)
  puts sum(20,20)

  |  Output:
  |    21.0
  |    40

  While this doesn't meet the definition of method overloading (having two methods with the same name within the same class that do different things based on their arguments), it has the same effect.

____________________________

# Variable number of arguments
  The second type of method overloading involves two methods with arguments that differ in number (rather than type). Here is an example in Java:

    class Calculation{  
      void sum(int a,int b){System.out.println(a+b);}  
      void sum(int a,int b,int c){System.out.println(a+b+c);}  

      public static void main(String args[]){  
      Calculation obj=new Calculation();  
      obj.sum(10,10,10);  
      obj.sum(20,20);  

      }  
    }  

  Both methods concurrently exist, and one or the other is called depending on how many arguments are passed in.

  Well, what about Ruby? Can Ruby achieve method overloading when the arguments differ not by type but by number--i.e., can a class have both methods, `method(a)` and `method(a, b)`?

  Strictly speaking, no. Not in the way same way that Java can. A Ruby class can have only one method with a given name (if you define a method with the same name twice, the latter method definition prevails).

  However, within that single method we can put logic that branches depending on how many objects were passed in as arguments. In other words, we have to structure the method a certain way to make it work. The following by itself will throw an error:

    def sum(a, b)
      a + b
    end

    def sum(a, b, c)
      a + b + c
    end

    sum(5, 6)
    #=> ArgumentError: wrong number of arguments(given 2, expected 3)

    sum(5, 6, 7)
    #=> 18

  In this situation, the second method is overriding the first; thus, the method requires 3 arguments and doesn't provide the option to receive anything other than 3 arguments.

  However, if we again revert to using one method over two, we can achieve method overloading in Ruby. To do so, one option is to use default values:

  def sum(a, b, c = 0)
    a + b + c
  end

  sum(5, 6)
  #=> 11

  sum(5, 6, 7)
  #=> 18

  This gets us the result we wanted; and as a bonus, it gets us something more concise and all inclusive in one small method.

  In addition, Ruby allows us to take it one step further to include an unlimited number of arguments for our `sum` method using the splat operator and the inject method:

    def sum(\*args)
      args.inject(0, &:+)
    end

    sum(5, 6)
    #=> 11

    sum(5, 6, 7, 8, 9)
    #=> 35

    sum()
    #=> 0

  Let's look at something besides class Numeric and see if we can get this to work with class Hash:

    def play_game(options)
      if options[:player1] and options[:player2]
        "Play a game together."
      elsif options[:player1]
        "Get more friends."
      end
    end

    play_game(player1: 'Matt')
    #=> "Get more friends."

    play_game(player1: 'Matt', player2: 'Gerald')
    #=> "Play a game together."

  In all three of these examples, we get our result. Yay! But there also seems to be a downside to this--namely, that by using default values, the splat operator with .inject, or options, we now limit our inputs to certain data types.

  Although we can effectively achieve method overloading in Ruby, to get it to work, we sometimes have to structure it in a way to make it work. Unfortunately, in structuring it to make it work, we sometimes have to make a tradeoff. And in this situation, because we can't truly achieve method overloading in a language with dynamic typing, we're making a tradeoff--we're giving up the freedom we get from dynamic typing so we can gain something else that's available to languages with static typing.

  But this trade off is a great thing for Rubyists. We get the best of both worlds. We can choose whether we want to overload a method or not--whether we want our program to raise an exception when we tried to overload a method but accidentally overrode an earlier method. Moreover, it allows us to keep all of the logic nicely tucked away in a single method, which is a nice safeguard. Since we only need one method, we lower the risk of accidentally duplicating methods, or having them scattered around when our classes get unfortunately monolithic. Lastly, it keeps our codespace clean and DRY.

  So, maybe Ruby can't have pure method overloading, but it does have the flexibility to get there. And that's pretty neat.

# Sources and Continued Reading
"Ruby Overloading Methods", http://rubylearning.com/satishtalim/ruby_overloading_methods.html

"Why doesn't ruby support method overloading?", http://stackoverflow.com/questions/9373104/why-doesnt-ruby-support-method-overloading

"Method Overloading in Java", http://www.javatpoint.com/method-overloading-in-java

"Wikipedia: Function Overloading",https://en.wikipedia.org/wiki/Function_overloading
