require 'sinatra/base'

class ApplicationManager < Sinatra::Base

  configure do
    enable :session
    set :views, "app/views"
    set :public_dir, "public"
  end



  get '/'  do
    erb(:index)
  end


  run! if app_file == $0

end
