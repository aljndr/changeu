# == Schema Information
#
# Table name: wishes
#
#  id                 :integer          not null, primary key
#  regalo             :string(255)
#  costo              :decimal(8, 2)
#  donde              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Wish < ActiveRecord::Base
  attr_accessible :costo, :donde, :regalo
  belongs_to :users
  has_attached_file :image
end
