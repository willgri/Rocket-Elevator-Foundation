class FactIntervention < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_intervention do |t|
      t.integer :admin_id
      t.integer :building_id
      t.integer :battery_id
      t.integer :column_id
      t.integer :elevator_id
      t.string :start_intervention_date_hour
      t.string :end_intervention_date_hour
      t.string :result
      t.string :report
      t.string :status
    end
  end
end
