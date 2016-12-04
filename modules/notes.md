# Introduction
  Roughly one week from the publishing of this post will mark six months since I began learning Ruby. In this time, I've come to love playing around with the language, forming microverses with interrelating classes and methods. From time to time, I have also incorporated modules while creating these microverses. I would typically use modules either of two situations: when testing or when someone on StackOverflow suggested to use a library to simplify my code and add functionality quickly rather spending time building every component completely from the ground up. And for the time being, this was as far as my understanding and concern for modules went. I knew that modules provided additional functionality, but other than that I wasn't too sure what they were or how to create them. And when I was recently asked to define what a module is, it finally dawned on me--modules are everywhere, why the hell don't I know this? Therefore, this post is the culmination of my research for figuring this out.

  This topic is broken up into two blog posts because frankly I write too much, and I hate reading blog posts that take me longer than 6 minutes. Part I covers the question of defining what a module is. Part II covers how to use module methods and constants.

  As a disclaimer, though I provide some sources and continued reading at the bottom, this is by no means scholarly. Moreover, some of the finer points are purposefully glossed over in favor of creating a broader picture without gumming it up too much with details.

# Modules Part I: What is it?
  According to Ruby Docs, modules are a way of grouping together methods, classes, and constants. I like to think of them as large buckets, or as they are more commonly known, libraries. From a starting place, this concept not so overwhelming. However, the complexity comes with how to differentiate modules from classes and with how to use module methods and constants.

  ## Differentiating Modules from Classes
    Modules at first look a lot like classes. Both appear to be large collections of methods. However, whereas classes hold data and can have multiple instances, modules cannot be instantiated--e.g., although Module.method will work, Module.new.method will not. Because classes have data and methods that manipulate that data, we can create instances of these classes, and its methods will color that data we give it accordingly. Since we cannot create instances of modules, the methods within a module do not color the module itself. Instead, we use the methods in modules to color something else.

    Modules are often referred to as libraries because they are tools which can be used to create many things. Much of what makes modules so useful is the ability to share these libraries and tools between different classes. By contrast, classes in Ruby cannot have multiple inheritance; each class can only have one parent class (superclass). However, we can get around this and achieve multiple inheritance by including modules in classes as mixins (through 'include' and 'extend', which will be explained in Part II).

    To bring this all together, let's try an analogy. Assume that we have a class called OilPainting--an instance of which might be "The Starry Night" by Van Gogh. To create this instance, we need several methods, some of which are "paints", "brushes", and "techniques." We have options where to include these methods. We can include them in the class directly or in a module (module PaintComponents) and then make the module a mixin of the class (e.g., `include PaintComponents`). Either option would work, and if we are only creating oil paintings, putting it all in one class might be the simplest solution.

    However, maybe we want different classes of paintings such as WatercolorPainting or AcrylicPainting. To keep our code DRY (Don't Repeat Yourself), we could either create our module PaintComponents here, or we could continue only using classes by creating a superclass Painting which will include the general methods "paints", "brushes", and "techniques" and subclasses Oil, Watercolor, Acrylic. Either would work fine.

    However, the more our world expands, the less applicable one superclass will be to all situations. What if we had a class House and that at some point used the methods "paints" and "brushes" in its design. House would not be a subclass of Paintings, since a House is so much more than a Painting (and for that matter, we couldn't make House a superclass of Painting because Painting occurs in many situations that do not involve houses). More likely, House would be a subclass of Architecture or something similar. But because Ruby does not allow multiple inheritance, House cannot be a subclass of both Architecture and Painting. One solution is to just copy over the methods "paints" and "brushes". However, this is not DRY code because we are repeating the same code in multiple places. And in many cases, we would be copying more than just two methods.

    Since we don't need to create an instance of "paints" or "brushes" (at this moment), we can stick it in a module, call the module `module PaintComponents`, and import it into any class where we are painting (e.g., class Oil, Watercolor, Acrylic, House, etc. -- or to import directly into fewer classes, just import PaintComponents into classes Painting and House).

    In sum, classes are something more of substance; modules are buckets of general components, or libraries (as they are more commonly known), that can be easily shared between classes. Using modules will help keep things organized, help keep your code DRY, and add functionality to classes.

    Finally, when should you use a module over a class? Some general principles may help:
      1. Use a class when you want to instantiate. Use a module when you have code that logically belongs together but you won't need to create an instance of it (This is not hard-and-fast rule, since you may want to use class methods which do not require instantiation--something I did not directly discuss).
      2. Use a class when behavior would only apply to that class. Use modules and mixins whenever you need to share behaviors between different classes. Because of no multiple inheritance, using modules becomes necessary quickly.

  Hopefully this explanation helps paint a picture (hah) of what a module is. If I have stated anything patently wrong (or even slightly wrong/misleading), or if you have any questions or suggestions please let me know at mattrice12@outlook.com.

Sources and Further Reading:

1. Carlson, L., Richardson, L., "Ruby Cookbook: Modules and Namespaces" (Aug 2015), https://www.oreilly.com/learning/ruby-cookbook-modules-and-namespaces
2. Aimonetti, M., https://matt.aimonetti.net/posts/2012/07/30/ruby-class-module-mixins/ (July 2012)
3. "TutorialsPoint: Ruby Modules and Mixins", https://www.tutorialspoint.com/ruby/ruby_modules.htm
4. "Programming Ruby - The Pragmatic Programmer's Guide", http://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html (2001)
