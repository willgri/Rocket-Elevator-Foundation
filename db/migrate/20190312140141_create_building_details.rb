class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      
      t.belongs_to :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :information_key
      t.string :value
      t.timestamps
    end
  end
end
