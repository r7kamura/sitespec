module Sitespec
  class Writer
    def self.write(*args)
      new(*args).write
    end

    def initialize(request, response)
      @request = request
      @response = response
    end

    def write
      mkpath
      create
    end

    def path
      @path ||= Pathname.new("#{Sitespec.configuration.build_path}#{@request.uri.path}")
    end

    def mkpath
      path.parent.mkpath
    end

    def create
      path.open("w") {|file| file << @response.body }.tap do
        puts "#{color(?✔)} #{path}"
        Sitespec.build_count += 1
      end
    end

    def color(text)
      RSpec.configuration.color_enabled? ? "\e[32m#{text}\e[0m" : text
    end

    def puts(text)
      RSpec.configuration.formatters[0].output.puts text
    end
  end
end
