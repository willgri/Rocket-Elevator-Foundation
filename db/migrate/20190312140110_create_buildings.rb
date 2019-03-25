class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.references :customer, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.references :address, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :building_admin_full_name
      t.string :building_admin_email
      t.integer :building_admin_phone_number, :limit => 8
      t.string :technical_ressource_full_name
      t.integer :technical_ressource_phone_number, :limit => 8
      t.string :technical_ressource_email
      t.timestamps
    end
  end
end
