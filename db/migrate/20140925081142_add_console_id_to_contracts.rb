class AddConsoleIdToContracts < ActiveRecord::Migration
  def change
  	add_column :contracts, :console_id, :integer
  end
end
