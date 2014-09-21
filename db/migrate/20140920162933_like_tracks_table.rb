class LikeTracksTable < ActiveRecord::Migration
	def change
		create_table :like_tracks do |t|
			t.string :user_id
			t.string :website_id
			t.string :user_id
			t.string :website_profile_id

			t.timestamps
		end
	end
end
