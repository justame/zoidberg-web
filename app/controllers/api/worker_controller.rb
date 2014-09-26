class Api::WorkerController < ApplicationController
  
  def start
    permitted = user_website_credential_params
    website = Website.find_by_title params[:website_title]
    permitted.merge!({user_id: current_user.id})
    permitted.merge!({website_id: website.id})

    # UserWebsiteCredential.where(permitted).first_or_create
    user_website_credential = UserWebsiteCredential.create(permitted)

    # call worker
    render json: {results: {status: 'success'}}
  end

  private

  def user_website_credential_params
    params.require(:user_website_credential).permit(:username, :password, :website_title, :user_id)
  end
end
