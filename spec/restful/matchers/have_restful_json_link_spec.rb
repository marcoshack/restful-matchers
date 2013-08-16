require 'spec_helper'

describe RESTful::Matchers::HaveRestfulJsonLink do
  before :each do
    @json_response = open("spec/fixtures/json/resource.json").read
  end

  it "should find a json link" do
    @json_response.should have_restful_json_link("self", "http://example.com")
  end

  it "should not find an unexistant link" do
    @json_response.should_not have_restful_json_link("foo", "http://bar.com")
  end
end
