class AddSellableToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sellable, :boolean, :default => false
  end
end
