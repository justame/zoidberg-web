class UserWebsiteCredintalTable < ActiveRecord::Migration
  def change
	create_table :user_website_credentials do |t|
		t.string :username
		t.string :password

		t.timestamps
	end  	
  end
end
