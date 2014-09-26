class Api::UserWebsiteCredentialController < ApplicationController
  
  def create
    # permitted = params.require(:user_website_credential).permit(:username, :password)
    # website = Website.find_by_title "okcupid"
    
    # permitted.merge!({user_id: current_user.id})
    # permitted.merge!({website_id: website.id})


    # user_website_credential = UserWebsiteCredential.create(permitted)
    # render :nothing => true, :status => 200, :content_type => 'text/html'
  end
end
