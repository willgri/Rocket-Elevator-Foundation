class Factcontact < ActiveRecord::Migration[5.2]
  def change
    create_table :factcontact do |t|
      t.integer :lead_id
      t.date :created_at
      t.string :business_name
      t.string :email
      t.integer :project_name
    end
  end
end
