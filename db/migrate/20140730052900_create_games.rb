class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :poster
      t.string :psn_link

      t.timestamps
    end
  end
end
