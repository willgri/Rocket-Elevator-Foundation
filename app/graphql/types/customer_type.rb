module Types
    class CustomerType < BaseObject
      field :id, ID, null: false
      field :address_id, ID, null: false
      field :admins_id, String, null: false
      field :date_of_creation, String, null: false
      field :business_name, String, null: false
      field :full_name, String, null: false
      field :phone_number, String, null: false
      field :email, String, null: false
      field :technical_ressource_phone_number, String, null: false
      field :technical_ressource_email, String, null: false
      field :created_at, String, null: false
      field :updated_at, String, null: false
    end
end