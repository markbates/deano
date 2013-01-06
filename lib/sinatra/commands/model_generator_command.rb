module Sinatra
  class ModelGenerator < Sinatra::NameCommand

    def self.command
      "generate:model"
    end

    def self.help
      "model_name"
    end

    def call
      path = app_path("models", "#{self.underscored}.rb")
      FileUtils.mkdir_p File.dirname(path), verbose: true
      File.open(path, 'w') do |file|
        file.puts <<-EOF
  class #{self.classified}
    include Mongoid::Document
    include Mongoid::Timestamps

  end
        EOF
      end

      path = app_path("spec", "models", "#{self.underscored}_spec.rb")
      FileUtils.mkdir_p File.dirname(path), verbose: true
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