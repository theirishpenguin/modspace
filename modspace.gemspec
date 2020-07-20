require_relative 'lib/modspace/version'

Gem::Specification.new do |spec|
  spec.name          = "modspace"
  spec.version       = Modspace::VERSION
  spec.authors       = ["declan@weuseopensource.com"]
  spec.email         = ["declan@weuseopensource.com"]

  spec.summary       = %q{Modspace is a small library to allow the easy definition and management of namespaces and nested modules in Ruby.}
  spec.description   = %q{Modspace is a small library to allow the easy definition and management of namespaces and nested modules in Ruby.}
  spec.homepage      = "https://github.com/theirishpenguin/modspace"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/theirishpenguin/modspace"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

end
