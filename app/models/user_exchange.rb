class UserExchange < ActiveRecord::Base
  attr_accessible :admon, :exchange_id, :user_id
  belongs_to :user
  belongs_to :exchange
end
