module Bowtie
  class EnvCommand < Bowtie::Command
    include FileUtils

    attr_accessor :args, :env

    def self.inherited(klass)
      Command.inherited(klass)
    end

    def initialize(args)
      self.args = args
      @app_dir = File.expand_path(FileUtils.pwd)
      self.env = args[1] || "development"
      ENV["RACK_ENV"] = self.env
    end

  end
end