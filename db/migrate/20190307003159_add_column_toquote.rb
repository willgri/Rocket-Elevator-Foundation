class AddColumnToquote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :full_name ,:string
    add_column :quotes, :phone_number ,:string
    add_column :quotes, :email ,:string
    add_column :quotes, :business_name ,:string
    add_column :quotes, :building_type, :string
    add_column :quotes, :quality, :string
    add_column :quotes, :elevator_price ,:float
    add_column :quotes, :installation_price ,:float
    add_column :quotes, :number_elevator ,:float
    add_column :quotes, :total_price ,:float
    add_column :quotes, :number_floor, :integer
    add_column :quotes, :number_appartment, :integer
    add_column :quotes, :number_basement, :integer
    #####  Peut-être simplement faire une seule column pour certaines données afin d'éviter la surchage 
    add_column :quotes, :number_parking_space, :integer
    add_column :quotes, :maximum_occupant_per_floor, :integer
    add_column :quotes, :hour_of_activity, :integer
    add_column :quotes, :number_of_elevators_cage, :integer
    add_column :quotes, :number_of_trade_market, :integer
    add_column :quotes, :number_of_distinct_business, :integer
  end
end
