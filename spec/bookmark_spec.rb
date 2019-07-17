require './models/bookmark'

describe Bookmark do
  describe '#.all' do
    it 'returns all bookmarks' do

      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      Bookmark.add("http://www.makersacademy.com");
      Bookmark.add("http://www.destroyallsoftware.com");
      Bookmark.add("http://www.google.com");
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks[0][0]).to include("http://www.makersacademy.com")
      expect(bookmarks[1][0]).to include("http://www.destroyallsoftware.com")
      expect(bookmarks[2][0]).to include("http://www.google.com")
    end
  end

  describe '#.add_bookmark' do
    it 'adds a bookmark to the database' do
      Bookmark.add('www.github.com')
      expect(Bookmark.all[0][0]).to include 'www.github.com'
    end
  end

end