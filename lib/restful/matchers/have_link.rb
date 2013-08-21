require 'json'
require 'restful/parsers/json_link_parser'

module RESTful
  module Matchers
    # Ensures that JSON response body has the given link.
    #
    # Example:
    #
    #     response.body.should have_json_link("self", "http://example.com")
    #
    def have_link(rel, href = nil)
      HaveLink.new(rel, href)
    end
    alias_method :have_restful_json_link, :have_link

    class HaveLink
      def initialize(rel, href = nil)
        @rel  = rel
        @href = href
      end

      def matches?(content)
        @content = content
        if links = RESTful::Parsers::JSONLinkParser.parse(content)
          return @href ? links[@rel] == @href : links.has_key?(@rel)
        else
          return false
        end
      end

      def failure_message_for_should
        error_message "Expected RESTful link"
      end

      def failure_message_for_should_not
        error_message "Expected no RESTful link"
      end

      private
      def error_message(message)
        "#{message} '{\"rel\": \"#{@rel}\", \"href\": \"#{@href || "<any>" }\"}' in '#{@content}'" 
      end
    end
  end
end
