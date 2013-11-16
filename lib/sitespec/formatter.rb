require "rspec/core/formatters/documentation_formatter"

module Sitespec
  class Formatter < RSpec::Core::Formatters::BaseTextFormatter
    def start(*)
      super
      output.puts "Build started...\n\n"
    end

    def dump_summary(duration, example_count, failure_count, pending_count)
      @duration = duration
      @example_count = example_count
      @failure_count = failure_count
      @pending_count = pending_count
      output.puts "\nBuild finished with #{Sitespec.build_count} files in #{format_duration(duration)}.\n"
      dump_commands_to_rerun_failed_examples
    end
  end
end
