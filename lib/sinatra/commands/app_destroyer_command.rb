module Sinatra
  class AppDestroyer < Sinatra::NameCommand

    def self.command
      "destroy:app"
    end

    def self.help
      "app_name"
    end
    
    def initialize(*args)
      super
      @app_dir = File.expand_path(pwd)
    end

    def classified
      "#{self.name.classify}App"
    end

    def call
      path = File.expand_path(File.join(@app_dir, "apps", "#{self.underscored}.rb"))
      begin
        rm path, verbose: true
      rescue Errno::ENOENT => e
      end
      path = File.expand_path(File.join(@app_dir, "apps", "views", self.underscored))
      begin
        rm_r path, verbose: true
      rescue Errno::ENOENT => e
      end
      path = File.expand_path(File.join(@app_dir, "spec", "apps", "#{self.underscored}_spec.rb"))
      begin
        rm path, verbose: true
      rescue Errno::ENOENT => e
      end

      path = File.expand_path(File.join(@app_dir, "config.ru"))
      old = File.read(path)
      File.open(path, "w") do |file|
        map = <<-EOF
  map "/#{self.underscored}" do
    run #{self.classified}
  end
        EOF
        file.puts old.gsub(map, "")
      end
    end

  end
end