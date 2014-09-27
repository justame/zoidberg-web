class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_js_variables
  
  def respond_empty_success
    render json: {results: {status: 'success'}}
  end

  def set_js_variables
    if user_signed_in?
      gon.userEmail = current_user.email
      gon.workerStatus = ""
      gon.canAutoLike = current_user.can_autolike?(Website.okcupid.id)
    end
  end
end
