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
  scenario 'has a form to confirm that you`ve added a bookmark' do
    visit('/')
    expect(page).to have_content('Add New Bookmark')
  end

  scenario 'adds a bookmark to a page' do
    sign_in_and_submit
    expect(page).to have_link("my github", href: 'https//:www.github.com')
  end

  scenario 'adds a title to the bookmark' do
    # ENV['ENVIRONMENT'] = 'test'
    sign_in_and_submit
    expect(page).to have_link("my github", href: "https//:www.github.com")
  end
end

feature 'Deleting a bookmark' do
  scenario 'user can a delete a bookmark from database' do
    sign_in_and_submit
    click_button("#{Bookmark.all.first.id}")
    expect(page).not_to have_content 'my github'
  end
end
