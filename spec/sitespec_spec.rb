require "spec_helper"

describe Sitespec do
  it "generates static files from rack application" do
    get "/stylesheets/all.css"
    get "/index.html"
    get "/2000-01-01-hello.html"
  end
end
