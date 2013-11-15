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
      Sitespec.configuration.application.call(@request.env)
    end
  end
end
