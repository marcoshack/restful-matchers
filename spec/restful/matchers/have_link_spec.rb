require 'spec_helper'

describe RESTful::Matchers::HaveLink do

  shared_examples_for "Matcher" do
    it "should find a json link" do
      @content.should have_restful_json_link("self", "http://example.com")
      @content.should have_link("self", "http://example.com")
    end

    it "should not find an unexistant link" do
      @content.should_not have_restful_json_link("foo", "http://bar.com")
      @content.should_not have_link("foo", "http://bar.com")
    end

    it "should find a link matching only the rel attribute" do
      @content.should have_link("self")
    end
  end

  context "when processing a JSON content" do
    before(:each) { @content = open("spec/fixtures/json/resource.json").read }
    it_behaves_like "Matcher"
  end

  context "when processing a parsed JSON" do
    before(:each) { @content = JSON.parse(open("spec/fixtures/json/resource.json").read) }
    it_behaves_like "Matcher"
  end

  it "should show matched content on fail" do
    content = '{"foo": "bar", "baz": "qux"}'
    expect { content.should have_link "self" }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /.*in '#{content}'.*/)
  end
end

