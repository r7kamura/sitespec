module Sitespec
  class Response
    attr_reader :status, :header

    def initialize(status, header, body)
      @body = body
      @header = header
      @status = status
    end

    def body
      lines = []
      @body.each {|line| lines << line }
      lines.join
    end
  end
end
