# == Schema Information
#
# Table name: like_tracks
#
#  id                 :integer          not null, primary key
#  user_id            :string(255)
#  website_id         :string(255)
#  website_profile_id :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class LikeTrack < ActiveRecord::Base
end
