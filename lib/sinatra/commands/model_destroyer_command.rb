module Sinatra
  class ModelDestroyer < Sinatra::NameCommand

    def self.command
      "destroy:model"
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
      begin
        rm path, verbose: true
      rescue Errno::ENOENT => e
      end
      path = File.expand_path(File.join(@app_dir, "spec", "models", "#{self.underscored}_spec.rb"))
      begin
        rm path, verbose: true
      rescue Errno::ENOENT => e
      end
    end

  end
end