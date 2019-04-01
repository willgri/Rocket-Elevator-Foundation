class Factquotes < ActiveRecord::Migration[5.2]
  def change    
    create_table :factquotes do |t|
      t.integer :quote_id
      t.date :created_at
      t.string :business_name
      t.string :email
      t.integer :number_elevator
    end
  end
end
