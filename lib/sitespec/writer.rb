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
      path.open("w") {|file| file << @response.body }
    end
  end
end
