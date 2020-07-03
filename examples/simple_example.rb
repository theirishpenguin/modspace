#!/usr/bin/env ruby

# This line is only needed if you don't have the modspace gem installed (and
# you are in the root directory of modspace cloned repo
$:.unshift File.dirname('./lib/modspace')

#require 'byebug'; debugger
require 'modspace'

# 1) Create a new namespace (ie. nested module) in one line...
Modspace.def_mod(self, 'Foo', 'Bar', 'Zoo1')

if Foo::Bar::Zoo1.is_a? Module
    puts "1) We have defined a nested module Foo::Bar::Zoo1"
else
    raise StandardError
end

# 2) Create a new namespace (ie. nested module) and assign it to a variable...
zoo2_module = Modspace.def_mod(self, 'Foo', 'Bar', 'Zoo2')

if zoo2_module == Foo::Bar::Zoo2
    puts "2) We have defined a nested module Foo::Bar::Zoo2 and assigned it to the variable zoo2_module"
else
    raise StandardError
end
