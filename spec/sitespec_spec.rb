require "spec_helper"

describe Sitespec do
  before do
    Sitespec.configuration.application = ->(env) do
      [200, {}, ["OK"]]
    end
  end

  it "generates static files from rack application" do
    get "/"
    response.status.should == 200
  end
end
