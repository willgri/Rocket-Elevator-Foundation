class AddColToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_column :intervention1s, :customer_id, :integer
  end
end
