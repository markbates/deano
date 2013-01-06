module Sinatra
  class ConsoleCommand < Sinatra::EnvCommand

    def self.command
      "console"
    end

    def self.help
      "[environment]\t\t# default: development"
    end

    def call
      path = File.expand_path(File.join(@app_dir, "setup.rb"))
      cmd "pry -r #{path}"
    end

  end
end