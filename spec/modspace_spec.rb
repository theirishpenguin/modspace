RSpec.describe Modspace do
  it "has a version number" do
    expect(Modspace::VERSION).not_to be nil
  end

  describe "::def_mod" do
    it "define the nested module Foo::Bar:Zoo" do
      zoo_module = Modspace.def_mod(self, 'Foo', 'Bar', 'Zoo')

      # Note: current_namespace is RSpec::ExampleGroups::Modspace::DefMod in these specs
      expect(RSpec::ExampleGroups::Modspace::DefMod::Foo::Bar::Zoo).to be_a(Module)
      expect(RSpec::ExampleGroups::Modspace::DefMod::Foo::Bar::Zoo).to eql(zoo_module)
    end
  end
end
