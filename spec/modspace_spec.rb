RSpec.describe Modspace do
  it "has a version number" do
    expect(Modspace::VERSION).not_to be nil
  end

  describe "::def_mod" do

    class SomeClass; end # Used in some specs below
    module SomeModule; end # Used in some specs below

    it "define the nested module Foo::Bar:Zoo within the current execution context" do
      zoo_module = Modspace.def_mod('Foo', 'Bar', 'Zoo', in_class_of_instance: self)

      # Note: current_namespace is RSpec::ExampleGroups::Modspace::DefMod in these specs. That is the context that
      # passing "self" to def_mod() will result in
      expect(RSpec::ExampleGroups::Modspace::DefMod::Foo::Bar::Zoo).to be_a(Module)
      expect(RSpec::ExampleGroups::Modspace::DefMod::Foo::Bar::Zoo).to eql(zoo_module)
    end

    it "define the nested module Foo::Bar:Zoo within a class of specified object" do
      an_instance_of_some_class = SomeClass.new
      zoo_module = Modspace.def_mod('Foo', 'Bar', 'Zoo', in_class_of_instance: an_instance_of_some_class)

      expect(SomeClass::Foo::Bar::Zoo).to be_a(Module)
      expect(SomeClass::Foo::Bar::Zoo).to eql(zoo_module)
    end

    it "define the nested module Foo::Bar:Zoo within explicit class" do
      zoo_module = Modspace.def_mod('Foo', 'Bar', 'Zoo', in_namespace: SomeClass)

      expect(SomeClass::Foo::Bar::Zoo).to be_a(Module)
      expect(SomeClass::Foo::Bar::Zoo).to eql(zoo_module)
    end

    it "define the nested module Foo::Bar:Zoo within explicit module" do
      zoo_module = Modspace.def_mod('Foo', 'Bar', 'Zoo', in_namespace: SomeModule)

      expect(SomeModule::Foo::Bar::Zoo).to be_a(Module)
      expect(SomeModule::Foo::Bar::Zoo).to eql(zoo_module)
    end

    it "define the nested module Foo::Bar:Zoo - within Object as a default parent namespace" do
      zoo_module = Modspace.def_mod('Foo', 'Bar', 'Zoo')

      expect(Foo::Bar::Zoo).to be_a(Module)
      expect(Foo::Bar::Zoo).to eql(zoo_module)
    end

    it "define the nested module Foo::Bar:Zoo using shortcut syntax" do
      zoo_module = Modspace.def_mod('Foo::Bar::Zoo')

      expect(Foo::Bar::Zoo).to be_a(Module)
      expect(Foo::Bar::Zoo).to eql(zoo_module)
    end

    it "define the nested module Foo::Bar:Zoo using standard + shortcut syntax" do
      zoo_module = Modspace.def_mod('Foo::Bar', 'Zoo')

      expect(Foo::Bar::Zoo).to be_a(Module)
      expect(Foo::Bar::Zoo).to eql(zoo_module)
    end

  end
end
