class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.references :battery, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :atype
      t.integer :number_of_floor
      t.string :status
      t.text :information
      t.text :notes
      t.timestamps
    end
  end
end
