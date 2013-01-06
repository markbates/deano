module Sinatra
  class StartCommand < Sinatra::EnvCommand

    def self.command
      "start"
    end

    def self.help
      "[environment]\t\t# default: development"
    end

    def call
      path = app_path("Procfile.#{self.env}")
      if File.exists?(path)
        cmd "bundle exec foreman start -f #{path}"
      else
        path = app_path("Procfile")
        cmd "bundle exec foreman start -f #{path}"
      end
    end

  end
end