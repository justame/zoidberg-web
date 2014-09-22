# == Schema Information
#
# Table name: website_profiles
#
#  id                 :integer          not null, primary key
#  website_id         :string(255)
#  external_unique_id :string(255)
#  name               :string(255)
#  main_image_url     :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class WebsiteProfile < ActiveRecord::Base
end
