module Deano

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

    def rm(path)
      begin
        FileUtils.rm path, verbose: true
      rescue Errno::ENOENT => e
      end
    end

    def rm_r(path)
      begin
        FileUtils.rm_r path, verbose: true
      rescue Errno::ENOENT => e
      end
    end

    def app_path(*path)
      File.expand_path(File.join(@app_dir, *path))
    end

    def template_path(*path)
      File.expand_path(File.join(Deano.template_dir, *path))
    end

  end
end