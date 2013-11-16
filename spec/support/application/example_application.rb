require "padrino"
require "redcarpet"
require "sass"
require "slim"

module Sitespec
  class ExampleApplication < Padrino::Application
    register Padrino::Helpers
    register Padrino::Rendering

    set :scss, views: "#{root}/stylesheets"
    set :show_exceptions, false
    set :slim, pretty: true

    disable :logging

    get "/stylesheets/all.css" do
      scss :all
    end

    get "/index.html" do
      slim :index
    end

    get "/:year-:month-:day-:title.html" do
      slim :show, locals: { body: article }
    end

    helpers do
      def article
        markdown(article_path.to_sym, views: articles_path)
      end

      def articles_path
        "#{settings.root}/articles"
      end

      def article_path
        "#{params[:year]}-#{params[:month]}-#{params[:day]}-#{params[:title]}"
      end
    end

    error do |exception|
      raise exception
    end
  end
end
