module Sinatra
  class NewProjectGenerator < Sinatra::NameCommand

    def self.command
      "new"
    end

    def self.help
      "name"
    end

    def initialize(*args)
      super
      @app_dir = File.expand_path(File.join(FileUtils.pwd, self.underscored))
    end

    def classified
      "#{self.name.classify}App"
    end

    def call
      mkdir self.underscored, verbose: true
      Dir[template_path("**", "*")].each do |f|
        if File.directory?(f)
          FileUtils.mkdir_p clean_string(f), verbose: true
        else
          FileUtils.mkdir_p clean_string(File.dirname(f)), verbose: true
          File.open(clean_string(f), 'w') do |file|
            file.puts clean_string(File.read(f))
          end
        end
      end
    end

  end
end