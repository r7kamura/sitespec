require "spec_helper"

describe "Example application" do
  let(:app) do
    Sitespec::ExampleApplication
  end

  %w[
    /
    /2000-01-01-hello
    /stylesheets/all.css
  ].each do |path|
    describe "GET #{path}", :sitespec do
      it "returns 200" do
        expect(get(path).status).to eq 200
      end
    end
  end
end
