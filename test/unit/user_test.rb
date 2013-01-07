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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
