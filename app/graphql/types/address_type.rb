module Types
    class AddressType < BaseObject

        field :id, ID, null: false
        field :address_type, String, null: false
        field :status, String, null: false
        field :entity, String, null: false
        field :adress, String, null: false
        field :appartment, String, null: false
        field :city, String, null: false
        field :postal_code, String, null: false
        field :country, String, null: false
        field :notes, String, null: false
        field :created_at, String, null: false
        field :updated_at, String, null: false
    end
end