class Api::LikeTracksController < Api::BaseController
 wrap_parameters format: [:json]
  def create
    website_profile_permitted = params.permit(:website_id, :external_unique_id, :name, :main_image_url)
    like_track_permitted = params.permit(:user_id, :job_id, :task_id, :website_id)

    website_profile = WebsiteProfile.where(external_unique_id: website_profile_permitted[:external_unique_id]).first
    website_profile = WebsiteProfile.create(website_profile_permitted) if website_profile.blank?

    like_track_permitted.merge!(website_profile_id: website_profile.id)
    LikeTrack.create(like_track_permitted)
    

		
		respond_empty_success
	end

end