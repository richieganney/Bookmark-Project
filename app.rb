require 'sinatra/base'
require_relative './spec/database_connection_setup.rb'
require_relative './models/bookmark'

class ApplicationManager < Sinatra::Base

  get '/' do
    # p ENV
    @bookmarks = Bookmark.all
    erb(:index)
  end

  post '/add-bookmark' do
    Bookmark.add(params[:bookmark], params[:title])
    redirect '/'
  end

  post '/delete-bookmarks' do
    Bookmark.delete(params.key("Delete"))
    redirect '/'
  end

  post '/update-bookmark' do
    Bookmark.update(params[:update_bookmark], params.key("Update"))
    redirect '/'
  end

  run! if app_file == $0

end
