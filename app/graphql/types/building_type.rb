module Types
    class BuildingType < BaseObject
      field :id, ID, null: false
      field :customer_id, ID, null: false
      field :address_id, ID, null: false
      field :building_admin_full_name, String, null: false
      field :building_admin_email, String, null: false
      field :building_admin_phone_number, String, null: false
      field :technical_ressource_full_name, String, null: false
      field :technical_ressource_phone_number, String, null: false
      field :technical_ressource_email, String, null: false
      field :created_at, String, null: false
      field :updated_at, String, null: false
    end
end