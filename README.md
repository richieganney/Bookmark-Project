# bookmarks

- Show a list of bookmarks ✅
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users manage their bookmarks

# user stories

As a user
So I can see my bookmarks
I want to list my bookmarks on a webpage

As a user
So I can see a list of my favourite websites<
I want it to show me a list of all the bookmarks

# domain modelling

nouns
- bookmark

verbs
- list

# instructions for setting up the database of this project

- Connect to psql (use 'brew install postgresql' if you don't have it already)
- Create the database using the psql command CREATE DATABASE bookmark_manager;
- Connect to the database using the pqsl command \c bookmark_manager;
- Run the query we have saved in the file 01_create_bookmarks_table.sql
