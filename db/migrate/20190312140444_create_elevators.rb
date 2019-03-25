class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.references :column, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.integer :serial_number
      t.string :model
      t.string :atype
      t.string :status
      t.date :installation_date
      t.date :last_inspection_date
      t.string :inspection_certificate
      t.text :information
      t.text :notes
      t.timestamps
    end
  end
end
