module Sitespec
  class Configuration
    attr_accessor :application, :build_path, :raise_http_error

    def initialize
      @build_path = "build"
      @raise_http_error = true
    end
  end
end
