module Sinatra
  class StartCommand < Sinatra::EnvCommand

    def self.command
      "start"
    end

    def self.help
      "[environment]\t\t# default: development"
    end

    def call
      path = File.expand_path(File.join(@app_dir, "Procfile.#{self.env}"))
      if File.exists?(path)
        cmd "bundle exec foreman start -f #{path}"
      else
        path = File.expand_path(File.join(@app_dir, "Procfile"))
        cmd "bundle exec foreman start -f #{path}"
      end
    end

  end
end