class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_js_variables

  def set_js_variables
    if user_signed_in?
      gon.userEmail = current_user.email
    end
  end
end
