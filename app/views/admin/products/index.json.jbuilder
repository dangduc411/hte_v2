json.array!(@admin_products) do |admin_product|
  json.extract! admin_product, :id, :name, :slug, :rental_price, :selling_price, :deposit_price, :sales_price
  json.url admin_product_url(admin_product, format: :json)
end
