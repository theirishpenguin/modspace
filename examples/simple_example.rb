#!/usr/bin/env ruby

# This line is only needed if you don't have the modspace gem installed (and
# you are in the root directory of modspace cloned repo
$:.unshift File.dirname('./lib/modspace')

require 'modspace'

# 1) Create a new namespace (ie. nested module) in one line...
Modspace.def_mod('Foo', 'Bar', 'Zoo1')

if Foo::Bar::Zoo1.is_a? Module
    puts "1) We have defined a nested module Foo::Bar::Zoo1"
else
    raise StandardError
end

# ^ Note: Defaults to defining the namespace within "Object", as that is the top-level namespace within Ruby programs

# 2) Create a new namespace and assign it to a variable...
zoo2_module = Modspace.def_mod('Foo', 'Bar', 'Zoo2')

if zoo2_module == Foo::Bar::Zoo2
    puts "2) We have defined a nested module Foo::Bar::Zoo2 and assigned it to the variable zoo2_module"
else
    raise StandardError
end

# 3) Create a new namespace within a class...
class SomeClass; end

zoo3_module = Modspace.def_mod('Foo', 'Bar', 'Zoo3', in_namespace: SomeClass)

if zoo3_module == SomeClass::Foo::Bar::Zoo3
    puts "3) We have defined a nested module Foo::Bar::Zoo3 within an explicit class"
else
    raise StandardError
end

# 4) Create a new namespace within a class given an instance...

an_instance_of_some_class = SomeClass.new

zoo4_module = Modspace.def_mod('Foo', 'Bar', 'Zoo4', in_class_of_instance: an_instance_of_some_class)

if zoo4_module == SomeClass::Foo::Bar::Zoo4
    puts "4) We have defined a nested module Foo::Bar::Zoo4 within the class of a specified object"
else
    raise StandardError
end

# 5) Create a new namespace within a module...
module SomeModule; end

zoo5_module = Modspace.def_mod('Foo', 'Bar', 'Zoo5', in_namespace: SomeModule)

if zoo5_module == SomeModule::Foo::Bar::Zoo5
    puts "5) We have defined a nested module Foo::Bar::Zoo5 within an explicit module"
else
    raise StandardError
end

# 6) Create a new namespace within a module using the shortcut syntax...
module SomeModule; end

zoo6_module = Modspace.def_mod('Foo::Bar::Zoo6', in_namespace: SomeModule)

if zoo6_module == SomeModule::Foo::Bar::Zoo6
    puts "6) We have defined a nested module Foo::Bar::Zoo5 within an explicit module using shortcut syntax"
else
    raise StandardError
end
