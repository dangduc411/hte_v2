class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :client, index: true
      t.integer :duration
      t.date :delivery_date
      t.date :complete_date
      t.string :number
      t.integer :total
      t.string :status

      t.timestamps
    end
  end
end
