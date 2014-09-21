class Websites < ActiveRecord::Migration
  def change
	create_table :websites do |t|
		t.string :title
		t.string :login_url
		t.string :main_url

		t.timestamps
	end  	
  end
end
