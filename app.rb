require 'sinatra/base'
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

  run! if app_file == $0

end
