require "sinatra"
require "slim"

Slim::Engine.set_default_options pretty: true

module Sitespec
  class ExampleApplication < Sinatra::Base
    get "/index.html" do
      slim :index
    end
  end
end
