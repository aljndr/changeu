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

require 'test_helper'

class UserExchangeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
