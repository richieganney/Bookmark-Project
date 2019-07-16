require 'sinatra/base'
require_relative './models/bookmark'

class ApplicationManager < Sinatra::Base

  get '/' do
    # p ENV
    @bookmarks = Bookmark.all
    erb(:index)
  end

  run! if app_file == $0

end
