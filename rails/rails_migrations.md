## Inside db/migrate/

E.g.:
  class CreateMessages < ActiveRecord::Migration
    def change
      create_table :messages do |t|
  			t.text :content
        t.timestamps
      end
    end
  end

  # change
    The change method tells Rails what change to make to the database.

  # create_table
    Inside the change method, the create_table method to create a new table in the database for storing messages.

  # t.text
    Inside the create_table method, we added t.text :content. This will create a text column called content in the messages tables.

  # t.timestamps
    t.timestamps is a Rails command that creates two more columns in the messages table called created_at and updated_at. These columns are automatically set when a message is created and updated.
