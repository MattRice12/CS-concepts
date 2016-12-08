# Polymorphism
Polymorphism is when you have a class and then you have a class that inherits from it, when that inherited class changes the behavior of a specific method or process in the parent class.

  Example

  class ParentClass
    def my_name
      puts "My name is Bob."
    end

    def greetings_from_bob
      puts "Hi there good sir."
    end
  end

  class ChildClass < ParentClass
    def greetings_from_bob
      puts "Hi-ho neighbor!"
    end
  end

  child = ChildClass.new

  child.my_name
  #=> "My name is Bob."

  child.greetings_from_bob
  #=> "Hi-ho neighbor"

# Super

If you don't want the child class to override the behavior of the parent class, use super.

  Example:

  class ParentClass
    def greetings_from_bob
      puts "Hi there good sir."
    end
  end

  class ChildClass < ParentClass
    def greetings_from_bob
      super
      puts "Hi-ho neighbor!"
    end
  end

  child = ChildClass.new

  child.greetings_from_bob
  #=> "Hi there good sir"
  #=> "Hi-ho neighbor"
