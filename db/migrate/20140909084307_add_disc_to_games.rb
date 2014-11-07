class AddDiscToGames < ActiveRecord::Migration
  def change
    add_column :games, :disc, :boolean, default: false
  end
end
