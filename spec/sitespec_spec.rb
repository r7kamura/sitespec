require "spec_helper"

describe Sitespec do
  it "generates static files from rack application" do
    get "/index.html"
    response.status.should == 200
  end
end
