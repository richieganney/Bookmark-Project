require './models/comment'

describe Comment do
  describe '#.add' do
    it 'creates a new comment' do
      
        bookmark = Bookmark.add("http://www.makersacademy.com", "Makers Academy")
        comment = Comment.add("Hello, world!", bookmark.id)

        expect(comment).to be_a Comment
        expect(comment.text).to eq "Hello, world!"
    end
  end
end
