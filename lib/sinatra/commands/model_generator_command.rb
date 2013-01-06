module Sinatra
  class ModelGenerator < Sinatra::NameCommand

    def self.command
      "generate:model"
    end

    def self.help
      "model_name"
    end

    def initialize(*args)
      super
      @app_dir = File.expand_path(pwd)
    end

    def call
      path = File.expand_path(File.join(@app_dir, "models", "#{self.underscored}.rb"))
      mkdir_p File.dirname(path), verbose: true
      File.open(path, 'w') do |file|
        file.puts <<-EOF
  class #{self.classified}
    include Mongoid::Document
    include Mongoid::Timestamps

  end
        EOF
      end

      path = File.expand_path(File.join(@app_dir, "spec", "models", "#{self.underscored}_spec.rb"))
      mkdir_p File.dirname(path), verbose: true
      File.open(path, 'w') do |file|
        file.puts <<-EOF
  require 'spec_helper'

  describe #{self.classified} do
    
    it "does something"

  end
        EOF
      end
    end

  end
end