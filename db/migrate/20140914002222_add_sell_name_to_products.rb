class AddSellNameToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :sell_name, :string
  end
end
