# Modules Part II: How to Use Modules

Introduction:
In Part I, I discussed what a module is and how it differs from a class. In this part, I discuss how to use modules. More specifically, I begin by briefly discussing namespacing and mixins and then go on to discuss how `require` and `load` methods are used to make a module accessible in a file, and how `include` and `extend` are used to make the methods in a module accessible to a class.

## How to use modules
  Ruby Docs gives us a hint on how to use modules when explaining the benefits of modules:
    1. Modules provide a namespace and prevent name clashes.
    2. Modules implement the mixin facility.

  Module namespacing means that you can name methods in the module however you want without having to consider method names in other modules/methods which might interact with this module. This is achieved by prefixing the method with the module name--e.g., `Module.method`, or `Math.sqrt(x)`. These are called 'module methods' and may be called without creating an encapsulating object. Because of the module prefix, I can have two modules or classes with the same method name (e.g, Mod1.cos and Mod2.cos) without either method interfering with the other.

  Creating module methods is a two step process:
    1. In the module, define the method as:
      module Mod
        def Mod.method  ##or Mod::method
          ...
        end
      end

    2. Call the module method in the class (you can also call a module method outside of a class or within another module)
      class Person
        def name
          Mod.method  ##or Mod::method
        end
      end

  Another way to call methods inside of modules is to include the module in a class. This is called a mixin and facilitates calling the method directly through the class--e.g., `Class.new.module_method`. By mixing the module into the class, the class changes by incorporating all of the module methods in itself. The way to achieve this is described in the *Include* and *Extend* sections below. Mixins allows us to call the method through the class without more than a single-line reference to the module.

  However, since you can call the methods without reference to the modules, identically named methods will overlap. If the mixed-in module method overlaps with the class's method, the class's method wins. If two mixed-in methods overlap, the last included module's method trumps.

# Require and Load
  Before our class has any access to the methods in the module, we have to load the module library into the file in which the class resides. We can do so using either `require` or `load`; though, each apply in certain situations.

  *Require*
    The 'require' method allows you to load a module file into the present file. You will only need to 'require' the module if you are loading the module from a separate file, which will usually be the case.

    Unlike 'load', 'require' keeps track whether it has already been loaded or not and prevents you from loading the library more than once. Requiring the library a second time will return ‘false’.

    Place the require method at the top of the .rb file into which you are loading the library. When doing so, you do not need to specify the “.rb” extension of the library file name. However, you need to specify the directory of the library and can do so in one of the following ways:
      1. require './conversation'
      2. require_relative 'conversation'
      3. $LOAD_PATH << '.'
         require 'conversation'

  *Load*
    The 'load' method is almost like the 'require' method except it doesn’t keep track of whether or not that library has been loaded. So it’s possible to load a library multiple times.

    Most of the time, you’ll want to use 'require' instead of 'load' but 'load' is there if you want a library to be loaded each time load is called. For example, if your module changes its state frequently, you may want to use 'load' to pick up those changes within classes loaded from.

    Place the load method at the very top of your “.rb” file. Loading a method file differs from requiring a method file in two ways. First, when using 'load' you must specify the “.rb” extension of the library file name. Second, you only need to specify the directory if the file is not located in the current directory.
      load 'conversation.rb'
      load '../lib/paint_components.rb'


# Include and Extend
  While 'require' and 'load' are used to incorporate a library file into the class file (unless they are one and the same), 'include' and 'extend' are used in 'mixin' the module methods into the class.

  *Include*
    Include lets your modules add methods to instances of a class.

    When you 'include' a module into your class, you effectively take the methods defined within the module and insert them into the class. These methods become instance methods in the class and can be accessed through `Class.new.module_method`.

    Example:
      module Conversation
        def salutation(string)
          "Hi my name is #{string}."
        end
      end

      class Person
        include Conversation
        ...
      end

      adam = Person.new.salutation("Adam Smith")
      puts adam

      # This will print “Hi my name is Adam Smith.”

  *Extent*
    Extend lets your modules add class methods to the class.

    This is similar to 'include'. However, when using 'extend' instead of 'include', you add the module’s methods as class methods instead of as instance methods to the class. Thus, they are called through `Class.module_method` rather than through `Class.new.module_method`.

    Example:
      module Conversation
        def valediction(string)
          "#{string} bids you a fair farewell."
        end
      end

      class Person
        extend Conversation
        ...
      end

      adam = Person.valediction("Adam Smith")
      puts adam

      # This will print “Adam Smith bids you a fair farewell.”

  *To Mix-in or Not to Mix-in?*
    As discussed above, methods inside modules can be called in two different ways -- as *mixins* in classes or as *module methods* within or without classes.

    Now that you *can* do it either way, *should* you do it either way? The answer to this is contingent on whether you want the class to inherit the methods or simply have access to them and have added functionality. In the former situation, you are changing the class itself; in the latter, the class remains the same.

  *Summary*
    For a quick conceptual recap, the following helps keep things organized in my head:
      Namespacing -> No outside naming interference
      Mixins -> Achieves Multiple Inheritance

      Require -> loads library file (only once)
      Load -> loads library file (multiple times)

      Include -> Instance Methods
      Extend -> Class Methods

    As always, if anything is wrong or misleading or if you have any questions or suggestions please let me know at mattrice12@outlook.com.

  *Sources*
    1. Kamali, N., Ruby Require VS Load VS Include VS Extend, http://ionrails.com/2009/09/19/ruby_require-vs-load-vs-include-vs-extend/ (Sept. 2009)
    2. Carlson, L., Richardson, L., "Ruby Cookbook: Modules and Namespaces" (Aug 2015), https://www.oreilly.com/learning/ruby-cookbook-modules-and-namespaces
    3. Aimonetti, M., https://matt.aimonetti.net/posts/2012/07/30/ruby-class-module-mixins/ (July 2012)
    4. "TutorialsPoint: Ruby Modules and Mixins", https://www.tutorialspoint.com/ruby/ruby_modules.htm
    5. "Programming Ruby - The Pragmatic Programmer's Guide", http://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html (2001)
