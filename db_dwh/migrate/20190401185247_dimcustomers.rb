class Dimcustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dimcustomers do |t|
      t.date :date_of_creation
      t.string :business_name
      t.string :full_name
      t.string :email
      t.integer :numbers_of_elevators
      t.string :city
    end
  end
end
