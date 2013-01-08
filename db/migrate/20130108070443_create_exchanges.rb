class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :titulo
      t.decimal :costo_min, precision: 8, scale: 2 
      t.decimal :costo_max, precision: 8, scale: 2 
      t.date :fecha

      t.timestamps
    end
  end
end
