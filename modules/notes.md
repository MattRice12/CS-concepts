# What is a module
  Modules at first look a lot like classes. Both appear to be large buckets of methods. However, whereas classes hold data and can have multiple instances, modules cannot be instantiated -- i.e., although Module.method will work, Module.new.method will not. Modules are often referred to as libraries for this reason. Their effectiveness comes from being easily sharable libraries of methods. In Ruby, classes cannot have multiple inheritance; each class can only have one parent class (superclass). Modules effectively give us multiple inheritance since any number of them can be included in classes as mixins (through 'include' and 'extend'). 


  Modules are a way of grouping together methods, classes, and constants. Modules give you two major benefits.
    1. Modules provide a namespace and prevent name clashes.
    2. Modules implement the mixin facility.

  Modules define a namespace, a sandbox in which your methods and constants can play without having to worry about being stepped on by other methods and constants.

# Why are modules useful?
  Modules help keep things organized, help prevent duplication, and add functionality to classes.


Carlson, L., Richardson, L., Ruby Cookbook: Modules and Namespaces (Aug 2015), https://www.oreilly.com/learning/ruby-cookbook-modules-and-namespaces
