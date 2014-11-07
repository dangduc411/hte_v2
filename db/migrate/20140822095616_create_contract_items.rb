class CreateContractItems < ActiveRecord::Migration
  def change
    create_table :contract_items do |t|
      t.references :contract, index: true
      t.references :product, index: true
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
