# This file does not provide any class or module named Sitespec::RSpec,
# but configures suitable settings to run Sitespec with RSpec.

require "rack/test"
require "rspec"
require "sitespec"

RSpec.configure do |config|
  config.include Rack::Test::Methods, sitespec: true

  config.after do |example|
    Sitespec::Artifact.create(example: example, example_group: self)
  end

  config.after(:suite) do
    if Sitespec.artifacts_count > 0
      puts "\nSitespec generated #{Sitespec.artifacts_count} files into #{Sitespec.configuration.build_path} directory."
    end
  end
end
