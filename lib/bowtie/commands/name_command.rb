module Bowtie
  class NameCommand < Bowtie::Command

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
      @app_dir = File.expand_path(FileUtils.pwd)
    end

    def clean_string(f)
      f.gsub(Bowtie.template_dir, @app_dir).gsub("template_app", self.underscored).gsub("TemplateApp", self.classified)
    end

  end
end