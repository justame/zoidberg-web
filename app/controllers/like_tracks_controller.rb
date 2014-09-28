class LikeTracksController < ApplicationController
  def index
    like_tracks = current_user.like_tracks.order(id: :desc).limit 50
    users = []
    like_tracks.each do |like_track|
      website_profile = WebsiteProfile.find(like_track.website_profile_id)
      user = {}
      user[:main_image_url] = website_profile[:main_image_url]
      user[:name] = website_profile[:name]
      users.push(user)
    end

    render json: users

  end
end
