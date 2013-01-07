class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :regalo
      t.decimal :costo, precision: 8, scale: 2 
      t.string :donde

      t.timestamps
    end
  end
end
