class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.integer :duration
      t.references :console, index: true
      t.text :note
      t.string :state, default: 'pending'

      t.timestamps
    end
  end
end