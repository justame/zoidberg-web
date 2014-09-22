# == Schema Information
#
# Table name: websites
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  login_url  :string(255)
#  main_url   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Website < ActiveRecord::Base
end
