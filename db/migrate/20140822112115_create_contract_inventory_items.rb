class CreateContractInventoryItems < ActiveRecord::Migration
  def change
    create_table :contract_inventory_items do |t|
      t.references :contract, index: true
      t.references :inventory_item, index: true

      t.timestamps
    end
  end
end
