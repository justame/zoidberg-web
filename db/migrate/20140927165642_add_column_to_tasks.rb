class AddColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :external_id, :string
  end
end
