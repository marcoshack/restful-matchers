require 'json'
require 'restful/parsers/json_link_parser'

module RESTful
  module Matchers
    # Ensures that JSON response body has the given links, represented as an
    # array of hashes with `rel` and `href` keys.
    #
    # Example:
    #
    #     response.body.should have_links([
    #       { rel: "self", href: "http://example.com"     },
    #       { rel: "foo" , href: "http://example.com/foo" },
    #       { rel: "bar" , href: "http://example.com/bar" }
    #     ])
    #
    def have_links(links)
      HaveLinks.new(rel, href)
    end

    class HaveLinks
      def initialize(links)
        @links = links
      end

      def matches?(content)
        @content = content
        if links = RESTful::Parsers::JSONLinkParser.parse(content)
          # TODO
          # return @href ? links[@rel] == @href : links.has_key?(@rel)
        else
          return false
        end
      end

      def failure_message_for_should
        error_message "Expected RESTful links"
      end

      def failure_message_for_should_not
        error_message "Expected no RESTful links"
      end

      private
      def error_message(message)
        # TODO
        # "#{message} '{\"rel\": \"#{@rel}\", \"href\": \"#{@href || "<any>" }\"}' in '#{@content}'" 
      end
    end
  end
end
