class UsersTable < ActiveRecord::Migration
  def change
	create_table :users do |t|
		t.string :user_id
		t.string :username
		t.string :password

		t.timestamps
	end  	
  end
end
