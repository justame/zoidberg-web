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
  enum job_type: { likes: 0 }
  
  has_many :tasks
  after_create :start_worker

  def start_worker
    self.tasks.create(quantity: self.quantity, status: Task.statuses[:idle])

    #call iron.io
  end

  def set_complete
    self.status == Job.statuses[:complete]
    self.end_date = DateTime.now
    self.save!
  end

  def recheck_tasks_status
    if(self.tasks.where(status: Task.statuses[:complete]).count  == self.tasks.count)
      self.status = Job.statuses[:complete]
      self.save!
    end
  end
end
