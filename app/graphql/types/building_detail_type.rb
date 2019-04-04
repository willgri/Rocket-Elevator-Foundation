module Types
    class BuildingDetailType < BaseObject

       # id,building_id,information_key,value,created_at,updated_at
        
       field :id, ID, null: false
       field :building, BuildingType, null: false
       field :information_key, String, null: false
       field :value, String, null: false
       field :created_at, String, null: false
       field :updated_at, String, null: false

    end
end