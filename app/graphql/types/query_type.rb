module Types
  class QueryType < BaseObject
    
    field :all_interventions, [InterventionType], null: false

    def all_interventions(id: nil)
      Intervention.all
    end

    field :all_buildings, [BuildingType], null: false

    def all_buildings(id: nil)
      Building.all
    end
  
    field :all_details, [BuildingDetailType], null: false

    def all_details
      BuildingDetail.all
    end
 
    field :all_addresses, [AddressType], null: false

    def all_addresses
      Address.all
    end

    field :all_customers, [CustomerType], null: false

    def all_customers
      Customer.all
    end
    
    field :all_employees, [AdminType], null: false

    def all_employees
      Admin.all
    end
    
    
    
    field :intervention_info, [InterventionType], null: false do
      argument :id, ID, required: true
    end

    def intervention_info(id: nil)
      Intervention.where(id: id)
    end

    
    field :building_info, [BuildingType], null: false do
      argument :id, ID, required: true
    end

    def building_info(id: nil)
      Building.where(id: id)
    end
    
    field :address_info, [AddressType], null: false do
      argument :id, ID, required: true
    end

    def address_info(id: nil)
      Address.where(id: id)
    end

    field :building_details_info, [BuildingDetailType], null: false do
      argument :id, ID, required: true
    end

    def building_details_info(id: id)
      BuildingDetail.where(id: id)
    end

    field :employee_info, [AdminType], null: false do
      argument :id, ID, required: true
    end

    def employee_info(id: id)
      Admin.where(id: id)
    end
    
  end
end
