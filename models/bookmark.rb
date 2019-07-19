require 'pg'
require_relative './database_connection'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id = nil, title = nil, url = nil)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
  end

  def self.add(url, title = 'un-named title')
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.delete(bookmark)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{bookmark};")
  end

  def self.update(bookmark_text, bookmark_title)
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{bookmark_text}' WHERE title = '#{bookmark_title}';")
  end

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end


  # if ENV['ENVIRONMENT'] == 'test'
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  # else
  #   connection = PG.connect(dbname: 'bookmark_manager')
  # end
end
