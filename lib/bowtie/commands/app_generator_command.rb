module Bowtie
  class AppGenerator < Bowtie::NameCommand

    def self.command
      "generate:app"
    end

    def self.help
      "app_name"
    end

    def classified
      "#{self.name.classify}App"
    end

    def call
      # mkdir self.underscored, verbose: true
      %w{apps spec/apps}.each do |dir|
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
      File.open(app_path("assets", "javascripts", "#{self.underscored}.js.coffee"), 'w') do |file|
        file.puts ""
      end
      File.open(app_path("assets", "stylesheets", "#{self.underscored}.css.scss"), 'w') do |file|
        file.puts ""
      end
      File.open(app_path("config.ru"), "a") do |file|
        file.puts <<-EOF
  map "/#{self.underscored}" do
    run #{self.classified}
  end
        EOF
      end

    end

  end
end