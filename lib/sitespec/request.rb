require "stringio"
require "uri"

module Sitespec
  class Request
    def initialize(method, path, params = {}, custom_env = {})
      @custom_env = custom_env
      @method = method
      @params = params
      @path = path
    end

    def env
      @env ||= {
        "HTTPS" => https? ? "on" : "off",
        "HTTP_HOST" => uri.host,
        "PATH_INFO" => uri.path,
        "QUERY_STRING" => uri.query || "",
        "REQUEST_METHOD" => @method.to_s.upcase,
        "REQUEST_URI" => uri.to_s,
        "SERVER_NAME" => uri.hostname,
        "SERVER_PORT" => uri.port,
        "rack.errors" => StringIO.new,
        "rack.input" => StringIO.new,
        "rack.multithread" => false,
        "rack.run_once" => false,
        "rack.url_scheme" => https? ? "http" : "https",
        "rack.version" => [1, 1],
      }.merge(@custom_env)
    end

    def uri
      @uri ||= URI.parse(@path)
    end

    def https?
      URI::HTTP === uri && uri.https?
    end
  end
end
