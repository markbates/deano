class MyApp < Sinatra::Base
  register Sinatra::Twitter::Bootstrap::Assets

  set :views, File.join(settings.views, "my_app")

  get "/" do
    erb :index
  end

end