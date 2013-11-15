require "pathname"

module Sitespec
  class Configuration
    attr_accessor :application, :build_path

    def initialize
      @build_path = Pathname.new("build")
    end
  end
end
