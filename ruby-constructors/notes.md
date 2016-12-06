# Ruby Constructors

  * `.new` is the only Ruby constructor (not initialize)
    `.new` is inherited from Object

  * `initialize` is not a constructor;
    `initialize` is a method called by the constructor `new` by default.
    `initialize` is used to assign instance variables their initial values

  Many languages use a ‘new’ keyword which Ruby does not have to create an object instance. Ruby instead provides a method ‘new’ which is called directly on a class.

  The Ruby Constructor has three jobs.
    1. It allocates space for the object
    2. It assigns instances variables their initial values
    3. It returns the instance of that class

  *initialize* --> is defined as an instance method
  *.new* --> is called on the class; thus, it's a class method


# Constructor overloading
  Ruby doesn't technically allow constructor overloading. However, you can achieve the same result as you can in other languages using a variety of mechanisms including :
    1. Default values for arguments,
    2. Variable Argument lists (The splat operator)
    3. Defining your argument as a hash

    Examples:

      *Default values for arguments*
      class Person
        def initialize(name, lastName = nil)
          name = name + " " + lastName unless lastName.nil?
          @name = name
        end
      end

      *Splat operator*
      class Person
        def initialize(\*args)
          #Process args (An array)
        end
      end

      *Defining argument as a hash*
      class Person
        def initialize(args={})
          name = args["name"] + " " + args["lastName"] unless args["lastName"].nil?
          @name = name
        end
      end
