# == Schema Information
#
# Table name: user_website_credentials
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class UserWebsiteCredential < ActiveRecord::Base
end
