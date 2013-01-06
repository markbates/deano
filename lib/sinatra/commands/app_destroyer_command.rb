module Sinatra
  class AppDestroyer < Sinatra::NameCommand

    def self.command
      "destroy:app"
    end

    def self.help
      "app_name"
    end

    def classified
      "#{self.name.classify}App"
    end

    def call
      path = app_path("apps", "#{self.underscored}.rb")
      rm path

      path = app_path("apps", "views", self.underscored)
      rm_r path

      path = app_path("spec", "apps", "#{self.underscored}_spec.rb")
      rm path

      path = app_path("assets", "javascripts", "#{self.underscored}.js.coffee")
      rm path

      path = app_path("assets", "stylesheets", "#{self.underscored}.css.scss")
      rm path

      path = app_path("config.ru")
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