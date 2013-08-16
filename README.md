# restful-matchers [![Build Status](https://travis-ci.org/marcoshack/restful-matchers.png?branch=master)](https://travis-ci.org/marcoshack/restful-matchers)

```ruby
describe MyRestfulController do
  it "should have entry-point links" do
    get :index
    response.body.should have_restful_json_link("self", "http://example.com")
    response.body.should have_restful_json_link("resource1", "http://example.com/resource1")
    response.body.should have_restful_json_link("resource2", "http://example.com/resource2")
  end
end
```
