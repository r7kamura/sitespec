require "pathname"

module Sitespec
  class Configuration
    DEFAULT_BUILD_PATH = "build"

    attr_writer :auto_complete_html_path, :build_path

    def initialize
      @enabled = true
      @auto_complete_html_path = true
    end

    def auto_complete_html_path
      !!@auto_complete_html_path
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
