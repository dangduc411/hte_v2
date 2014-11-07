class CreateConsoleGames < ActiveRecord::Migration
  def change
    create_table :console_games do |t|
      t.references :console, index: true
      t.references :game, index: true

      t.timestamps
    end
  end
end
