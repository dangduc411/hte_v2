class ContractItem < ActiveRecord::Base
  belongs_to :contract
  belongs_to :product
end
