class User < ActiveRecord::Base
  attr_accessible :apellido, :nombre, :password, :usuario
end
