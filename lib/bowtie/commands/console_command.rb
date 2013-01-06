module Bowtie
  class ConsoleCommand < Bowtie::EnvCommand

    def self.command
      "console"
    end

    def self.help
      "[environment]\t\t# default: development"
    end

    def call
      path = app_path("setup.rb")
      cmd "pry -r #{path}"
    end

  end
end