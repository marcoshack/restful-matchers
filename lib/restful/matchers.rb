require "restful/matchers/have_restful_json_link"

module RESTful
  module Matchers
    def have_restful_json_link(rel, href)
      RESTful::Matchers::HaveRestfulJsonLink.new(rel, href)
    end
  end
end

RSpec.configure do |c|
  c.include RESTful::Matchers
end
