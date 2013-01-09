class AddToUserColumnToUserExchange < ActiveRecord::Migration
  def change
  	add_column :user_exchanges, :status, :integer
  	add_column :user_exchanges, :exchanging_id, :integer
  end
end
