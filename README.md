# Sitespec
Generate static site from your rack application & test files.

* Provides the same way to create both dynamic & static website
* Generates static website from your existing dynamic website
* Sitespec can be executable specification, good documentation, and well-tested implementation

## Usage
### 1. Add sitespec into your Gemfile
```rb
# Gemfile
gem "sitespec"
```

### 2. Require sitespec/rspec in your specs
```rb
# spec/spec_helper.rb
require "sitespec/rspec"
```

### 3. Write request-specs with `:sitespec` metadata
Note: [rack/test](https://github.com/brynary/rack-test) is automatically enabled
in the example groups that have `:sitespec`.

```rb
# spec/site_spec.rb
describe "Sitespec" do
  let(:app) do
    MyRackApp
  end

  %w[
    /2000/01/01/hello.html
    /2000/01/02/world.html
    /feed.xml
    /images/favicon.ico
    /index.html
    /stylesheets/all.css
  ].each do |path|
    describe "GET #{path}", :sitespec do
      it "returns 200" do
        expect(get(path).status).to eq 200
      end
    end
  end
end
```

### 4. Run rspec to build static files
Note: only successful examples generate static files.

```
$ bundle exec rspec

Example application
  GET /2000-01-01-hello.html
    returns 200
  GET /index.html
    returns 200
  GET /stylesheets/all.css
    returns 200

Finished in 0.08302 seconds (files took 0.79161 seconds to load)
3 examples, 0 failures
```

## Configuration
- `Sitespec.configuration.auto_complete_html_path` - Autocomplete .html (default: true)
- `Sitespec.configuration.build_path` - Where to locate files (default: build)
- `Sitespec.configuration.enabled` - Enable sitespec (default: true)

## Advanced topics
Sitespec is excellent with GitHub Pages.
[r7kamura/r7kamura.github.io](https://github.com/r7kamura/r7kamura.github.io)
is a working example that uses Sitespec to build static files from Rack application.
It uses TravisCI to build and push files to GitHub repo's master branch.
See [.travis.yml](https://github.com/r7kamura/r7kamura.github.io/blob/source/.travis.yml)
for more information about how to to it.
