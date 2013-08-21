require 'spec_helper'

describe RESTful::Matchers::HaveLink do

  before(:each) { @content = open("spec/fixtures/json/resource_with_links.json").read }

  it "should match a valid link" do
    @content.should have_link("self", "http://example.com")
  end

  it "should not match a non-existing link" do
    @content.should_not have_link("foo", "http://bar.com")
  end

  it "should match only by rel attribute" do
    @content.should have_link("self")
  end

  it "should show matched content on fail" do
    content = '{"foo": "bar", "baz": "qux"}'
    expect { content.should have_link "self" }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /.*in '#{content}'.*/)
  end
end

