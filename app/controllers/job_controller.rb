class JobController < ApplicationController

  def create
    permitted = user_website_credential_params
    website = Website.find_by_title params[:website_title]
    
    permitted.merge!({user_id: current_user.id})
    permitted.merge!({website_id: website.id})

    # UserWebsiteCredential.where(permitted).first_or_create
    user_website_credential = UserWebsiteCredential.create(permitted) if UserWebsiteCredential.where(username: permitted[:username], password: permitted[:password], user_id: current_user.id).count == 0
    
    puts "website_id:" + website.id.to_s
    puts "user_id:" + current_user.id.to_s
    puts "job_type:" + Job.job_types[:likes].to_s
    puts "quantity:" + 20.to_s
    puts "status:" + Job.statuses[:idle].to_s
    puts "status:" + Job.statuses[:idle].to_s
    puts "start_date:" + DateTime.now.to_s

    job = Job.create({ 
      website_id: website.id,
      user_id: current_user.id,
      job_type: Job.job_types[:likes],
      quantity: 20,
      status: Job.statuses[:idle],
      start_date: DateTime.now
     })
    
    job.run()

    render json: job
  end

  private

  def user_website_credential_params
    params.require(:user_website_credential).permit(:username, :password, :website_title, :user_id)
  end
end
