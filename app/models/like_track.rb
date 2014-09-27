# == Schema Information
#
# Table name: like_tracks
#
#  id                 :integer          not null, primary key
#  user_id            :string(255)
#  website_id         :integer
#  website_profile_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#  job_id             :integer
#  task_id            :integer
#

class LikeTrack < ActiveRecord::Base
end
