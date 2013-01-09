# == Schema Information
#
# Table name: exchanges
#
#  id         :integer          not null, primary key
#  titulo     :string(255)
#  costo_min  :decimal(8, 2)
#  costo_max  :decimal(8, 2)
#  fecha      :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exchange < ActiveRecord::Base
  attr_accessible :costo_max, :costo_min, :fecha, :titulo
  has_many :user_exchanges, dependent: :destroy
  has_many :users, through: :user_exchanges
  has_many :exchanging, through: :user_exchanges 
end
