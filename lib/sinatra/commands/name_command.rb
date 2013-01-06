module Sinatra
  class NameCommand < Sinatra::Command
    include FileUtils

    attr_accessor :args, :name

    def self.inherited(klass)
      Command.inherited(klass)
    end

    def underscored
      self.name.underscore
    end

    def classified
      self.name.classify
    end

    def initialize(args)
      self.args = args
      self.name = ARGV[1]
    end

    def clean_string(f)
      f.gsub(Sinatra.template_dir, @app_dir).gsub("template_app", self.underscored).gsub("TemplateApp", self.classified)
    end

  end
end