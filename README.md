# restful-matchers [![Build Status](https://travis-ci.org/marcoshack/restful-matchers.png?branch=master)](https://travis-ci.org/marcoshack/restful-matchers) [![Code Climate](https://codeclimate.com/github/marcoshack/restful-matchers.png)](https://codeclimate.com/github/marcoshack/restful-matchers) [![Gem Version](https://badge.fury.io/rb/restful-matchers.png)](http://badge.fury.io/rb/restful-matchers)

RSpec matchers to test RESTful resource links. Currently it supports only JSON representations with an array of link objects with `rel` and `href` attributes, like this:

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
    response.body.should have_restful_json_link("self", "http://example.com")
    response.body.should have_restful_json_link("resource1", "http://example.com/resource1")
    response.body.should have_restful_json_link("resource2", "http://example.com/resource2")
  end
end
```
