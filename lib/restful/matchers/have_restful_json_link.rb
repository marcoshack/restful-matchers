require 'json'

module RESTful
  module Matchers
    # Ensures that JSON response body has the given link.
    #
    # Example:
    #   response.body.should have_json_link("self", "http://example.com")
    #
    def have_restful_json_link(rel, href = nil)
      HaveRestfulJsonLink.new(rel, href)
    end
    alias_method :have_link, :have_restful_json_link

    class HaveRestfulJsonLink
      def initialize(rel, href = nil)
        @rel  = rel
        @href = href
      end

      def matches?(content)
        if links = parse_links_from(content)
          return @href ? links[@rel] == @href : links.has_key?(@rel)
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

      def parse_links_from(content)
        json =  content.is_a?(Hash) ? content : JSON.parse(content)
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
