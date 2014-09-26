class CreateJobTable < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    t.integer :website_id
    t.integer :user_id
    t.integer :type
    t.integer :quantity
    t.integer :status
    t.datetime :start_date
    t.datetime :end_date
    t.timestamps
    end
  end
end

