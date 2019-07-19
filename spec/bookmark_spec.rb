require './models/bookmark'

describe Bookmark do
  describe '#.all' do
    it 'returns all bookmarks' do

      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      bookmark = Bookmark.add("http://www.makersacademy.com", "Makers Academy");
      Bookmark.add("http://www.destroyallsoftware.com", "Destroy");
      Bookmark.add("http://www.google.com", "Google");
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Makers Academy"
      expect(bookmarks.last.url).to eq "http://www.google.com"
    end
  end

  describe '#.add' do
    it 'adds a bookmark to the database' do
      expect(Bookmark.add('https://www.github.com', 'My Github')).to be_a Bookmark
    end
  end

  describe '#.delete' do
    it 'deletes a bookmark from the webpage' do
      bookmark = Bookmark.add('https://www.github.com', 'My Github')
      Bookmark.delete(bookmark.id)
      expect(Bookmark.all).to eq []
    end
  end

  describe '#.update' do
    it 'updates the title of a bookmark' do
      bookmark = Bookmark.add('https://www.github.com', 'My Github')
      Bookmark.update('GITHUB', bookmark.title)
      expect(Bookmark.all.first.title).to eq 'GITHUB'
    end
  end
end
