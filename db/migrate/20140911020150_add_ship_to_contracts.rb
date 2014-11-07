class AddShipToContracts < ActiveRecord::Migration
  def change
  	add_column :contracts, :ship, :integer
  end
end
