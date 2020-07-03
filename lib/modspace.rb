require "modspace/version"

module Modspace
    class Error < StandardError; end

    class << self
        # With thanks to https://stackoverflow.com/questions/37154774/ruby-define-modules-dynamically/37156102 :-)

        def def_mod(self_of_caller, *args)
            class_of_caller = self_of_caller.class
            def_class_mod(class_of_caller, *args)
        end

        def def_class_mod(class_of_caller, *args)
            nesting_list = *args

            return class_of_caller if nesting_list.empty?

            desired_nested_module_name = nesting_list.shift # mutates nested list (but it's local-only)

            # The desired nested module name may have already been defined elsewhere in the overall Ruby codebase.
            # If this is the case, we just reuse that constant definition.
            #
            # Note: if we don't do this then we will get the warning: "already initialized constant Foo"
            #
            desired_nested_module = if class_of_caller.const_defined?(desired_nested_module_name)
                class_of_caller.const_get(desired_nested_module_name, Module.new)
            else
                class_of_caller.const_set(desired_nested_module_name, Module.new)
            end

            def_class_mod(desired_nested_module, *nesting_list)
        end
    end
end
