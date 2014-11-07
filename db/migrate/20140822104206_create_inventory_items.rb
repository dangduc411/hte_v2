class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.string :serial

      t.timestamps
    end
  end
end
