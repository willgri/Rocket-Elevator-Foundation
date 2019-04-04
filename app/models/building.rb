class Building < ApplicationRecord
    has_many :interventions
    has_many :building_details
    belongs_to :customer
    belongs_to :address
    has_many :batteries
end
