class AddJobIdAndTaskIdToJobTracks < ActiveRecord::Migration
  def change
    add_column :like_tracks, :job_id, :integer
    add_column :like_tracks, :task_id, :integer
  end
end
