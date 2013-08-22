$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'restful/matchers/version'

Gem::Specification.new do |gem|
  gem.name        = "restful-matchers"
  gem.version     = RESTful::Matchers::VERSION.dup
  gem.date        = Time.now.strftime("%Y-%m-%d")
  gem.authors     = [ "Marcos Hack" ]
  gem.email       = [ "marcoshack@gmail.com" ]
  gem.summary     = "RSpec matchers to test RESTful HATEOAS-compliant resource links."
  gem.description = "RSpec matchers to test RESTful HATEOAS-compliant resource links. Currently it supports only JSON representations as an array of link objects with rel and href attributes."
  gem.homepage    = "https://github.com/marcoshack/restful-matchers"
  gem.license     = "MIT"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {spec}/*`.split("\n")
  gem.require_paths = ["lib"]

  gem.required_ruby_version = '>= 1.9.2'

  gem.add_dependency "rspec", "~> 2.0"
  gem.add_development_dependency "bundler", "~> 1.0"
end
