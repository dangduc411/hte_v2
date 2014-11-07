class Contract < ActiveRecord::Base
  belongs_to :client
  accepts_nested_attributes_for :client

  has_many :items, class_name: 'ContractItem', dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  has_many :contract_inventory_items, dependent: :destroy
  has_many :inventory_items, -> { order(:name) }, through: :contract_inventory_items

  belongs_to :console 
  
  before_save :calculate
  before_create :generate_number
  after_save :change_console_status

  private

    def calculate
      non_ship = items.inject(0) { |sum, item| sum + (item.quantity * item.price) }
      self.total = non_ship + ship
    end

    def generate_number
      padding = 5
      last_order = Contract.last
      last_number = last_order ? last_order.number.to_i : 12231
      new_number = last_number + 1
      if new_number > 99999
        # adjust padding
        padding = new_number.to_s.size
      end
      self.number = ("%0#{padding}d" % (new_number))
    end

    def change_console_status
      self.console.update_column(:available, status != "delivered")
    end
end
