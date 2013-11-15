# Sitespec
Generate static site from your rack application & spec definition.

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
end

describe "Static site generation" do
  include Sitespec

  it "generates static files from rack application" do
    get "/stylesheets/all.css"
    get "/images/favicon.ico"
    get "/index.html"
    get "/2000/01/01/hello.html"
    get "/2000/01/02/world.html"
    get "/feed.xml"
  end
end
```

```sh
# shell-command
$ rspec
Static site generation
  generates static files from rack application

Finished in 0.00151 seconds
1 example, 0 failures

# the following files are generated
$ tree
.
`-- build
    |-- stylesheets/all.css
    |-- images/favicon.ico
    |-- index.html
    |-- 2000/01/01/hello.html
    |-- 2000/01/02/world.html
    `-- feed.xml
```
