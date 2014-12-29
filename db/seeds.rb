# encoding: UTF-8

Product.create!(name: 'PS3', slug: 'ps3', long_name: "Máy PS3 (bao gồm 1 tay cầm + game đã được cài sẵn trong máy)", rental_price: 350000, product_photo: File.new(Rails.root.join("ps3.png")))
Product.create!(name: 'PS4', slug: 'ps4', long_name: "Máy PS4 (bao gồm 1 tay cầm + game đã được cài sẵn trong máy)", rental_price: 490000, product_photo: File.new(Rails.root.join("ps4.png")))

User.create!(email: 'admin@hte.vn', password: '123', password_confirmation: '123')

6.times do |game|
  Game.create!(name: 'GTA V', poster: File.new(Rails.root.join("gta5.jpg")))
end

3.times do |num|
  Console.create!(product_id: '1', name: "Set#{num+1}")
end

2.times do |num|
  Console.create!(product_id: '2', name: "Set#{num+1}")
end

5.times do |num|
  ConsoleGame.create!(console_id: "#{num+1}", game_id: "#{num+1}")
  ConsoleGame.create!(console_id: "#{num+1}", game_id: "#{num+2}")
end