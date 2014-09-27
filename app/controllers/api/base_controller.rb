class Api::BaseController < ActionController::Base
  before_action :add_cors_headers, :verify_token
  respond_to :json

  def respond_empty_success
    render json: {results: {status: 'success'}}
  end
  
  private

  def verify_token
    if(params[:token] != Settings.API_TOKEN)
      render nothing: true, :status => :unauthorized
    end
  end


  def add_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end