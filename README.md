# restful-matchers [![Build Status](https://travis-ci.org/marcoshack/restful-matchers.png?branch=master)](https://travis-ci.org/marcoshack/restful-matchers) [![Code Climate](https://codeclimate.com/github/marcoshack/restful-matchers.png)](https://codeclimate.com/github/marcoshack/restful-matchers) [![Gem Version](https://badge.fury.io/rb/restful-matchers.png)](http://badge.fury.io/rb/restful-matchers)

RSpec matchers to test RESTful HATEOAS-compliant resource links. Currently it supports only JSON representations as an array of link objects with `rel` and `href` attributes, like this:

```json
{
  "attribute1": "value1",
  "attribute2": "value2",
  "links": [
    { "rel": "self", "href": "http://example.com" }
  ]
}
```

Example:

```ruby
describe MyRestfulController do
  render_views

  it "should have entry-point links" do
    get :index
    response.body.should have_link "resource1", "http://example.com/resource1"
    response.body.should have_link "resource2", "http://example.com/resource1"
  end

  it "should have self link, no matter its href" do
    parsed_json = JSON.parse(response.body) # you can match both raw or parsed (hash) JSON
    parsed_json.should have_link "resource2"
  end
end
```

## Installation

Add it to the `test` group in your Gemfile and be happy!

```ruby
group :test do
  gem 'restful-matchers'
end
```
