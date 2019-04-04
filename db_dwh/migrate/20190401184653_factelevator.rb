class Factelevator < ActiveRecord::Migration[5.2]
  def change
    create_table :factelevator do |t|
      t.integer :elevator_id
      t.string :serial_number
      t.date :installation_date
      t.integer :building_id
      t.integer :customer_id
      t.string :building_city
    end
  end
end
