require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative './spec/database_connection_setup.rb'
require_relative './models/bookmark'
require_relative './models/comment'

class ApplicationManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash 

  get '/' do
    # p ENV
    @bookmarks = Bookmark.all
    @comments = Comment.all
    erb(:index)
  end

  post '/add-bookmark' do
    flash[:notice] = 'Please enter a valid url' unless Bookmark.add(params[:bookmark], params[:title])
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

  post '/comment' do
  end

  run! if app_file == $0

end
