class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.references :admins, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :atype
      t.string :status
      t.date :deploy_date
      t.date :last_inspection_date
      t.string :operation_certificate
      t.text :informations
      t.text :notes
      t.timestamps
    end
  end
end
