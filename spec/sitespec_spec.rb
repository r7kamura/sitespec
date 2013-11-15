require "spec_helper"

describe Sitespec do
  it "generates static files from rack application" do
    get "/index.html"
    get "/2001-01-01-title.html"
  end
end
