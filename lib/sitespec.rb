require "sitespec/artifact"
require "sitespec/configuration"
require "sitespec/version"

module Sitespec
  class << self
    attr_writer :artifacts_count

    def artifacts_count
      @artifacts_count || 0
    end

    # Provide singleton configuration object shared with the current process.
    # @example
    #   Sitespec.configuration.build_path = "artifacts"
    def configuration
      @configuration ||= Sitespec::Configuration.new
    end

    # Provide friendly interface to access to Sitespec.configuration.
    # @example
    #   Sitespec.configure do |configuration|
    #     configuration.build_path = "artifacts"
    #   end
    def configure(&block)
      block.call(configuration)
    end
  end
end
