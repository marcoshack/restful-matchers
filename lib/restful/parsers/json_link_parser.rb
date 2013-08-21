module RESTful
  module Parsers
    module JSONLinkParser

      def self.parse(content)
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
