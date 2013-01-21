require_relative 'deano'
require 'sinatra/base'

module Deano
  class Base < Sinatra::Base

    class << self

      def inherited(klass)
        super
        klass.set :root, Deano.root
        klass.set :views, [File.join(Deano.root, "apps", "views"), File.join(Deano.root, "apps", "views", "shared"), File.join(Deano.root, "apps", "views", klass.name.underscore.gsub(/(_app$)/, ''))]
      end

    end

    def find_template(views, name, engine, &block)
      Array(views).each { |v| super(v, name, engine, &block) }
    end

    before do
      puts "[#{request.request_method}] #{request.url}"
    end

  end
end