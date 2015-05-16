require "sitespec/artifact"
require "sitespec/configuration"
require "sitespec/version"

module Sitespec
  class << self
    # Return how many artifacts (files) generated on this process.
    # This count is to be shown after all examples are finished.
    # @return [Integer]
    def artifacts_count
      @artifacts_count || 0
    end

    # Provide singleton configuration object shared with the current process.
    # All of user-configuration should be stored in this singleton object.
    # @example
    #   Sitespec.configuration.build_path = "artifacts"
    def configuration
      @configuration ||= Sitespec::Configuration.new
    end

    # Provide friendly interface to access to Sitespec.configuration.
    # The configuration object passed to given block is same with
    # `Sitespec.configuration`.
    # @example
    #   Sitespec.configure do |configuration|
    #     configuration.build_path = "artifacts"
    #   end
    def configure(&block)
      block.call(configuration)
    end

    # Use this method when a new artifact is generated.
    # In almost cases, it's called from Sitespec::Artifact class.
    def increment_artifacts_count
      @artifacts_count = artifacts_count + 1
    end
  end
end
