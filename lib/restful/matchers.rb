require "restful/matchers/errors"
require "restful/matchers/parsers"
require "restful/matchers/have_link"
require "restful/matchers/have_links"

if defined?(RSpec)
  require 'restful/matchers/integrations/rspec'
end
