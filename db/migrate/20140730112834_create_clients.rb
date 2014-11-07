class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :social_id
      t.string :social_issue_place
      t.string :social_issue_date

      t.timestamps
    end
  end
end
