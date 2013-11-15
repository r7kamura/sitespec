$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "sitespec"

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.include Sitespec
end

Sitespec.configuration.application = Sitespec::ExampleApplication
