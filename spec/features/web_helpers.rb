def sign_in_and_submit
  visit('/')
  fill_in 'bookmark', with: 'https//:www.github.com'
  fill_in 'title', with: 'my github'
  click_button('Submit')
end
