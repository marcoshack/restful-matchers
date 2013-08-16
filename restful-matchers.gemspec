# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = "restful-matchers"
  gem.version = "0.1"

  gem.authors     = [ "Marcos Hack" ]
  gem.email       = [ "marcoshack@gmail.com" ]
  gem.summary     = "Easily handle RESTful resources in your tests"
  gem.description = "RSpec matchers for testing RESTful resource link representations"
  gem.homepage    = "https://github.com/marcoshack/rspec-restful-matchers"
  gem.license     = "MIT"

  gem.add_dependency "rspec", "~> 2.0"

  gem.add_development_dependency "bundler", "~> 1.0"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(/^(test)/)
  gem.require_paths = ["lib"]
end
