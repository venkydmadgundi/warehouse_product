class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :sku_code, limit: 8
      t.string :name
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
    add_index :products, :sku_code, unique: true
  end
end
