require 'rspec/core'
require 'restful/matchers'

RSpec.configure do |config|
  config.include RESTful::Matchers
end
