# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  job_id      :integer
#  quantity    :integer
#  status      :integer
#  start_date  :datetime
#  end_date    :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  external_id :string(255)
#

require "iron_worker_ng"

class Task < ActiveRecord::Base
  enum status: { idle: 0, running: 1, complete: 2, failed: 3}
  belongs_to :job

  after_save :update_job

  
  def set_complete
    self.status == Task.statuses[:complete]
    self.end_date = DateTime.now
    self.save!

  end

  def run
    self.status = Task.statuses[:running]
    client = IronWorkerNG::Client.new

    user_website_credential = self.job.user.user_website_credentials.last
    website = Website.find(self.job.website_id)

    payload = Hash.new
    payload[:token] = Settings.API_TOKEN
    payload[:username] = user_website_credential.username
    payload[:password] = user_website_credential.password
    payload[:jobId] = self.job_id
    payload[:taskId] = self.id
    payload[:websiteId] = website.id
    payload[:loginUrl] = website.login_url
    payload[:quantity] = self.quantity
    payload[:apiHost] = Settings.API_HOST
    payload[:userId] = self.job.user_id
    
    # call iron.io
    task = client.tasks.create "zoidberg" ,payload
    self.external_id = task.id
    
    self.save!
  end

  def update_job
    self.job.recheck_tasks_status
  end
end
