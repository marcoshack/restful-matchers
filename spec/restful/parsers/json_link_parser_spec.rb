require 'spec_helper'
require 'restful/parsers/json_link_parser'

describe RESTful::Parsers::JSONLinkParser do
  shared_examples_for "parser" do
    it "should parser links" do
      links = RESTful::Parsers::JSONLinkParser.parse(content)
      links.keys.should include "self", "foo", "bar"
      links["self"].should == "http://example.com"
      links["foo" ].should == "http://example.com/foo"
      links["bar" ].should == "http://example.com/bar"
    end
  end

  context "when parsing raw JSON" do
    let(:content) { open("spec/fixtures/json/resource_with_links.json").read }
    it_behaves_like "parser"
  end

  context "when parsing parsed JSON" do
    let(:content) { JSON.parse(open("spec/fixtures/json/resource_with_links.json").read) }
    it_behaves_like "parser"
  end
end
