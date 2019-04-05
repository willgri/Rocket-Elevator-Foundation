module Types
  class QueryType < BaseObject
    
    # Will show all intervention in a graphQL query
    field :all_interventions, [InterventionType], null: false

    def all_interventions(id: nil)
      Intervention.all
    end

    # Will show all buildings in a graphQL query    
    field :all_buildings, [BuildingType], null: false

    def all_buildings(id: nil)
      Building.all
    end
  
    # Will show all building Details in a graphQL query
    field :all_details, [BuildingDetailType], null: false

    def all_details
      BuildingDetail.all
    end
 
    # Will show all addresses in a graphQL query
    field :all_addresses, [AddressType], null: false

    def all_addresses
      Address.all
    end

    # Will show all customers in a graphQL query
    field :all_customers, [CustomerType], null: false

    def all_customers
      Customer.all
    end
    

    # Will show all employees(Admins) in a graphQL query
    field :all_employees, [AdminType], null: false

    def all_employees
      Admin.all
    end
    
    
    # will show one intervention according to the id: argument
    field :intervention_info, [InterventionType], null: false do
      argument :id, ID, required: true
    end

    def intervention_info(id: nil)
      Intervention.where(id: id)
    end

    # will show one building according to the id: argument
    field :building_info, [BuildingType], null: false do
      argument :id, ID, required: true
    end

    def building_info(id: nil)
      Building.where(id: id)
    end
     
    # will show one address according to the id: argument
    field :address_info, [AddressType], null: false do
      argument :id, ID, required: true
    end

    def address_info(id: nil)
      Address.where(id: id)
    end

    # will show one building detail according to the id: argument
    field :building_details_info, [BuildingDetailType], null: false do
      argument :id, ID, required: true
    end

    def building_details_info(id: id)
      BuildingDetail.where(id: id)
    end

    # will show one employee according to the id: argument
    field :employee_info, [AdminType], null: false do
      argument :id, ID, required: true
    end

    def employee_info(id: id)
      Admin.where(id: id)
    end
    
  end
end
