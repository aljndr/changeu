# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  usuario    :string(255)
#  password   :string(255)
#  nombre     :string(255)
#  apellido   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :apellido, :nombre, :password, :usuario
  has_many :wishes
  has_many :user_exchanges,dependent: :destroy
  has_many :exchanges, through: :user_exchanges
  has_many :exchanging, through: :user_exchanges 

  def active_exchanges?
  	self.user_exchanges.where(status: 3).any?
  end

  def admon_exchanges?
  	self.user_exchanges.where(status: 1).any?
  end

  def pendient_exchanges?
  	self.user_exchanges.where(status: 2).any?
  end

  def invitaciones
  	invs = []
  	self.user_exchanges.where(status: 2).each{|ue| invs << ue.exchange }
  	invs
  end

end
