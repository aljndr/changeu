class Exchange < ActiveRecord::Base
  attr_accessible :costo_max, :costo_min, :fecha, :titulo
  has_many :user_exchanges, dependent: :destroy
  has_many :users, through: :user_exchanges
end
