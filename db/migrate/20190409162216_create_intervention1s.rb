class CreateIntervention1s < ActiveRecord::Migration[5.2]
  def change
    create_table :intervention1s do |t|

      t.timestamps
    end
  end
end
