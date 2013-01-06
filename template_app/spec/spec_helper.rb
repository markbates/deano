require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require File.expand_path(File.join("..", "setup.rb"), File.dirname(__FILE__))

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end