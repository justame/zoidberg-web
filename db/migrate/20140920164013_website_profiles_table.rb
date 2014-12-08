class WebsiteProfilesTable < ActiveRecord::Migration
  def change
	create_table :website_profiles do |t|
		t.integer :website_id
		t.string :external_unique_id
		t.string :name
		t.string :main_image_url

		t.timestamps
	end  	
  end
end
