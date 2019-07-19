require 'pg'

p "Setting up test database..."

def set_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Clear the bookmarks table
  connection.exec("TRUNCATE bookmarks, comments;")
end

set_test_database
