module Sinatra

  def self.template_dir
    File.expand_path(File.join("..", "..", "..", "template_app"), File.dirname(__FILE__))
  end

  class Command

    def self.command
      nil
    end

    def self.commands
      @commands ||= []
    end

    def self.inherited(klass)
      self.commands << klass
    end

    def cmd(command)
      puts command
      system command
    end

  end
end