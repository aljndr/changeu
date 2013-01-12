# == Schema Information
#
# Table name: user_exchanges
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  exchange_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status        :integer
#  exchanging_id :integer
#

class UserExchange < ActiveRecord::Base
  attr_accessible :admon, :exchange_id, :user_id,:status
  belongs_to :user, class_name: :User
  belongs_to :exchange
  belongs_to :exchanging, class_name: :User

  def status= int
  	toint ={Admon:1,Pendiente:2,Aceptado:3} 
  	int = toint[int] if int.class == Symbol
  	super int
  end

  def status?
  	st = ["","Admon","Pendiente","Aceptado"]
  	return st[status]
  end
end
