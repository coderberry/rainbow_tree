# frozen_string_literal: true

require_relative "lib/rainbow_tree/version"

Gem::Specification.new do |spec|
  spec.name = "rainbow_tree"
  spec.version = RainbowTree::VERSION
  spec.authors = ["Eric Berry"]
  spec.email = ["eric@berry.sh"]

  spec.summary = "Ascii Tree Generator with color"
  spec.description = spec.summary
  spec.homepage = "https://github.com/coderberry/rainbow_tree"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0"
  spec.add_dependency "rainbow", ">= 3.0"

  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "better_errors"
  spec.add_development_dependency "binding_of_caller"
  spec.add_development_dependency "debug"
  spec.add_development_dependency "language_server-protocol"
  spec.add_development_dependency "lint_roller"
  spec.add_development_dependency "magic_frozen_string_literal"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "puma"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rbs_rails"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "sprockets-rails"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "standard-custom"
  spec.add_development_dependency "standard-performance"
  spec.add_development_dependency "yard"
end
