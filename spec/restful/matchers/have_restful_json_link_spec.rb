require 'spec_helper'

describe RESTful::Matchers::HaveRestfulJsonLink do

  shared_examples_for "RESTful Matcher" do
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
    it_behaves_like "RESTful Matcher"
  end

  context "when processing a parsed JSON" do
    before(:each) { @content = JSON.parse(open("spec/fixtures/json/resource.json").read) }
    it_behaves_like "RESTful Matcher"
  end
end
