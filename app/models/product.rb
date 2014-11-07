class Product < ActiveRecord::Base
  mount_uploader :product_photo, ::ProductPhotoUploader

  scope :sellable, -> {where(sellable: true)}
  scope :rental, -> {where(sellable: false)}

  def display_name
  	sell_name.presence || name
  end
end
