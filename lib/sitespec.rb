require "sitespec/builder"
require "sitespec/configuration"
require "sitespec/request"
require "sitespec/response"
require "sitespec/version"

module Sitespec
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure(&block)
    configuration.instance_eval(&block)
  end

  module_function

  attr_reader :request, :response

  def get(path, params = {}, env = {})
    process(:get, path, params, env)
  end

  def post(path, params = {}, env = {})
    process(:post, path, params, env)
  end

  def put(path, params = {}, env = {})
    process(:put, path, params, env)
  end

  def delete(path, params = {}, env = {})
    process(:delete, path, params, env)
  end

  def process(*args)
    @request = Request.new(*args)
    @response = Builder.build(@request)
  end
end
