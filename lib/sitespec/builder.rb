module Sitespec
  class Builder
    def self.build(*args)
      new(*args).build
    end

    def initialize(request)
      @request = request
    end

    def build
      Response.new(*call).tap {|response| Writer.write(@request, response) }
    end

    def call
      Sitespec.configuration.application.call(@request.env).tap do |status, header, body|
        if Sitespec.configuration.raise_http_error && status >= 400
          raise Error, "#{@request.uri} returned #{status}"
        end
      end
    end
  end
end
