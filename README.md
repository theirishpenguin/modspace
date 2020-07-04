# Modspace


Modspace is a small library to allow the easy definition and management of namespaces and nested modules in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'modspace'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install modspace

## The Problem

In Ruby, if you want to define nested modules you typically have to do some
extreme indentation in your source code files. For example, to define
a function - `some_funct()` - in a module, such as `Foo::Bar::Zoo::Shoe`,
would require this...

    module Foo
        module Bar
            module Zoo
                module Shoe
                    def some_funct
                        puts "Eek"
                    end
                end
            end
        end
    end

This "nested plane of death" can be a massive pain. Not only does it
look awkward but, given many teams have coding standards with set line
length limits, it quickly eats up your available character count. Why
should a developer be penalised for nesting modules? (Unneccessary
nesting is not recommended of course!) One solution is to define the
parent namespace in advance of the implementation - and this is much
better...

    # Define parent namespace
    module Foo
        module Bar
            module Zoo
            end
        end
    end

    # Implementation
    module Foo::Bar::Zoo::Shoe
        def some_funct
            puts "Eek"
        end
    end

_Note: We use the term "namespace" to mean a nested module or nested class._

__The Modspace gem goes the extra mile and let's you clean up the
definition of the parent namespace (or any namespace for that matter) as
we will see in the next section.__

## Usage

Define a new namespace (ie. nested module), such as `Foo::Bar::Zoo` in one line...

    require 'modspace'

    # Define parent namespace
    Modspace.def_mod('Foo', 'Bar', 'Zoo')
    # Note: This creates the namespace Foo::Bar::Zoo

    # Implementation
    module Foo::Bar::Zoo::Shoe
        def some_funct
            puts "Eek"
        end
    end

__Note: You only need to define the parent namespace. For example, we
omit "Shoe" from the initial namespace definition above.__

For more examples, see the `examples/` directory.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/theirishpenguin/modspace.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
