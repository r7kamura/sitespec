lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sitespec/version"

Gem::Specification.new do |spec|
  spec.name          = "sitespec"
  spec.version       = Sitespec::VERSION
  spec.authors       = ["Ryo Nakamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "Generate static site from your rack application & spec definition"
  spec.homepage      = "https://github.com/r7kamura/sitespec"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.4"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.14.1"
  spec.add_development_dependency "sinatra"
  spec.add_development_dependency "slim"
end
