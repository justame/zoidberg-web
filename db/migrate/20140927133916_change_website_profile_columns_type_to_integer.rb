class ChangeWebsiteProfileColumnsTypeToInteger < ActiveRecord::Migration
  def change
    change_column :website_profiles, :website_id, :integer
  end
end
