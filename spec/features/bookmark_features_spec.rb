feature 'homepage welcome' do
  it 'welcomes user' do
    visit '/'
    expect(page).to have_content "Welcome!"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')

    # add the test data
    Bookmark.add("http://www.makersacademy.com", "Makers Academy");
    Bookmark.add("http://www.destroyallsoftware.com", "Destroy");
    Bookmark.add("http://www.google.com", "Google");

    visit('/')

    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com")
    expect(page).to have_link('Destroy', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "http://www.google.com")
  end
end

feature 'Adding bookmarks' do

  scenario 'validating a url' do
    visit('/')
    fill_in 'bookmark', with: 'bookmark'
    fill_in 'title', with: 'title'
    click_button('Submit')
    expect(page).to_not have_content 'title'
    expect(page).to have_content 'Please enter a valid url'
  end

  scenario 'has a form to confirm that you`ve added a bookmark' do
    visit('/')
    expect(page).to have_content('Add New Bookmark')
  end

  scenario 'adds a bookmark to a page' do
    sign_in_and_submit
    expect(page).to have_link("my github", href: 'https://www.github.com')
  end

end

feature 'Deleting a bookmark' do
  scenario 'user can a delete a bookmark from database' do
    sign_in_and_submit
    click_button("#{Bookmark.all.first.id}")
    expect(page).not_to have_content 'my github'
  end
end

feature 'updating a bookmark' do
  scenario 'user can update a bookmark in the database' do
    sign_in_and_submit
    fill_in 'update_bookmark', with: 'GITHUB'
    click_button("#{Bookmark.all.first.title}")
    expect(page).to have_content 'GITHUB'
  end
end

feature 'allows a user to comment on a bookmark' do
  scenario 'comment on a bookmark' do
    bookmark = Bookmark.add("http://www.makersacademy.com", "Makers Academy")
    sign_in_and_submit
    fill_in 'comment', with: 'i love github'
    click_button('Comment')
    expect(page).to have_content 'i love github'
  end
end

