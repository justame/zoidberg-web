class AddUserIdAndWebsiteIdToUserWebsiteCredential < ActiveRecord::Migration
  def change
    add_column :user_website_credentials, :website_id, :integer
    add_column :user_website_credentials, :user_id, :integer
  end
end
