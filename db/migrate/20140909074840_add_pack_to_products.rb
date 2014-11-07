class AddPackToProducts < ActiveRecord::Migration
  def change
    add_column :products, :pack1_price, :integer
    add_column :products, :pack2_price, :integer
    add_column :products, :pack3_price, :integer
  end
end
