# == Schema Information
#
# Table name: user_exchanges
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  exchange_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer
#  to_user     :integer
#

class UserExchange < ActiveRecord::Base
  attr_accessible :admon, :exchange_id, :user_id
  belongs_to :user, class_name: :User
  belongs_to :exchange
  belongs_to :exchanging, class_name: :User
end
