# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  website_id :integer
#  user_id    :integer
#  job_type   :integer
#  quantity   :integer
#  status     :integer
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Job < ActiveRecord::Base
  enum status: { idle: 0, running: 1, complete: 2, failed: 3}
  enum job_type: { likes: 1 }
  
  has_many :tasks, dependent: :destroy
  belongs_to :user

  after_create :spawn_tasks
  before_validation :can_create_job?

  def spawn_tasks
    self.tasks.create(quantity: self.quantity, status: Task.statuses[:idle])
  end

  def run
    self.status == Job.statuses[:running]
    self.save!
    self.tasks.each do |task|
      task.run
    end
  end

  def set_complete
    self.status == Job.statuses[:complete]
    self.end_date = DateTime.now
    self.save!
  end

  def recheck_tasks_status
    if(self.tasks.where(status: Task.statuses[:complete]).count  == self.tasks.count)
      set_complete()
    end
  end

  def can_create_job?
    return true
    # last_job = self.user.last_job(self.website_id)
    
    # if last_job.present? and last_job.running?
    #   return false
    # else
    #   return true
    # end
  end

end
