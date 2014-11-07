class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :long_name
      t.string :slug
      t.integer :rental_price
      t.integer :selling_price
      t.integer :deposit_price
      t.integer :sales_price
      t.string :product_photo

      t.timestamps
    end
  end
end
