module Sinatra
  class AppGenerator < Sinatra::NameCommand

    def self.command
      "generate:app"
    end

    def self.help
      "app_name"
    end

    def initialize(*args)
      super
      @app_dir = File.expand_path(pwd)
    end

    def classified
      "#{self.name.classify}App"
    end

    def call
      # mkdir self.underscored, verbose: true
      %w{apps spec/apps}.each do |dir|
        Dir[File.expand_path(File.join(dir, "**", "*"), Sinatra.template_dir)].each do |f|
          if File.directory?(f)
            mkdir_p clean_string(f), verbose: true
          else
            mkdir_p clean_string(File.dirname(f)), verbose: true
            File.open(clean_string(f), 'w') do |file|
              file.puts clean_string(File.read(f))
            end
          end
        end
      end
      File.open(File.expand_path(File.join(@app_dir, "config.ru")), "a") do |file|
        file.puts <<-EOF
  map "/#{self.underscored}" do
    run #{self.classified}
  end
        EOF
      end

      path = File.expand_path(File.join(@app_dir, "spec", "apps", "#{self.underscored}_spec.rb"))
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