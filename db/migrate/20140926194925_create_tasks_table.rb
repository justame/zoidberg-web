class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :job_id
      t.integer :quantity
      t.integer :status
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
