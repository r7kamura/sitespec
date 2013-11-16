# Sitespec
Generate static site from your rack application & spec definition.

## Features
* Provides the same way to create both dynamic & static website
* Generates static website from your existing dynamic website
* Sitespec can be executable specification, good documentation, and well-tested implementation

## Installation
```sh
# shell-command
gem install sitespec
```

## Usage
```ruby
# spec/your_spec.rb
require "sitespec"

Sitespec.configure do
  self.application = MyRackApplication.new
  self.build_path = "build"
  self.raise_http_error = true
end

describe "Sitespec" do
  include Sitespec

  it "generates static site from your rack application & spec definition" do
    get "/2000/01/01/hello.html"
    get "/2000/01/02/world.html"
    get "/feed.xml"
    get "/images/favicon.ico"
    get "/index.html"
    get "/stylesheets/all.css"
  end
end
```

```sh
# shell-command
$ rspec
Build started...

✔ 2000/01/01/hello.html
✔ 2000/01/02/world.html
✔ feed.xml
✔ images/favicon.ico
✔ index.html
✔ stylesheets/all.css

Build finished with 6 files in 0.00151 seconds.
```
