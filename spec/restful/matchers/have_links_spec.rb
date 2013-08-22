require 'spec_helper'

describe RESTful::Matchers::HaveLinks do
  let(:content) { open("spec/fixtures/json/resource_with_links.json").read }

  it "should match an array of links" do
    content.should have_links([
      { rel: "self", href: "http://example.com"     },
      { rel: "foo" , href: "http://example.com/foo" },
      { rel: "bar" , href: "http://example.com/bar" }
    ])
  end
end
