require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id = nil, title = nil, url = nil)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
    # result.map { |bookmark| [bookmark['url'], bookmark['title']] }
  end

  def self.add(url, title = 'un-named title')
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.delete(bookmark)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE id = #{bookmark};")
  end

end
