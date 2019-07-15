feature 'homepage welcome' do
  it 'welcomes user' do
    visit '/'
    expect(page).to have_content "Welcome!"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
