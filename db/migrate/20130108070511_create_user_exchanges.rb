class CreateUserExchanges < ActiveRecord::Migration
  def change
    create_table :user_exchanges do |t|
      t.integer :user_id
      t.integer :exchange_id

      t.timestamps
    end
  end
end
