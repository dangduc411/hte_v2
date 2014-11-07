class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
