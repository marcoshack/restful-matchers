require 'spec_helper'

describe RESTful::Matchers::HaveLinks do

  context "when processing a valid JSON with links" do
    let(:content) { open("spec/fixtures/json/resource_with_links.json").read }

    it "should match an array of links using symbols as keys" do
      expected_links = [
        { rel: "self", href: "http://example.com"     },
        { rel: "foo" , href: "http://example.com/foo" },
        { rel: "bar" , href: "http://example.com/bar" }
      ]
      content.should have_links(expected_links)
      content.should have_restful_links(expected_links)
    end

    it "should match an array of links using string as keys" do
      content.should have_links([
        { "rel" => "self", "href" => "http://example.com"     },
        { "rel" => "foo" , "href" => "http://example.com/foo" },
        { "rel" => "bar" , "href" => "http://example.com/bar" }
      ])
    end

    it "should not match an empty array" do
      content.should_not have_links []
    end

    it "should fail to match an empty array" do
      expect { content.should have_links [] }.to raise_error(/.*Expect '{}'.*/)
    end

    it "should fail to match an invalid argument" do
      [ 1, "", {}, :a_symbol, nil ].each do |value|
        expect { content.should have_links value }.to raise_error(ArgumentError)
      end
    end
  end
end
