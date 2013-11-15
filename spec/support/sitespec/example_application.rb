require "sinatra"
require "slim"

Slim::Engine.set_default_options pretty: true

module Sitespec
  class ExampleApplication < Sinatra::Base
    get "/index.html" do
      slim :index
    end

    get "/:year-:month-:day-:title.html" do
      slim :show
    end
  end
end
