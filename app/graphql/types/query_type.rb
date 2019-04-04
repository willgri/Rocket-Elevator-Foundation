module Types
  class QueryType < BaseObject

    field :all_interventions, [InterventionType], null: true do
      argument :id, ID, required: false
    end

    field :all_buildings, [BuildingType], null: true do
      argument :id, ID, required: false
    end

    field :all_addresses, [AddressType], null: true do
      argument :id, ID, required: false
    end

    field :all_details, [BuildingDetailType], null: true do
     argument :id, ID, required: false
    end

    field :all_customers, [CustomerType], null: true do
      argument :id, ID, required: false
    end

    field :all_admins, [AdminType], null: true do
      argument :id, ID, required: false
    end



    def all_interventions(id: nil)
      if id
        Intervention.where(id: id)
      else
        Intervention.all
      end
    end

    def all_buildings(id: nil)
      if id
        Building.where(id: id)
      else
        Building.all
      end
    end

    def all_addresses(id: nil)
      if id
        Address.where(id: id)
      else
        Address.all
      end
    end

    def all_details(id: nil)
      if id
        BuildingDetail.where(id: id)
      else
        BuildingDetail.all
      end
    end

    def all_customers(id: nil)
      if id
        Customer.where(id: id)
      else
        Customer.all
        Address.all
      end
    end

    def all_admins(id: nil)
      if id
        Admin.where(id: id)
      else
        Admin.all
      end
    end

  end
end
