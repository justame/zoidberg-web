class ChangeLikeTrackColumnsTypeToInteger < ActiveRecord::Migration
  def change
    change_column :like_tracks, :website_id, :integer
    change_column :like_tracks, :website_profile_id, :integer
  end
end
