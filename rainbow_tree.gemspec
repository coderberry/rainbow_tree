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

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0"
end
