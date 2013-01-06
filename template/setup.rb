require 'bundler'
Bundler.setup

require 'active_support/core_ext'
require 'sinatra/base'
require 'sinatra/twitter-bootstrap'
require 'sprockets'
require 'mongoid'
require 'json'

env = ENV["RACK_ENV"] ? ENV["RACK_ENV"] : "development"

Mongoid.load!(File.join(File.dirname(__FILE__), "mongoid.yml"), env.to_sym)

%w{apps models}.each do |dir|
  Dir[File.expand_path(File.join(dir, "**", "*.rb"), File.dirname(__FILE__))].each do |file|
    require file
  end  
end