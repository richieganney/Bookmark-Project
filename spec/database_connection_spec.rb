require_relative '../models/database_connection'
require 'pg'

describe DatabaseConnection do
  describe "#.setup" do
    it "sets up a connection to the database through pg" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup("bookmark_manager_test")
    end

    it "this connection is persistent" do
      #Grab the connection as a return value from the setup method
      connection = DatabaseConnection.setup("bookmark_manager_test")
      expect(DatabaseConnection.connection). to eq connection
    end
  end

  describe "#.query" do
    it "executes a query via PG" do
      connection = DatabaseConnection.setup("bookmark_manager_test")
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
