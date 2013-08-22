# restful-matchers [![Build Status](https://travis-ci.org/marcoshack/restful-matchers.png?branch=master)](https://travis-ci.org/marcoshack/restful-matchers) [![Code Climate](https://codeclimate.com/github/marcoshack/restful-matchers.png)](https://codeclimate.com/github/marcoshack/restful-matchers) [![Gem Version](https://badge.fury.io/rb/restful-matchers.png)](http://badge.fury.io/rb/restful-matchers)

RSpec matchers to test RESTful HATEOAS-compliant resource links. Currently it supports only JSON representations as an array of link objects with `rel` and `href` attributes.


## Usage

Let's say we have a `MyRestfulController#index` controller action that returns the following JSON representation, with links represented as an array of `{rel: ... , href: ...}` objects:

```json
{
  "attribute1": "value1",
  "attribute2": "value2",
  "links": [
    { "rel": "foo", "href": "http://example.com/foo" }
    { "rel": "bar", "href": "http://example.com/bar" }
    { "rel": "baz", "href": "http://example.com/baz" }
    { "rel": "qux", "href": "http://example.com/qux" }
  ]
}
```

You can match those links using `have_link` or `have_links` matchers as follow:

```ruby
describe MyRestfulController do
  render_views # don't forget this!

  it "should have links" do
    get :index
    
    # you can match against both raw ...
    response.body.should have_link "foo", "http://example.com/foo"
    response.body.should have_link "bar", "http://example.com/bar"

    # ... or parsed JSON (as a Hash)
    parsed_json = JSON.parse(response.body)

    # href attribute is optional
    parsed_json.should have_link "baz"

    # match many links at once using have_links matcher
    response.body.should have_links([
      { rel: "foo", href: "http://example.com/foo" },
      { rel: "bar", href: "http://example.com/bar" },
      { rel: "baz", href: "http://example.com/baz" },
      { rel: "qux", href: "http://example.com/qux" },
    ])
  end
end
```

## Installation

Add it to the `test` group in your Gemfile and be happy!

```ruby
gem 'restful-matchers', '~> 0.2', :group => :test
```

## Changelog

See [CHANGELOG](https://github.com/marcoshack/restful-matchers/blob/master/CHANGELOG.md).

## License

restful-matchers is Copyright © 2013 Marcos Hack. It is free software, and may be redistributed under the terms specified in the LICENSE file.
