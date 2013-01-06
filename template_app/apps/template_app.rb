class TemplateApp < Sinatra::Base
  register Sinatra::Twitter::Bootstrap::Assets

  set :views, File.join(settings.views, "template_app")

  get "/" do
    erb :index
  end

end