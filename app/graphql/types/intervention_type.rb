module Types
    class InterventionType < BaseObject
      field :id, ID, null: false
      field :employee_id, ID, null: false
      field :building_id, ID, null: false
      field :column_id, ID, null: false
      field :elevator_id, ID, null: false
      field :start_intervention_date_hour, String, null: false 
      field :end_intervention_date_hour, String, null: false
      field :result, String, null: false
      field :report, String, null: true
      field :status, String, null: false
    end
end