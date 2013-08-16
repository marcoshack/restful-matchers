require 'json'

module RESTful
  module Matchers
    # Ensures that JSON response body has the given link.
    #
    # Example:
    #   response.body.should have_json_link("self", "http://example.com")
    #
    def have_restful_json_link(rel, href)
      HaveRestfulJsonLink.new(rel, href)
    end

    class HaveRestfulJsonLink
      def initialize(rel, href)
        @rel  = rel
        @href = href
      end

      def matches?(json_string)
        if links = parse_links(json_string)
          return links[@rel] == @href
        else
          raise StandardError.new("JSON has no RESTful links")
        end
      end

      def failure_message_for_should
        "Expected RESTful link: #{link_representation}"
      end

      def failure_message_for_should_not
        "Expected no RESTful link: #{link_representation}"
      end

      def description
        "have RESTful link: #{link_representation}"
      end

      private
      def link_representation
        "{ rel: #{@rel}, href: #{@href} }"
      end

      def parse_links(json_string)
        json = JSON.parse(json_string)
        links = nil
        if json["links"]
          links = {}
          json["links"].each { |link| links[link["rel"]] = link["href"] }
        end
        return links
      end
    end
  end
end
