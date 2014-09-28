class RemoveIndexFromWebsiteCredentials < ActiveRecord::Migration
  def change
    remove_index :user_website_credentials, name: :user_website_credentials_id
  end
end
