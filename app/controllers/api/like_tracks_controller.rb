class Api::LikeTracksController < ActionController::Base
	before_action :add_cors_headers
	respond_to :json
	
	
	def create
		permitted = params.require(:like_track).permit(:user_id)
		like_track_new = LikeTrack.create(permitted)
		
		render json:like_track_new 
	end

	private

	def add_cors_headers
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
		headers['Access-Control-Request-Method'] = '*'
		headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
	end
end