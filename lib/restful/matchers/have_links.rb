require 'json'
require 'restful/matchers/parsers'

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
      HaveLinks.new(links)
    end
    alias_method :have_restful_links, :have_links

    class HaveLinks
      def initialize(links)
        @match_links = {}

        if links.is_a?(Array)
          links.each do |link|
            rel  = link[:rel]  || link["rel"]
            href = link[:href] || link["href"]
            if rel
              @match_links[rel.to_s] = href
            else
              raise ::Errors::InvalidLink("Link has no `rel`: #{link}")
            end
          end
        else
          raise ArgumentError.new("matcher expects an array of hashes containing `rel` and `href` keys as argument")
        end
      end

      def matches?(content)
        @content = content
        @content_links = RESTful::Matchers::Parsers::JSONLinkParser.parse(content)
        if @content_links
          @content_links.each do |rel, href|
            match = href ? @match_links[rel] == href : @match_links.has_key?(rel)
            return false unless match
          end
          return true
        else
          return false
        end
      end

      def failure_message_for_should
        "Expected links weren't found. #{content_and_match_links_message}"
      end

      def failure_message_for_should_not
        "Not expected links where found. #{content_and_match_links_message}"
      end

      private
      def content_and_match_links_message
        "Expect '#{@match_links}', but got '#{@content_links}'."
      end
    end
  end
end
