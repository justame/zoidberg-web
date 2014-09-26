# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  quantity   :integer
#  status     :integer
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
  enum status: { idle: 0, running: 1, complete: 2, failed: 3}
  belongs_to :job

  after_save :update_job
  
  def set_complete
    self.status == Task.statuses[:complete]
    self.end_date = DateTime.now
    self.save!

  end

  def update_job
    self.job.recheck_tasks_status
  end
end
