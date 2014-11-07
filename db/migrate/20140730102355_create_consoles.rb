class CreateConsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|
      t.references :product, index: true
      t.string :name
      t.string :slug
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
