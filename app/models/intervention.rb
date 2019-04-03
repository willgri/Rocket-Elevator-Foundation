class Intervention < ApplicationRecord

    establish_connection DWH_BI

    self.table_name = "fact_intervention"
    
end
