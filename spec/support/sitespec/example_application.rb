require "padrino"
require "sass"
require "slim"

module Sitespec
  class ExampleApplication < Padrino::Application
    register Padrino::Helpers
    register Padrino::Rendering

    set :scss, views: "#{root}/stylesheets"
    set :show_exceptions, false
    set :slim, pretty: true

    error do |exception|
      raise exception
    end

    get "/stylesheets/all.css" do
      scss :all
    end

    get "/index.html" do
      slim :index
    end

    get "/:year-:month-:day-:title.html" do
      slim :show
    end
  end
end
