# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = "restful-matchers"
  gem.version = "0.2.1"

  gem.authors     = [ "Marcos Hack" ]
  gem.email       = [ "marcoshack@gmail.com" ]
  gem.summary     = "RSpec matchers to test RESTful HATEOAS-compliant resource links."
  gem.description = "RSpec matchers to test RESTful HATEOAS-compliant resource links. Currently it supports only JSON representations as an array of link objects with rel and href attributes."
  gem.homepage    = "https://github.com/marcoshack/rspec-restful-matchers"
  gem.license     = "MIT"

  gem.add_dependency "rspec", "~> 2.0"

  gem.add_development_dependency "bundler", "~> 1.0"
  gem.add_development_dependency "pry", "~> 0.9"
  gem.add_development_dependency "pry-nav", "~> 0.2"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(/^(test)/)
  gem.require_paths = ["lib"]
end
