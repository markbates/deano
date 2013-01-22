require_relative 'deano'
require 'sinatra/base'

# Disable useless rack logger completely! Yay, yay!
module Rack
  class CommonLogger
    def call(env)
      # do nothing
      @app.call(env)
    end
  end
end

module Deano
  class Base < Sinatra::Base

    class << self

      def inherited(klass)
        super
        klass.set :root, Deano.root
        klass.set :views, [File.join(Deano.root, "apps", "views"), File.join(Deano.root, "apps", "views", "shared"), File.join(Deano.root, "apps", "views", klass.name.underscore.gsub(/(_app$)/, ''))]
        klass.set :logging, false
      end

    end

    def find_template(views, name, engine, &block)
      Array(views).each { |v| super(v, name, engine, &block) }
    end

    before do
      @start_time = Time.now
    end

    after do
      @end_time = Time.now
      puts "---\n[#{request.request_method}] #{request.url}\n  Content-Type: #{response.headers["Content-Type"]}\n  params: #{params.inspect}\n  Response time: #{@end_time - @start_time}\n\n"
    end

  end
end