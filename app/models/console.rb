class Console < ActiveRecord::Base
  belongs_to :product
  has_one :contract

  has_many :console_games
  has_many :games, :through => :console_games

  scope :available, -> {where(available: true)}

  def name_with_product
    "#{product.name} - #{name}"
  end
end
