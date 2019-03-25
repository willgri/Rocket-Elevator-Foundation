class ChangeNumberBasement < ActiveRecord::Migration[5.2]
  def change
    change_column :quotes, :number_basement, :integer
  end
end
