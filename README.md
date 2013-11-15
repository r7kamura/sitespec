# Sitespec
Generate static site from your spec.

## Installation
```
gem install sitespec
```

## Usage
```ruby
# spec/spec_helper.rb
require "sitespec"
Sitespec.application = MyRackApplication.new
```

```ruby
# spec/your_spec.rb
require "spec_helper"

describe "Static site generation" do
  it "generates static files from rack application" do
    get "/stylesheets/all.css"
    get "/images/favicon.ico"
    get "/index.html"
    get "/2000/01/01/hello.md"
    get "/2000/01/02/world.md"
    get "/feed.xml"
  end
end
```
