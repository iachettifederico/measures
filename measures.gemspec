# frozen_string_literal: true

require_relative "lib/measures/version"

Gem::Specification.new do |spec|
  spec.name = "measures"
  spec.version = Measures::Version
  spec.authors = ["Federico Iachetti"]
  spec.email = ["iachetti.federico@gmail.com"]

  spec.summary = "Measure system for Ruby"
  spec.description = "Add measures to your Ruby application and operate avoiding primitive obsession"
  spec.homepage = "https://github.com/iachettifederico/measures"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/iachettifederico/measures"
  spec.metadata["changelog_uri"] = "https://github.com/iachettifederico/measures"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem

  spec.add_dependency "zeitwerk", "~> 2.5.4"
  spec.add_dependency "rake", "~> 13.0.6"
  spec.add_dependency "rspec", "~> 3.11.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
