  require "iron_worker_ng"

class Api::JobController < ApplicationController

  def create
    permitted = user_website_credential_params
    website = Website.find_by_title params[:website_title]
    permitted.merge!({user_id: current_user.id})
    permitted.merge!({website_id: website.id})

    # UserWebsiteCredential.where(permitted).first_or_create
    user_website_credential = UserWebsiteCredential.create(permitted) if UserWebsiteCredential.where(username: permitted[:username], password: permitted[:password]).count == 0
    Job.create({ 
      website_id: website.id,
      user_id: current_user.id,
      job_type: Job.job_types[:likes],
      quantity: 10,
      status: Job.statuses[:running],
      start_date: DateTime.now
     })
    
    client = IronWorkerNG::Client.new
    task = client.tasks.create("zoidberg", "foo"=>"bar")
    binding.pry
    # call worker
    render json: {results: {status: 'success'}}
  end

  private

  def user_website_credential_params
    params.require(:user_website_credential).permit(:username, :password, :website_title, :user_id)
  end
end
