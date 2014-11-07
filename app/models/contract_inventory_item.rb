class ContractInventoryItem < ActiveRecord::Base
  belongs_to :contract
  belongs_to :inventory_item
end
