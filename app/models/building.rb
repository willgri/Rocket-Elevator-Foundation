class Building < ApplicationRecord
    belongs_to :intervention
    belongs_to :customer
    belongs_to :address
    has_many :batteries
end
