module Types
    class InterventionType < BaseObject
      field :id, ID, null: true
      field :admin, AdminType, null: true
      field :building, BuildingType, null: true
      field :column_id, ID, null: true
      field :elevator_id, ID, null: true
      field :start_intervention_date_hour, String, null: true
      field :end_intervention_date_hour, String, null: true
      field :result, String, null: true
      field :report, String, null: true
      field :status, String, null: true
    end
end