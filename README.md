# Sitespec
Generate static site from your rack application & spec definition.

* Provides the same way to create both dynamic & static website
* Generates static website from your existing dynamic website
* Sitespec can be executable specification, good documentation, and well-tested implementation

## Usage
1. Add sitespec into your Gemfile
2. Create spec file with settings and tests (e.g. `spec/site_spec.rb`)
3. Run test to build static files

## Example
`bundle exec rspec` generates static files into `build` directory.

```rb
# Gemfile
gem "sitespec"
```

```rb
# spec/spec_helper.rb
require "sitespec/rspec"
```

```rb
# spec/site_spec.rb
describe "Sitespec" do
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

## Advanced topics
Sitespec is excellent with GitHub Pages.
[r7kamura/r7kamura.github.io](https://github.com/r7kamura/r7kamura.github.io)
is a working example that uses sitespec to build static files from Rack application.
It uses TravisCI to build and push files to GitHub repo's master branch.
See [.travis.yml](https://github.com/r7kamura/r7kamura.github.io/blob/source/.travis.yml)
for more information about how to to it.
