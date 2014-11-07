json.array!(@admin_consoles) do |admin_console|
  json.extract! admin_console, :id, :product_id, :name, :slug, :available
  json.url admin_console_url(admin_console, format: :json)
end
