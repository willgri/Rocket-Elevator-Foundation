class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :business_name
      t.string :email
      t.integer :phone_number, :limit => 8
      t.string :project_name
      t.text :project_description
      t.string :department_in_charge_of_elevators
      t.text :message
      t.binary :attached_file
      t.date :date
      t.timestamps
    end
  end
end
