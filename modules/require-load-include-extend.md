# Require/Load, Include/Extend
  *Require*
    The require method allows you to load a library. The require method only needs to be used if library you are loading is defined in a separate file, which is usually the case.

    Require prevents the library from being loaded more than once. The require method will return ‘false’ if you try to load the same library after the first time.

    So it keeps track of whether that library was already loaded or not. You also don’t need to specify the “.rb” extension of the library file name.

    Place the require method at the top of your .rb file. You need to specify the directory of the library via one of the following:
      1. require './conversation'
      2. require_relative 'conversation'
      3. $LOAD_PATH << '.'
         require 'conversation'

  *Load*
    The load method is almost like the require method except it doesn’t keep track of whether or not that library has been loaded. So it’s possible to load a library multiple times and also when using the load method you must specify the “.rb” extension of the library file name.

    Most of the time, you’ll want to use require instead of load but load is there if you want a library to be loaded each time load is called. For example, if your module changes its state frequently, you may want to use load to pick up those changes within classes loaded from.

    Place the load method at the very top of your “.rb” file. Unlike require, you only need to specify the directory if the file is not located in the current directory.
      load 'conversation.rb'

  *Include*
    Include lets your modules add methods to instances of a class.

    When you Include a module into your class as shown below, it’s as if you took the code defined within the module and inserted it within the class, where you ‘include’ it. It allows the ‘mixin’ behavior. It’s used to DRY up your code to avoid duplication, for instance, if there were multiple classes that would need the same code within the module.

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
    Extend lets your modules add methods to class methods.

    This is similar to 'include'. However, when using the extend method instead of include, you are adding the module’s methods as class methods instead of as instance methods.

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
    Module methods can be called in Classes in two different ways -- as *mixins* or as *exposed methods*

    By including or extending a module into a class, that module's methods are being added or "mixed-in" as instance or class methods, respectively, to the class. The benefit of this is that of overcoming the multiple-inheritance limitation in Ruby -- i.e., in Ruby, classes cannot inherit from more than one class. However, classes can have an unlimited number of modules. Therefore, with mixins, we effectively have multiple inheritance.

    However, methods inside modules can still be accessed even without including or extending that module in the class. These methods are called Exposed Methods. This is a two step process:
      1. In the module, define the method as:
        module Mod
          def Mod.method  ##or Mod::method
            ...
          end
        end

      2. Call the module method in the class
        class Person
          def name
            Mod.method  ##or Mod::method
          end
        end

    So now that you *can* do it either way, *should* you do it either way? The answer to this is contingent on whether you want the class to inherit the methods or simply have access to them. In the former situation, you are changing the class itself; in the latter, the class remains the same.

  *Summary*
    Require -> loads library (only once)
    Load -> loads library (multiple times)

    Include -> Instance Methods
    Extend -> Class Methods
