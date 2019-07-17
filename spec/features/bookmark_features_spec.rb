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
    visit('/')
    fill_in 'bookmark', with: 'https//:www.github.com'
    click_button('Submit')
    expect(page).to have_content 'https//:www.github.com'
  end

  scenario 'adds a title to the bookmark' do
    # ENV['ENVIRONMENT'] = 'test'
    visit('/')
    fill_in 'bookmark', with: 'https//:www.github.com'
    fill_in 'title', with: 'my github'
    click_button('Submit')
    expect(page).to have_link("my github", href: "https//:www.github.com")
  end
end
