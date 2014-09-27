class Api::LikeTracksController < Api::BaseController
	def create
		
    permitted = params.require(:like_track).permit(:user_id)
    binding.pry
		like_track_new = LikeTrack.create(permitted)
		
		render json:like_track_new 
	end

end