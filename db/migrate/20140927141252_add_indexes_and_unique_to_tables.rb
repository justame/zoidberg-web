class AddIndexesAndUniqueToTables < ActiveRecord::Migration
  def change
    add_index :website_profiles, [:external_unique_id, :website_id], :unique => true
    add_index :user_website_credentials, [:username, :password], :unique => true, name: "user_website_credentials_id"
    add_index :like_tracks, [:user_id, :website_id]
  end
end
