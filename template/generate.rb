require 'active_support/core_ext'
require 'fileutils'

include FileUtils

@app_name = ARGV[0]

mkdir @app_name.underscore, verbose: true

@template_dir = File.expand_path(File.dirname(__FILE__))
@app_dir = File.expand_path(File.join(pwd, @app_name.underscore))

def clean_string(f)
  f.gsub(@template_dir, @app_dir).gsub("my_app", @app_name.underscore).gsub("MyApp", @app_name.classify)
end

Dir[File.expand_path(File.join("**", "*"), @template_dir)].each do |f|
  if File.directory?(f)
    mkdir_p clean_string(f), verbose: true
  else
    mkdir_p clean_string(File.dirname(f)), verbose: true
    File.open(clean_string(f), 'w') do |file|
      file.puts clean_string(File.read(f))
    end
  end
end

rm File.join(@app_dir, "generate.rb"), verbose: true