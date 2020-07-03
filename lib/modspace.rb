require "modspace/version"

module Modspace
    class Error < StandardError; end

    class << self
        # With thanks to https://stackoverflow.com/questions/37154774/ruby-define-modules-dynamically/37156102 :-)

        # Note: We use the term "namespace" to mean "class" or "module". The term abstracts away the differences
        # for our purposes.

        def def_mod(*args, in_namespace: Object, in_class_of_instance: nil)
            parent_namespace = if !in_class_of_instance.nil?
                in_class_of_instance.class
            elsif !in_namespace.nil? # :in_namespace can be a module or class
                in_namespace
            else
                raise ArgumentError, "If in_class or for_instance non-nil is specified they must be non-nil."
            end

            defp_class_mod(parent_namespace, *args)
        end

        private

        def defp_class_mod(parent_namespace, *args)
            nesting_list = *args

            return parent_namespace if nesting_list.empty?

            desired_nested_module_name = nesting_list.shift # mutates nested list (but it's local-only)

            # The desired nested module name may have already been defined elsewhere in the overall Ruby codebase.
            # If this is the case, we just reuse that constant definition.
            #
            # Note: if we don't do this then we will get the warning: "already initialized constant Foo"
            #
            # Note 2: parent_namespace.const_defined?(desired_nested_module_name) does not work as a check
            # below (we tried!). Ditto for const_get().
            #
            desired_nested_module_as_string = "#{parent_namespace}::#{desired_nested_module_name}"
            desired_nested_module = if const_defined?(desired_nested_module_as_string)
                const_get(desired_nested_module_as_string)
            else
                parent_namespace.const_set(desired_nested_module_name, Module.new)
            end

            defp_class_mod(desired_nested_module, *nesting_list)
        end
    end
end
