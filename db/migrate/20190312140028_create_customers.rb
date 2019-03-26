class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.belongs_to :leads, foreign_key: true
      t.references :address, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.references :admins, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.date :date_of_creation
      t.string :business_name
      t.string :full_name
      t.integer :phone_number, :limit => 8
      t.string :email
      t.text :business_description
      t.integer :technical_ressource_phone_number, :limit => 8
      t.string :technical_ressource_email
      t.timestamps
    end
  end
end
