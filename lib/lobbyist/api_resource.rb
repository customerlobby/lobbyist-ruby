module Lobbyist
  class ApiResource
    def self.class_name
      self.name.split('::')[-1]
    end

    def self.url
      "/v1/#{CGI.escape(class_name.downcase)}s"
    end

    def url(id)
      "#{self.class.url}/#{CGI.escape(id.to_s)}"
    end

  end

end