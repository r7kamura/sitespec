require "pathname"
require "sitespec"

module Sitespec
  # "Artifact" is corresponding to each response body to an endpoint.
  # This class has ActiveRecord-like interface like Sitespec::Artifact.create.
  #
  # @example
  #   Sitespec::Artifact.create(example: example, example_group: example_group)
  #
  class Artifact
    class << self
      # Short-hand method to call `.new` and `#save`
      # @return [Sitespec::Artifact]
      def create(**args)
        new(**args).tap(&:save)
      end
    end

    # @param [RSpec::Core::Example] example In almost cases, `RSpec.current_example` is passed
    # @param [RSpec::Core::ExampleGroup] example_group In almost cases, `self` is passed
    def initialize(example: nil, example_group: nil)
      @example = example
      @example_group = example_group
    end

    # Validate its attributes and generate a new file
    # @return [false, true] True for successful case, otherwise false
    def save
      if valid?
        write
        increment
        true
      else
        false
      end
    end

    private

    # Utility method to access to `@example`
    def example
      @example
    end

    # Utility method to access to `@example_group`
    def example_group
      @example_group
    end

    def generate_file
      pathname.write(response.body)
    end

    def increment
      Sitespec.increment_artifacts_count
    end

    def make_parent_directory
      pathname.parent.mkpath
    end

    # @return [String] Where to an artifact file is located
    def path
      File.join(Sitespec.configuration.build_pathname, request.path) + path_suffix
    end

    # @return [String]
    def path_suffix
      case
      when !Sitespec.configuration.auto_complete_html_path
        ""
      when response.content_type.nil? || !response.content_type.include?("text/html") || request.path.end_with?(".html")
        ""
      when request.path == "/"
        "index.html"
      else
        ".html"
      end
    end

    # @return [Pathname]
    def pathname
      Pathname.new(path)
    end

    # @note We expect `request` is provided via rack-test
    def request
      example_group.last_request
    end

    # @note We expect `response` is provided via rack-test
    def response
      example_group.last_response
    end

    # @return [false, true] Validation result
    def valid?
      example.exception.nil? && Sitespec.configuration.enabled?
    end

    # Generate directory and file
    def write
      make_parent_directory
      generate_file
    end
  end
end
