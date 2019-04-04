class Intervention < ApplicationRecord
    belongs_to :building
    belongs_to :admin
    establish_connection DWH_BI

    self.table_name = "fact_intervention"
    
end
