require "pathname"

module Sitespec
  class Configuration
    DEFAULT_BUILD_PATH = "build"

    attr_writer :build_path

    def initialize
      @enabled = true
    end

    def build_path
      @build_path || DEFAULT_BUILD_PATH
    end

    # @return [Pathname]
    def build_pathname
      Pathname.new(build_path)
    end

    def disable
      @enabled = false
    end

    def enable
      @enabled = true
    end

    def enabled
      !!@enabled
    end
    alias_method :enabled?, :enabled
  end
end
