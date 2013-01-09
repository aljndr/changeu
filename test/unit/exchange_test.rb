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

require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
