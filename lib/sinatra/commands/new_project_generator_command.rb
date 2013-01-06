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
      FileUtils.mkdir self.underscored, verbose: true
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
      File.open(app_path(".gitignore"), "w") do |f|
        f.puts File.read(template_path(".gitignore"))
      end
      Dir[app_path("**", "*")].each do |file|
        if File.directory?(file)
          if Dir[File.join(file, "**", "*")].empty?
            File.open(File.join(file, ".git-keep"), 'w') {|f| f.puts ""}
          end
        end
      end
      FileUtils.cd app_path
      system "git init"
      system "git add ."
      system "git commit -a -m 'Initial Commit'"
    end

  end
end